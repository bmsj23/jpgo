# JeepneyGo: Learning Resources List

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Pre-Development Learning Path (Weeks 1-2)

**Goal:** Get the team up to speed with Flutter + Firebase fundamentals before coding.

### 1.1 Recommended Learning Schedule

| Day | Focus Area | Hours | Resources |
|-----|------------|-------|-----------|
| Day 1 | Dart basics | 4 | DartPad exercises |
| Day 2 | Flutter setup + first app | 4 | Flutter codelab |
| Day 3 | Widgets & layouts | 4 | Widget catalog, layout cheat sheet |
| Day 4 | Firebase setup + auth | 4 | Firebase Flutter codelab |
| Day 5 | Firestore basics | 4 | Firestore docs + practice |
| Day 6-7 | Build mini practice app | 8 | Combine learnings |

---

## 2. Flutter Fundamentals

### 2.1 Official Documentation

| Resource | Description | Link | Priority |
|----------|-------------|------|----------|
| Flutter Get Started | Official installation guide | https://docs.flutter.dev/get-started | Must |
| Flutter Codelab | Build your first Flutter app | https://docs.flutter.dev/get-started/codelab | Must |
| Widget Catalog | Reference for all widgets | https://docs.flutter.dev/ui/widgets | Must |
| Layout Guide | Understanding Flutter layouts | https://docs.flutter.dev/ui/layout | Must |

### 2.2 Video Tutorials

| Resource | Creator | Duration | Link | Priority |
|----------|---------|----------|------|----------|
| Flutter Crash Course | Traversy Media | 1 hour | YouTube | Recommended |
| Flutter Tutorial for Beginners | The Net Ninja | 4 hours | YouTube | Recommended |
| Flutter & Dart Complete Guide | Maximilian | 40+ hours | Udemy (paid) | Optional |

### 2.3 Cheat Sheets

| Resource | Description | Link |
|----------|-------------|------|
| Flutter Layout Cheat Sheet | Visual guide to layouts | Medium article |
| Flutter Widget Cheat Sheet | Common widgets reference | GitHub |
| Dart Cheat Sheet | Dart syntax quick reference | https://dart.dev/resources/dart-cheatsheet |

---

## 3. Dart Language

### 3.1 Core Resources

| Resource | Type | Duration | Link |
|----------|------|----------|------|
| Dart Language Tour | Documentation | 2 hours | https://dart.dev/language |
| DartPad | Interactive editor | Self-paced | https://dartpad.dev |
| Dart Programming Tutorial | Video (freeCodeCamp) | 4 hours | YouTube |
| Effective Dart | Style guide | 1 hour | https://dart.dev/effective-dart |

### 3.2 Key Concepts to Master

- [ ] Variables and data types
- [ ] Functions and parameters
- [ ] Classes and objects
- [ ] Null safety
- [ ] Async/await and Futures
- [ ] Streams (important for real-time data)
- [ ] Collections (List, Map, Set)

---

## 4. Firebase Essentials

### 4.1 Core Firebase

| Resource | Type | Duration | Link |
|----------|------|----------|------|
| Firebase Flutter Codelab | Tutorial | 2 hours | https://firebase.google.com/codelabs/firebase-get-to-know-flutter |
| FlutterFire Overview | Documentation | 30 min | https://firebase.flutter.dev/docs/overview |
| Firebase Console Guide | Documentation | 30 min | https://firebase.google.com/docs/projects/learn-more |

### 4.2 Firebase Authentication

| Resource | Type | Description | Link |
|----------|------|-------------|------|
| Firebase Auth Overview | Docs | FlutterFire auth setup | https://firebase.flutter.dev/docs/auth/overview |
| Phone Authentication | Docs | OTP verification | https://firebase.flutter.dev/docs/auth/phone |
| Auth State Changes | Docs | Listening to auth state | https://firebase.flutter.dev/docs/auth/start |

### 4.3 Cloud Firestore

