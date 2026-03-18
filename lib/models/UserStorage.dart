import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Constants for SharedPreferences keys (for additional user data if needed)
  static const String _nameKey = 'user_name';
  static const String _resetCodeKey = 'reset_code';

  // Initialize SharedPreferences (for non-auth related data)
  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  // Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Register a new user with email and password
  static Future<UserCredential> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with display name
      await userCredential.user?.updateDisplayName(name);

      // Store name in SharedPreferences as well
      final prefs = await _getPrefs();
      await prefs.setString(_nameKey, name);

      return userCredential;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  // Sign in with email and password
  static Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Begin the Google sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return null;
      }

      // Obtain the auth details from the Google account
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential for Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  // Send password reset email
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }

  // Update user's password
  static Future<void> updatePassword(String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      } else {
        throw Exception('User not signed in');
      }
    } catch (e) {
      throw Exception('Failed to update password: $e');
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut(); // Sign out from Google
      await _auth.signOut(); // Sign out from Firebase
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  // Save reset code (if you're using your own verification system)
  static Future<void> saveResetCode(String code) async {
    try {
      final prefs = await _getPrefs();
      await prefs.setString(_resetCodeKey, code);
    } catch (e) {
      throw Exception('Failed to save reset code: $e');
    }
  }

  // Retrieve reset code
  static Future<String?> getResetCode() async {
    try {
      final prefs = await _getPrefs();
      return prefs.getString(_resetCodeKey);
    } catch (e) {
      throw Exception('Failed to get reset code: $e');
    }
  }

  // Get user information as a map
  static Future<Map<String, dynamic>> getUserInfo() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return {
          'uid': user.uid,
          'name': user.displayName,
          'email': user.email,
          'phoneNumber': user.phoneNumber,
          'photoUrl': user.photoURL,
          'emailVerified': user.emailVerified,
        };
      }
      return {};
    } catch (e) {
      throw Exception('Failed to get user info: $e');
    }
  }

  // For backward compatibility with your current code
  static Future<void> saveUser({
    required String name,
    required String email,
    required String password,
  }) async {
    await registerWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
  }

  // For backward compatibility with your current code
  static Future<Map<String, String>?> getUser() async {
    final user = _auth.currentUser;
    if (user != null && user.email != null) {
      return {
        'name': user.displayName ?? '',
        'email': user.email!,
        // Note: We don't return password as Firebase doesn't store it in plain text
      };
    }
    return null;
  }

  // Update user profile
  static Future<void> updateProfile({String? displayName, String? photoURL}) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.updatePhotoURL(photoURL);

        // Also update in SharedPreferences if needed
        if (displayName != null) {
          final prefs = await _getPrefs();
          await prefs.setString(_nameKey, displayName);
        }
      } else {
        throw Exception('User not signed in');
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  // Clear all user data (for logout)
  static Future<void> clearUser() async {
    try {
      await signOut();
      final prefs = await _getPrefs();
      await prefs.remove(_nameKey);
      await prefs.remove(_resetCodeKey);
    } catch (e) {
      throw Exception('Failed to clear user: $e');
    }
  }
}