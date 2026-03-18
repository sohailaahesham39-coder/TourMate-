<div align="center">

<img src="assets/icons/icon.png" alt="Tour Mate Logo" width="100" height="100" style="border-radius: 20px;" />

# ✈️ Tour Mate

### *Your smart travel companion — explore, book, and experience the world effortlessly.*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7.2-0175C2?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore%20%7C%20FCM-FFCA28?logo=firebase)](https://firebase.google.com)
[![Google Maps](https://img.shields.io/badge/Google%20Maps-API-4285F4?logo=googlemaps)](https://developers.google.com/maps)
[![Stripe](https://img.shields.io/badge/Stripe-Payments-635BFF?logo=stripe)](https://stripe.com)
[![Twilio](https://img.shields.io/badge/Twilio-Chat-F22F46?logo=twilio)](https://twilio.com)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey?logo=flutter)](https://flutter.dev)

</div>

---

## 📖 About Tour Mate

**Tour Mate** is a full-featured travel planning and booking Flutter application that unifies flights, hotels, activities, cruises, and transport bookings in one platform. Travelers can discover destinations, check-in at landmarks, earn achievements on a leaderboard, chat with support, and pay securely — all in a single app.

Built as a graduation project at **Sadat Academy for Management and Sciences**, Tour Mate stands out with its **multi-language support (English & Arabic)**, **gamification system** (check-ins + leaderboard), and **built-in advertising module** for tourism businesses.

---

## 🚀 Key Features

- ✈️ **Complete Travel Booking** — Book flights, hotels, activities, transport, and cruises all in one place
- 🗺️ **Google Maps Navigation** — Location-based recommendations, route planning, and nearby attraction discovery
- 📍 **Landmark Check-ins** — Check in at destinations to earn achievements and climb the leaderboard
- 🏆 **Gamification & Leaderboard** — Points system and achievements to reward active travelers
- 💳 **Secure Payments** — Stripe-powered payment gateway for all bookings (PCI-DSS compliant)
- 💬 **In-App Chat** — Real-time communication with travel agents and support via Twilio API
- 🔔 **Push Notifications** — Booking confirmations, travel deals, and trip reminders via Firebase FCM
- ⭐ **Review & Rating System** — User-generated reviews for destinations, hotels, and services
- 📢 **Advertising Module** — Tourism businesses can promote services and deals in-app
- 🌍 **Multi-Language Support** — Full English & Arabic interface for global accessibility
- 🎭 **Personalized Recommendations** — Travel suggestions based on user preferences and history
- 🔐 **Secure Authentication** — Firebase Auth with email/password and Google Sign-In
- ✨ **Animated UI** — Lottie animations and smooth transitions for a premium feel
- 💾 **Persistent Sessions** — User preferences stored with Shared Preferences

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | Flutter 3.x / Dart 3.7.2 |
| **State Management** | Provider 6.x |
| **Authentication** | Firebase Auth + Google Sign-In |
| **Database** | Cloud Firestore (real-time NoSQL) |
| **Backend Logic** | Firebase Cloud Functions |
| **Push Notifications** | Firebase Cloud Messaging (FCM) |
| **Maps & Location** | Google Maps API |
| **Payments** | Stripe API (PCI-DSS compliant) |
| **Chat & Communication** | Twilio API |
| **Animations** | Lottie |
| **Local Storage** | Shared Preferences |
| **Design Tools** | Figma + Adobe XD |
| **Version Control** | Git & GitHub |
| **App Icon** | Flutter Launcher Icons |

---

## 🏗️ Project Structure

```
tour_matee/
├── lib/
│   ├── core/                        # App-wide utilities, theme & constants
│   │   ├── theme/                   # Blue gradient palette, text styles
│   │   ├── utils/                   # Helpers, validators, formatters
│   │   └── localization/            # English & Arabic translations
│   ├── data/                        # Data layer
│   │   ├── models/                  # Destination, Hotel, Flight, Booking, User models
│   │   └── repositories/            # Firestore & API repositories
│   ├── providers/                   # Provider state management
│   │   ├── auth_provider.dart       # Firebase Auth + Google Sign-In state
│   │   ├── booking_provider.dart    # Booking flow state
│   │   └── map_provider.dart        # Location & recommendations state
│   ├── screens/                     # Feature-based UI screens
│   │   ├── splash/                  # Splash / logo screen
│   │   ├── auth/                    # Login & Register screens
│   │   ├── home/                    # Main home with featured destinations
│   │   ├── search/                  # Search & filter travel services
│   │   ├── destinations/            # Destination details & attractions
│   │   ├── hotels/                  # Hotel listing & room details
│   │   ├── flights/                 # Flight search & booking
│   │   ├── activities/              # Activity details & booking
│   │   ├── transport/               # Transport booking screen
│   │   ├── cruises/                 # Cruise listing & booking
│   │   ├── booking/                 # Full booking flow & confirmation
│   │   ├── payment/                 # Stripe payment screen
│   │   ├── map/                     # Google Maps + nearby attractions
│   │   ├── checkin/                 # Landmark check-in & achievements
│   │   ├── leaderboard/             # Gamification leaderboard
│   │   ├── chat/                    # Twilio-powered support chat
│   │   ├── notifications/           # FCM notification center
│   │   ├── reviews/                 # Ratings & user reviews
│   │   ├── ads/                     # Tourism business advertisements
│   │   └── profile/                 # User profile & booking history
│   ├── widgets/                     # Reusable UI components
│   │   ├── destination_card.dart    # Animated destination card
│   │   ├── booking_summary.dart     # Booking details summary widget
│   │   └── lottie_loader.dart       # Lottie animation loader
│   └── main.dart                    # App entry point & Firebase init
├── assets/
│   └── icons/
│       └── icon.png
├── pubspec.yaml
└── README.md
```

> 📌 The project follows a **feature-first layered architecture** with Provider state management, supporting multi-language (English & Arabic) from the ground up.

---

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK `^3.7.2` — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK `^3.7.2`
- Android Studio / Xcode
- Firebase project with Auth, Firestore, Cloud Functions & FCM enabled
- Google Maps API key
- Stripe account with publishable key
- Twilio account for chat features

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/tour-mate.git
cd tour_matee

# 2. Install dependencies
flutter pub get

# 3. Configure Firebase
# - Place google-services.json in android/app/
# - Place GoogleService-Info.plist in ios/Runner/

# 4. Add API Keys
# - Google Maps API key in AndroidManifest.xml & AppDelegate.swift
# - Stripe publishable key in payment configuration
# - Twilio credentials in chat configuration

# 5. Generate app icons
dart run flutter_launcher_icons

# 6. Run the app
flutter run
```

---

## 🗃️ Database Design (ERD Summary)

| Entity | Key Attributes |
|---|---|
| **User** | userID (PK), name, email, language, preferences, points |
| **Destination** | destID (PK), name, location, category, rating, description |
| **Booking** | bookingID (PK), userID (FK), serviceType, date, status, amount |
| **Review** | reviewID (PK), userID (FK), destID (FK), rating, comment |
| **CheckIn** | checkinID (PK), userID (FK), destID (FK), timestamp, points |
| **Advertisement** | adID (PK), businessName, content, targetAudience, startDate |

---

## 🎓 Academic Context

> **Graduation Project** — Sadat Academy for Management and Sciences, Faculty of Management Sciences, Major: BIS
>
> **Supervisor:** Dr. Heba Sabry
>
> **Team:** Alaa Hamdi Fahmy Zaky · Adham Mustafa Muhammed Alazab · Mohamed Khaled Mohamed Mahdy · Fathy Ahmed Fathy Khalifa

---

## 🔮 Future Roadmap

- 🤖 **AI Travel Recommendations** — Personalized suggestions based on history and preferences
- 🥽 **AR Navigation** — Augmented reality for exploring landmarks and attractions
- 🌐 **More Languages** — Expand beyond English & Arabic
- 📱 **Social Travel Feed** — Share experiences and reviews with other travelers
- 📴 **Offline Mode** — Access itineraries and maps without internet
- ⌚ **Wearable Integration** — Smartwatch alerts for flights and activities
- 🎁 **Loyalty & Rewards** — Earn discounts for frequent bookings and referrals

---

<div align="center">
  <sub>Built with 💙 using Flutter · Powered by Firebase, Google Maps & Stripe · Designed in Figma</sub><br/>
  <sub>⭐ Star this repo if you found it helpful!</sub>
</div>