| Resource | Type | Description | Link |
|----------|------|-------------|------|
| Firestore Overview | Docs | Getting started | https://firebase.flutter.dev/docs/firestore/overview |
| Firestore Data Modeling | Video | Structuring data | YouTube: Firebase channel |
| Real-time Listeners | Docs | Listening for changes | https://firebase.flutter.dev/docs/firestore/usage#realtime-changes |
| Firestore Security Rules | Docs | Securing your data | https://firebase.google.com/docs/firestore/security/get-started |

### 4.4 Firebase Cloud Messaging

| Resource | Type | Description | Link |
|----------|------|-------------|------|
| FCM Overview | Docs | Push notifications setup | https://firebase.flutter.dev/docs/messaging/overview |
| FCM with Flutter | Tutorial | Complete guide | YouTube |

---

## 5. Feature-Specific Resources

### 5.1 GPS & Location Tracking

| Resource | Description | Link |
|----------|-------------|------|
| Geolocator Package | Official docs | https://pub.dev/packages/geolocator |
| permission_handler | Managing permissions | https://pub.dev/packages/permission_handler |
| Background Location | Background tracking guide | Search: "Flutter background location" |
| Location Best Practices | Battery optimization | Android/iOS developer docs |

### 5.2 Google Maps Integration

| Resource | Description | Link |
|----------|-------------|------|
| google_maps_flutter | Official package | https://pub.dev/packages/google_maps_flutter |
| Google Maps Platform | API key setup | https://developers.google.com/maps/documentation |
| Maps API Pricing | Understanding costs | https://cloud.google.com/maps-platform/pricing |
| Custom Markers | Adding custom markers | YouTube tutorials |

### 5.3 State Management (Provider)

| Resource | Description | Link |
|----------|-------------|------|
| Provider Package | Official docs | https://pub.dev/packages/provider |
| Simple State Management | Flutter official | https://docs.flutter.dev/data-and-backend/state-mgmt/simple |
| Provider Tutorial | Video guide | YouTube: Fireship |

### 5.4 Navigation (GoRouter)

| Resource | Description | Link |
|----------|-------------|------|
| go_router Package | Official docs | https://pub.dev/packages/go_router |
| Navigation Guide | Flutter official | https://docs.flutter.dev/ui/navigation |
| Deep Linking | Handling deep links | GoRouter documentation |

---

## 6. Development Tools

### 6.1 Required Software

| Tool | Purpose | Download Link |
|------|---------|---------------|
| Flutter SDK | Development framework | https://docs.flutter.dev/get-started/install |
| Android Studio | Android SDK & emulator | https://developer.android.com/studio |
| VS Code | Code editor (recommended) | https://code.visualstudio.com |
| Git | Version control | https://git-scm.com |
| Chrome | Web debugging | https://www.google.com/chrome |

### 6.2 VS Code Extensions

| Extension | Purpose |
|-----------|---------|
| Flutter | Flutter development support |
| Dart | Dart language support |
| Firebase Explorer | Browse Firebase data |
| GitLens | Git integration |
| Error Lens | Inline error display |
| Bracket Pair Colorizer | Code readability |

### 6.3 Useful CLI Commands

```bash
# Flutter
flutter doctor          # Check setup
flutter create app_name # Create new project
flutter run             # Run app
flutter build apk       # Build Android APK
flutter pub get         # Install dependencies
flutter clean           # Clean build files

# Firebase
firebase login          # Login to Firebase
firebase init           # Initialize Firebase project
firebase deploy         # Deploy to Firebase Hosting
flutterfire configure   # Configure FlutterFire

# Git
git status              # Check status
git add .               # Stage all changes
git commit -m "message" # Commit changes
git push                # Push to remote
git pull                # Pull from remote
```

---

## 7. Design & UI Resources

### 7.1 Design Tools

| Tool | Purpose | Link |
|------|---------|------|
| Figma | UI/UX design | https://www.figma.com |
| Canva | Quick graphics | https://www.canva.com |
| Material Design | Design guidelines | https://m3.material.io |

### 7.2 Icon & Asset Resources

