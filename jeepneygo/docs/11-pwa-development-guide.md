# Web PWA Development Guide

This document explains how to develop, test, and deploy JeepneyGo as Progressive Web Apps (PWAs).

## Why PWA?

JeepneyGo uses a 100% Web PWA architecture:
- **Zero cost**: No Apple Developer ($99/year) or Google Play ($25) fees required
- **No Mac needed**: Build and test everything on Windows
- **Cross-platform**: Works on iOS Safari, Android Chrome, and Desktop browsers
- **Installable**: Users can "Add to Home Screen" for native-like experience
- **Instant updates**: No app store review process

## Development Workflow

### Running Apps Locally

**In Chrome (recommended for development):**
```bash
# driver app
cd apps/driver_app
flutter run -d chrome

# commuter app
cd apps/commuter_app
flutter run -d chrome

# admin dashboard
cd apps/admin_dashboard
flutter run -d chrome
```

### Testing on Your Phone (Same WiFi Network)

1. Find your computer's IP address:
   ```powershell
   ipconfig
   # look for "IPv4 Address" under your WiFi adapter (e.g., 192.168.1.100)
   ```

2. Run the app with network binding:
   ```bash
   cd apps/driver_app
   flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
   ```

3. On your phone, open the browser and go to:
   ```
   http://192.168.1.100:8080
   ```
   (replace with your actual IP address)

4. To test another app, use a different port:
   ```bash
   # commuter app on port 8081
   cd apps/commuter_app
   flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8081
   ```

## Installing as PWA

### iPhone/iPad (Safari)

1. Open the app URL in **Safari** (required for PWA on iOS)
2. Tap the **Share** button (square with arrow)
3. Scroll down and tap **"Add to Home Screen"**
4. Give it a name and tap **Add**
5. The app icon will appear on your home screen

**Important for Drivers:**
- Keep Safari in the foreground while on a trip
- The Wake Lock feature will try to keep the screen on
- Mount your phone where you can see it while driving

### Android (Chrome)

1. Open the app URL in **Chrome**
2. Tap the **menu** (three dots in corner)
3. Tap **"Add to Home Screen"** or **"Install App"**
4. The app will install and appear on your home screen

### Desktop (Chrome/Edge)

1. Open the app URL
2. Click the **install icon** in the address bar (or menu > Install)
3. The app will open in its own window

## Building for Production

```bash
# build all apps
cd apps/driver_app && flutter build web --release
cd apps/commuter_app && flutter build web --release
cd apps/admin_dashboard && flutter build web --release
```

The built files will be in each app's `build/web/` folder.

## Deploying to Firebase Hosting

### First-time Setup

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)

4. Update `.firebaserc` with your project name:
   ```json
   {
     "projects": {
       "default": "your-project-name"
     }
   }
   ```

5. Create hosting sites in Firebase Console:
   - `your-project-driver`
   - `your-project-commuter`
   - `your-project-admin`

6. Update `.firebaserc` targets to match your site names

### Deploying

```bash
# build all apps first
melos run build:web:all

# deploy all apps
firebase deploy --only hosting

# deploy individual app
firebase deploy --only hosting:driver
firebase deploy --only hosting:commuter
firebase deploy --only hosting:admin
```

### Free Tier Limits

Firebase Hosting free tier includes:
- 10 GB storage
- 360 MB/day data transfer (about 10,000+ page loads)
- SSL certificates included
- Custom domain support

For a university project, this is more than enough.

## PWA Features

### Wake Lock (Driver App)

The driver app includes a Wake Lock service to keep the screen on during trips.

Usage in code:
```dart
import 'package:jeepneygo_core/jeepneygo_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// in a ConsumerWidget or ConsumerStatefulWidget
final wakeLockService = ref.read(wakeLockServiceProvider);

// request wake lock when starting a trip
await wakeLockService.requestWakeLock();

// release when ending a trip
await wakeLockService.releaseWakeLock();

// or toggle
await wakeLockService.toggleWakeLock();
```

**Note**: Wake Lock works in Chrome and Safari on supported devices. Some browsers may not support it.

### Geolocation (Web)

The existing `LocationService` in `jeepneygo_core` uses the Geolocator package, which supports web. Location permissions will be requested through the browser.

**iOS Safari Limitation**: Background location is not available in PWAs. The driver must keep the app in the foreground.

### Offline Support

Flutter web apps include a service worker for caching. The app will work offline for cached pages, but real-time data requires an internet connection.

## Browser Support

| Browser | Driver App | Commuter App | Admin |
|---------|------------|--------------|-------|
| iOS Safari | Full PWA | Full PWA | Works |
| Android Chrome | Full PWA | Full PWA | Works |
| Desktop Chrome | Full PWA | Full PWA | Full PWA |
| Desktop Edge | Full PWA | Full PWA | Full PWA |
| Desktop Firefox | Works | Works | Works |

## Troubleshooting

### App not updating after changes

Clear the browser cache or do a hard refresh:
- Windows: `Ctrl + Shift + R`
- Mac: `Cmd + Shift + R`
- Mobile: Clear browser data in settings

### Wake Lock not working

Check if your browser supports Wake Lock:
```javascript
// in browser console
navigator.wakeLock !== undefined
```

### Location permission denied

The user must allow location permission in the browser. Guide them to:
- iOS: Settings > Safari > Location > Ask
- Android: Site settings in Chrome
- Desktop: Click the lock icon in address bar

### PWA not installable

Make sure:
1. The app is served over HTTPS (or localhost for testing)
2. The manifest.json is valid
3. The service worker is registered
