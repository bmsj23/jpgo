# JeepneyGo: Project Structure Diagram

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. High-Level Architecture

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                              JEEPNEYGO SYSTEM                                │
├──────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                         FIREBASE CLOUD                               │    │
│  │  ┌───────────────┐ ┌───────────────┐ ┌───────────────┐              │    │
│  │  │   Firebase    │ │   Cloud       │ │   Cloud       │              │    │
│  │  │   Auth        │ │   Firestore   │ │   Functions   │              │    │
│  │  │               │ │   (Realtime)  │ │   (Triggers)  │              │    │
│  │  └───────┬───────┘ └───────┬───────┘ └───────┬───────┘              │    │
│  │          │                 │                 │                       │    │
│  │  ┌───────┴─────────────────┴─────────────────┴───────┐              │    │
│  │  │              Firebase Hosting (Web Dashboard)      │              │    │
│  │  └───────────────────────────────────────────────────┘              │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                    │                                         │
│           ┌────────────────────────┼────────────────────────┐               │
│           │                        │                        │               │
│           ▼                        ▼                        ▼               │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐         │
│  │   DRIVER APP    │    │  COMMUTER APP   │    │  WEB DASHBOARD  │         │
│  │    (Flutter)    │    │    (Flutter)    │    │ (Flutter Web)   │         │
│  │                 │    │                 │    │                 │         │
│  │  • GPS Service  │    │  • Map View     │    │  • Fleet Map    │         │
│  │  • Trip Mgmt    │    │  • ETA Service  │    │  • Analytics    │         │
│  │  • Status Sync  │    │  • Notifications│    │  • CRUD Mgmt    │         │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘         │
│         │                       │                       │                   │
│         └───────────────────────┴───────────────────────┘                   │
│                                 │                                           │
│                    ┌────────────┴────────────┐                              │
│                    │    EXTERNAL SERVICES    │                              │
│                    │  • Google Maps API      │                              │
│                    │  • FCM (Push Notifs)    │                              │
│                    └─────────────────────────┘                              │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Flutter Project Structure (Monorepo)

```
jeepneygo/
├── lib/
│   ├── core/                          # Shared core functionality
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_strings.dart
│   │   │   └── firebase_constants.dart
│   │   ├── errors/
│   │   │   ├── exceptions.dart
│   │   │   └── failures.dart
│   │   ├── services/
│   │   │   ├── auth_service.dart         # Firebase Auth wrapper
│   │   │   ├── firestore_service.dart    # Firestore operations
│   │   │   ├── location_service.dart     # GPS handling
│   │   │   └── notification_service.dart # FCM handling
│   │   ├── utils/
│   │   │   ├── date_utils.dart
│   │   │   ├── location_utils.dart       # ETA calculations
│   │   │   └── validators.dart
│   │   └── widgets/                   # Shared UI components
│   │       ├── loading_indicator.dart
│   │       ├── error_dialog.dart
│   │       └── jeepney_marker.dart
│   │
│   ├── data/                          # Data layer
│   │   ├── models/
│   │   │   ├── user_model.dart
│   │   │   ├── vehicle_model.dart
│   │   │   ├── route_model.dart
│   │   │   ├── stop_model.dart
│   │   │   ├── trip_model.dart
│   │   │   └── location_update_model.dart
│   │   └── repositories/
│   │       ├── auth_repository.dart
│   │       ├── user_repository.dart
│   │       ├── vehicle_repository.dart
│   │       ├── route_repository.dart
│   │       └── trip_repository.dart
│   │
│   ├── features/                      # Feature modules
│   │   ├── auth/
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── login_screen.dart
│   │   │   │   │   ├── register_screen.dart
│   │   │   │   │   └── otp_verification_screen.dart
│   │   │   │   └── widgets/
│   │   │   └── providers/
│   │   │       └── auth_provider.dart
│   │   │
│   │   ├── driver/                    # Driver-specific features
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── driver_home_screen.dart
│   │   │   │   │   ├── trip_active_screen.dart
│   │   │   │   │   └── trip_history_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── trip_control_panel.dart
│   │   │   │       ├── passenger_counter.dart
│   │   │   │       └── connection_status.dart
│   │   │   └── providers/
│   │   │       ├── trip_provider.dart
│   │   │       └── location_broadcast_provider.dart
│   │   │
│   │   ├── commuter/                  # Commuter-specific features
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── commuter_home_screen.dart
│   │   │   │   │   ├── map_screen.dart
│   │   │   │   │   ├── route_details_screen.dart
│   │   │   │   │   └── stop_selection_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── jeepney_map.dart
│   │   │   │       ├── route_filter.dart
│   │   │   │       ├── eta_display.dart
│   │   │   │       └── fare_calculator.dart
│   │   │   └── providers/
│   │   │       ├── active_jeepneys_provider.dart
│   │   │       └── favorite_stops_provider.dart
│   │   │
│   │   └── admin/                     # Admin dashboard (web)
│   │       ├── presentation/
│   │       │   ├── screens/
│   │       │   │   ├── dashboard_screen.dart
│   │       │   │   ├── fleet_map_screen.dart
│   │       │   │   ├── drivers_management_screen.dart
│   │       │   │   ├── vehicles_management_screen.dart
│   │       │   │   ├── routes_management_screen.dart
│   │       │   │   └── analytics_screen.dart
│   │       │   └── widgets/
│   │       │       ├── sidebar_navigation.dart
│   │       │       ├── data_table.dart
│   │       │       └── stat_card.dart
│   │       └── providers/
│   │           ├── fleet_provider.dart
│   │           └── analytics_provider.dart
│   │
│   ├── router/                        # Navigation
│   │   └── app_router.dart               # GoRouter configuration
│   │
│   ├── main.dart                         # Mobile entry point
│   └── main_web.dart                     # Web entry point
│
├── android/                           # Android native config
├── ios/                               # iOS native config
├── web/                               # Web config
├── test/                              # Unit & widget tests
├── integration_test/                  # Integration tests
├── assets/
│   ├── images/
│   │   ├── jeepney_icon.png
│   │   ├── logo.png
│   │   └── map_markers/
│   ├── fonts/
│   └── lang/
│       ├── en.json
│       └── fil.json
│
├── firebase/                          # Firebase configuration
│   ├── functions/                     # Cloud Functions
│   │   ├── src/
│   │   │   ├── index.ts
│   │   │   ├── triggers/
│   │   │   │   └── on_trip_update.ts
│   │   │   └── scheduled/
│   │   │       └── cleanup_old_trips.ts
│   │   └── package.json
│   ├── firestore.rules
│   ├── firestore.indexes.json
│   └── firebase.json
│
├── pubspec.yaml                          # Flutter dependencies
├── analysis_options.yaml                 # Linting rules
└── README.md
```