| Resource | Type | Link |
|----------|------|------|
| Material Icons | Icon library | https://fonts.google.com/icons |
| Flutter Icons | Icon packages | https://pub.dev/packages/flutter_icons |
| Undraw | Illustrations | https://undraw.co |
| Unsplash | Stock photos | https://unsplash.com |

### 7.3 Color & Theme

| Resource | Description | Link |
|----------|-------------|------|
| Material Theme Builder | Generate color schemes | https://m3.material.io/theme-builder |
| Coolors | Color palette generator | https://coolors.co |
| ColorHunt | Color palettes | https://colorhunt.co |

---

## 8. Testing Resources

### 8.1 Flutter Testing

| Resource | Type | Link |
|----------|------|------|
| Testing Flutter Apps | Official guide | https://docs.flutter.dev/testing |
| Widget Testing | Tutorial | Flutter documentation |
| Integration Testing | Tutorial | Flutter documentation |

### 8.2 Testing Packages

| Package | Purpose | Link |
|---------|---------|------|
| flutter_test | Unit & widget testing | Built-in |
| mockito | Mocking dependencies | https://pub.dev/packages/mockito |
| integration_test | Integration testing | Built-in |

---

## 9. Recommended Flutter Packages

### 9.1 Core Packages for JeepneyGo

| Package | Purpose | Priority |
|---------|---------|----------|
| firebase_core | Firebase initialization | Must |
| firebase_auth | Authentication | Must |
| cloud_firestore | Database | Must |
| firebase_messaging | Push notifications | Should |
| google_maps_flutter | Maps display | Must |
| geolocator | GPS location | Must |
| provider | State management | Must |
| go_router | Navigation | Must |
| shared_preferences | Local storage | Should |
| connectivity_plus | Network status | Should |
| intl | Internationalization | Should |
| fl_chart | Charts for analytics | Should |

### 9.2 UI Packages

| Package | Purpose | Priority |
|---------|---------|----------|
| flutter_svg | SVG support | Should |
| cached_network_image | Image caching | Should |
| shimmer | Loading placeholders | Could |
| flutter_spinkit | Loading indicators | Could |

---

## 10. Community & Support

### 10.1 Official Channels

| Resource | Description | Link |
|----------|-------------|------|
| Flutter Discord | Community chat | https://discord.gg/flutter |
| r/FlutterDev | Reddit community | https://reddit.com/r/FlutterDev |
| Stack Overflow | Q&A | Tag: flutter |
| Flutter GitHub | Issue tracking | https://github.com/flutter/flutter |

### 10.2 Blogs & News

| Resource | Description | Link |
|----------|-------------|------|
| Flutter Blog | Official blog | https://medium.com/flutter |
| Flutter Weekly | Newsletter | https://flutterweekly.net |
| FilledStacks | Tutorials | https://www.filledstacks.com |

---

## 11. Quick Reference Card

### 11.1 Daily Commands

```bash
# Start of day
git pull origin main
flutter pub get

# During development
flutter run
flutter hot-reload  # Press 'r' in terminal

# End of day
git add .
git commit -m "Description of changes"
git push
```

### 11.2 Common Widget Patterns

```dart
// Stateless Widget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Stateful Widget
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Listen to Firestore
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('trips').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) return Text('Error');
    if (!snapshot.hasData) return CircularProgressIndicator();
    return ListView(children: snapshot.data!.docs.map((doc) => Text(doc.id)).toList());
  },
)
```

### 11.3 Firestore Operations

```dart
// Create
await FirebaseFirestore.instance.collection('users').add({'name': 'Juan'});

// Read
final doc = await FirebaseFirestore.instance.collection('users').doc('id').get();

// Update
await FirebaseFirestore.instance.collection('users').doc('id').update({'name': 'Pedro'});

// Delete
await FirebaseFirestore.instance.collection('users').doc('id').delete();

// Listen
FirebaseFirestore.instance.collection('users').snapshots().listen((snapshot) {
  // Handle changes
});
```
