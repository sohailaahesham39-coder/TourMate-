import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/ThemeProvider.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile header
            Center(
              child: Column(
                children: [
                  // Profile image
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // User name
                  Text(
                    'Sarah Johnson',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // User email
                  Text(
                    'sarah.johnson@example.com',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatItem(context, '12', 'Trips'),
                      Container(
                        height: 40,
                        width: 1,
                        color: isDarkMode ? Colors.white24 : Colors.black12,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      _buildStatItem(context, '24', 'Bookmarks'),
                      Container(
                        height: 40,
                        width: 1,
                        color: isDarkMode ? Colors.white24 : Colors.black12,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      _buildStatItem(context, '8', 'Reviews'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Section: Account Settings
            _buildSectionTitle(context, 'Account Settings'),

            const SizedBox(height: 16),

            // List of account settings
            _buildSettingsItem(
              context,
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {
                // Navigate to personal information
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.lock_outline,
              title: 'Security & Privacy',
              onTap: () {
                // Navigate to security and privacy
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
              onTap: () {
                // Navigate to payment methods
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {
                // Navigate to notifications
              },
            ),

            const SizedBox(height: 24),

            // Section: Preferences
            _buildSectionTitle(context, 'Preferences'),

            const SizedBox(height: 16),

            // Theme mode toggle
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dark Mode',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Switch between light and dark theme',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Language selection
            _buildSettingsItem(
              context,
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              onTap: () {
                // Navigate to language settings
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.attach_money,
              title: 'Currency',
              subtitle: 'USD (\$)',
              onTap: () {
                // Navigate to currency settings
              },
            ),

            const SizedBox(height: 24),

            // Section: Support
            _buildSectionTitle(context, 'Support'),

            const SizedBox(height: 16),

            _buildSettingsItem(
              context,
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {
                // Navigate to help center
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.info_outline,
              title: 'About Us',
              onTap: () {
                // Navigate to about us
              },
            ),

            _buildSettingsItem(
              context,
              icon: Icons.star_outline,
              title: 'Rate the App',
              onTap: () {
                // Open app rating
              },
            ),

            const SizedBox(height: 32),

            // Logout button
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Show logout confirmation dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Logout'),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.logout),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Version info
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: isDarkMode ? Colors.white54 : Colors.black45,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black54,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      title,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        String? subtitle,
        required VoidCallback onTap,
      }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle,
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black54,
            fontSize: 14,
          ),
        )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isDarkMode ? Colors.white54 : Colors.black45,
          size: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
      ),
    );
  }
}