---

## 3. Key Dependencies (pubspec.yaml)

```yaml
name: jeepneygo
description: Real-Time Jeepney Transport Monitoring System for Lipa City
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^2.24.0
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  firebase_messaging: ^14.7.0
  
  # State Management
  provider: ^6.1.1
  
  # Maps & Location
  google_maps_flutter: ^2.5.0
  geolocator: ^10.1.0
  geocoding: ^2.1.1
  
  # UI Components
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  
  # Utilities
  intl: ^0.18.1
  shared_preferences: ^2.2.2
  connectivity_plus: ^5.0.2
  
  # Navigation
  go_router: ^13.0.0
  
  # Charts (for analytics)
  fl_chart: ^0.66.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
  mockito: ^5.4.4
  build_runner: ^2.4.8

flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/lang/
  
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
```

---

## 4. Architecture Layers

### 4.1 Layer Responsibilities

| Layer | Responsibility | Examples |
|-------|----------------|----------|
| **Presentation** | UI widgets, screens, user interaction | `login_screen.dart`, `map_screen.dart` |
| **Providers** | State management, business logic | `auth_provider.dart`, `trip_provider.dart` |
| **Repository** | Data access abstraction | `user_repository.dart`, `trip_repository.dart` |
| **Services** | External service integration | `auth_service.dart`, `location_service.dart` |
| **Models** | Data structures | `user_model.dart`, `trip_model.dart` |
| **Core** | Shared utilities, constants | `app_colors.dart`, `validators.dart` |

### 4.2 Data Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                         USER INTERFACE                          │
│                     (Screens & Widgets)                         │
└─────────────────────────────────┬───────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────┐
│                          PROVIDERS                              │
│              (State Management & Business Logic)                │
└─────────────────────────────────┬───────────────────────────────┘
                                  │
                                  ▼
┌─────────────────────────────────────────────────────────────────┐
│                         REPOSITORIES                            │
│                   (Data Access Abstraction)                     │
└─────────────────────────────────┬───────────────────────────────┘
                                  │
                    ┌─────────────┴─────────────┐
                    ▼                           ▼
┌─────────────────────────────┐   ┌─────────────────────────────┐
│         SERVICES            │   │          MODELS             │
│   (Firebase, GPS, etc.)     │   │     (Data Structures)       │
└─────────────────────────────┘   └─────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                      EXTERNAL SERVICES                          │
│           (Firebase, Google Maps API, Device GPS)               │
└─────────────────────────────────────────────────────────────────┘
```

---

## 5. Module Descriptions

### 5.1 Core Module

| Component | Purpose |
|-----------|---------|
| `constants/` | App-wide constants (colors, strings, API keys) |
| `errors/` | Custom exception and failure classes |
| `services/` | Wrapper classes for external services |
| `utils/` | Helper functions (date formatting, validation) |
| `widgets/` | Reusable UI components |

### 5.2 Feature Modules

| Module | Target User | Key Screens |
|--------|-------------|-------------|
| `auth/` | All users | Login, Register, OTP Verification |
| `driver/` | Jeepney drivers | Home, Active Trip, Trip History |
| `commuter/` | Passengers | Map View, Route Details, Favorites |
| `admin/` | Operators/Admins | Dashboard, Fleet Map, Management |

### 5.3 Data Module

| Component | Purpose |
|-----------|---------|
| `models/` | Dart classes representing Firestore documents |
| `repositories/` | CRUD operations for each entity |

---

## 6. Firebase Project Structure

### 6.1 Cloud Functions

```
firebase/functions/
├── src/
│   ├── index.ts                    # Main entry, exports all functions
│   ├── triggers/
│   │   ├── on_trip_update.ts       # Triggered when trip status changes
│   │   └── on_user_create.ts       # Triggered when new user registers
│   └── scheduled/
│       ├── cleanup_old_trips.ts    # Daily cleanup of old trip data
│       └── generate_reports.ts     # Weekly report generation
├── package.json
└── tsconfig.json
```

### 6.2 Security Rules (firestore.rules)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == userId;
    }
    
    // Active trips - public read for commuters
    match /activeTrips/{tripId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
    
    // Routes - public read, admin write
    match /routes/{routeId} {
      allow read: if true;
      allow write: if isAdmin();
    }
  }
}
```
