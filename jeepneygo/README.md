# JeepneyGo

Real-time jeepney transport monitoring system for Lipa City, Batangas.

## Architecture: Web PWA

All apps are Progressive Web Apps (PWAs) that run in the browser and can be installed to the home screen for a native-like experience.

**Why PWA?**
- Zero cost deployment (no App Store fees)
- Works on iOS Safari, Android Chrome, and Desktop
- No Mac required for development
- Instant updates without app store review

## Project Structure

```
jeepneygo/
├── apps/
│   ├── driver_app/       # Driver PWA (mount phone on dashboard)
│   ├── commuter_app/     # Commuter PWA (track jeepneys)
│   └── admin_dashboard/  # Admin web dashboard
├── packages/
│   ├── jeepneygo_core/   # Shared models, repositories, services
│   └── jeepneygo_ui/     # Shared theme, design tokens, widgets
├── firebase.json         # Firebase Hosting config (multi-site)
├── firestore.rules       # Firestore security rules
├── melos.yaml            # Monorepo configuration
├── pubspec.yaml          # Workspace root
└── analysis_options.yaml # Linting rules
```

## Getting Started

### Prerequisites

- Flutter 3.32.1 or later
- Dart 3.8.0 or later
- Chrome browser (for development)
- Firebase CLI (`npm install -g firebase-tools`)

### Setup

1. **Install Melos** (monorepo management tool):
   ```bash
   dart pub global activate melos
   ```

2. **Bootstrap the project** (links all packages and installs dependencies):
   ```bash
   melos bootstrap
   ```

3. **Generate code** (models, freezed classes):
   ```bash
   melos build_runner
   ```

4. **Configure Firebase**:
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Enable Authentication (Phone provider)
   - Enable Cloud Firestore
   - Add Firebase web config to each app's `web/index.html`

5. **Add Google Maps JavaScript API key**:
   - Get an API key from [Google Cloud Console](https://console.cloud.google.com)
   - Enable "Maps JavaScript API"
   - Add to each app's `web/index.html`

## Running the Apps

### Driver App (Chrome)
```bash
melos run:driver
# Or manually:
cd apps/driver_app && flutter run -d chrome
```

### Commuter App (Chrome)
```bash
melos run:commuter
# Or manually:
cd apps/commuter_app && flutter run -d chrome
```

### Admin Dashboard
```bash
melos run:admin
# Or manually:
cd apps/admin_dashboard && flutter run -d chrome
```

### Test on Phone (same WiFi network)
```bash
# Serve on local network - access from phone browser
cd apps/driver_app && flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
# Then open http://<your-computer-ip>:8080 on your phone
```

## Common Commands

```bash
# Analyze all packages
melos analyze

# Format all code
melos format

# Run all tests
melos test

# Clean all packages
melos clean

# Build all web apps for production
melos run build:web:all

# Build individual apps
melos run build:web:driver
melos run build:web:commuter
melos run build:web:admin
```

## Deploy to Firebase Hosting

```bash
# Login to Firebase
firebase login

# Deploy all apps
firebase deploy --only hosting

# Deploy individual apps
firebase deploy --only hosting:driver
firebase deploy --only hosting:commuter
firebase deploy --only hosting:admin
```

## Architecture

- **Platform**: Web PWA (Progressive Web Apps)
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Backend**: Firebase (Auth, Firestore, Hosting)
- **Maps**: Google Maps JavaScript API
- **Data Serialization**: Freezed + JSON Serializable

## Platform Support

| Platform       | Driver App | Commuter App | Admin Dashboard |
|----------------|------------|--------------|-----------------|
| iOS Safari     | ✅ PWA     | ✅ PWA       | ✅              |
| Android Chrome | ✅ PWA     | ✅ PWA       | ✅              |
| Desktop Chrome | ✅         | ✅           | ✅ Primary      |

## PWA Installation

**iPhone/iPad (Safari):**
1. Open the app URL in Safari
2. Tap the Share button
3. Tap "Add to Home Screen"

**Android (Chrome):**
1. Open the app URL in Chrome
2. Tap the menu (3 dots)
3. Tap "Add to Home Screen" or "Install App"

## Documentation

See the `docs/` folder for detailed documentation:
- [PRD](../docs/00-PRD-JeepneyGo.md)
- [Requirements](../docs/01-requirements.md)
- [Wireframe Specifications](../docs/08-wireframe-specifications.md)
- [Sprint Plan](../docs/05-sprint-milestone-plan.md)

## License

Private - All rights reserved.
