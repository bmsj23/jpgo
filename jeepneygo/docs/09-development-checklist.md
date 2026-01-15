# JeepneyGo Development Checklist

> **Last Updated:** January 14, 2026  
> **Current Phase:** Phase 1 - Foundation & Infrastructure  
> **Overall Progress:** 15/100 tasks complete

---

## Phase 1: Foundation & Infrastructure (Sprint 0)

### 1.1 Project Planning & Documentation
- [x] Create PRD document
- [x] Define functional requirements
- [x] Define non-functional requirements
- [x] Design database schema
- [x] Create wireframe specifications
- [x] Update sprint/milestone plan for iOS-first development
- [x] Risk assessment documentation

### 1.2 Project Setup
- [x] Initialize Flutter monorepo structure
- [x] Configure Melos for workspace management
- [x] Create Driver app scaffold (iOS + Android)
- [x] Create Commuter app scaffold (iOS + Android)
- [x] Create Admin dashboard scaffold (Flutter Web)
- [x] Set up shared packages structure
- [x] Configure analysis_options.yaml
- [x] Create README with setup instructions

### 1.3 Core Package (jeepneygo_core)
- [x] Define User model with Freezed
- [x] Define Vehicle model with Freezed
- [x] Define JeepneyRoute model with Freezed
- [x] Define Stop model with Freezed
- [x] Define Trip model with Freezed
- [x] Define ActiveTrip model with Freezed
- [x] Create AuthRepository
- [x] Create UserRepository
- [x] Create RouteRepository
- [x] Create TripRepository
- [x] Create LocationService
- [x] Configure Riverpod providers
- [x] Define app constants
- [x] Define Firestore paths

### 1.4 UI Package (jeepneygo_ui)
- [x] Define color palette (AppColors)
- [x] Configure Material 3 theme (AppTheme)
- [x] Set up typography system (AppTypography)
- [x] Define spacing constants (AppSpacing)
- [x] Create PrimaryButton component
- [x] Create SecondaryButton component
- [x] Create TripToggleButton component
- [x] Create RouteCard component
- [x] Create JeepneyCard component
- [x] Create StatCard component
- [x] Create LoadingOverlay component
- [x] Create ShimmerLoading component
- [x] Create MapControls component
- [x] Create JeepneyMarkerGenerator

### 1.5 External Services Configuration
- [ ] Create Firebase project
- [ ] Enable Firebase Authentication (Phone)
- [ ] Enable Cloud Firestore
- [ ] Enable Firebase Cloud Messaging
- [ ] Add GoogleService-Info.plist (Driver iOS)
- [ ] Add GoogleService-Info.plist (Commuter iOS)
- [ ] Add google-services.json (Driver Android)
- [ ] Add google-services.json (Commuter Android)
- [ ] Initialize Firebase in apps
- [ ] Obtain Google Maps API key
- [ ] Configure Maps API for iOS apps
- [ ] Configure Maps API for Android apps

### 1.6 Code Generation
- [ ] Run build_runner for jeepneygo_core
- [ ] Verify generated .freezed.dart files
- [ ] Verify generated .g.dart files

---

## Phase 2: Authentication & User Management (Sprint 1-2)

### 2.1 Shared Authentication
- [ ] Implement phone number validation
- [ ] Create OTP request service
- [ ] Create OTP verification service
- [ ] Implement auth state management
- [ ] Create session persistence

### 2.2 Driver App Authentication
- [ ] Create splash screen
- [ ] Create phone input screen
- [ ] Create OTP verification screen
- [ ] Create driver registration form
- [ ] Implement license photo capture
- [ ] Create pending approval screen
- [ ] Create rejection screen with reason
- [ ] Implement auto-login for approved drivers

### 2.3 Commuter App Authentication
- [ ] Create splash screen
- [ ] Create phone input screen
- [ ] Create OTP verification screen
- [ ] Create optional profile setup
- [ ] Implement skip onboarding option
- [ ] Implement auto-login

### 2.4 User Profile Management
- [ ] Create profile view screen (Driver)
- [ ] Create profile edit screen (Driver)
- [ ] Create profile view screen (Commuter)
- [ ] Create profile edit screen (Commuter)
- [ ] Implement profile photo upload
- [ ] Create logout confirmation dialog

---

## Phase 3: Core Features - Driver App (Sprint 3-4)

### 3.1 Driver Home Screen
- [ ] Implement map view with current location
- [ ] Display assigned route overlay
- [ ] Show current status indicator
- [ ] Create bottom action panel
- [ ] Display vehicle/route assignment info

### 3.2 Trip Management
- [ ] Implement trip start flow
- [ ] Create trip confirmation dialog
- [ ] Start location broadcasting on trip start
- [ ] Implement passenger count controls (+/-)
- [ ] Update Firestore with passenger count
- [ ] Implement trip end flow
- [ ] Create trip summary on end
- [ ] Save trip to history

### 3.3 Location Broadcasting
- [ ] Configure foreground location service
- [ ] Implement iOS background location (BGTaskScheduler)
- [ ] Create location update throttling (10-15s)
- [ ] Calculate and broadcast heading
- [ ] Handle location permission requests
- [ ] Show location permission rationale
- [ ] Handle permission denied gracefully

### 3.4 Driver Screens
- [ ] Create trip history list screen
- [ ] Create trip detail view
- [ ] Create settings screen
- [ ] Implement notification preferences
- [ ] Create about/help screen

---

## Phase 4: Core Features - Commuter App (Sprint 5-6)

### 4.1 Map View
- [ ] Implement full-screen map
- [ ] Show user's current location
- [ ] Display jeepney markers from Firestore
- [ ] Implement marker clustering
- [ ] Create custom jeepney marker icons
- [ ] Show route polylines on map
- [ ] Implement map controls (zoom, recenter)

### 4.2 Route Discovery
- [ ] Create routes list screen
- [ ] Display active jeepney count per route
- [ ] Create route detail screen
- [ ] Show all stops for a route
- [ ] Display real-time jeepneys on route
- [ ] Implement route selection from map

### 4.3 Jeepney Tracking
- [ ] Create jeepney detail bottom sheet
- [ ] Show capacity indicator
- [ ] Display ETA to next stop
- [ ] Implement "Track This Jeepney" feature
- [ ] Auto-follow tracked jeepney on map
- [ ] Show arrival notification option

### 4.4 Search & Filters
- [ ] Create search screen
- [ ] Implement route search
- [ ] Implement stop/landmark search
- [ ] Create filter by route
- [ ] Save recent searches
- [ ] Create search suggestions

### 4.5 Commuter Screens
- [ ] Create favorites/saved routes
- [ ] Create settings screen
- [ ] Implement notification preferences
- [ ] Create about/help screen

---

## Phase 5: Real-time Integration (Sprint 7)

### 5.1 Firestore Real-time
- [ ] Optimize Firestore queries with indexes
- [ ] Implement route-based subscriptions
- [ ] Handle subscription lifecycle
- [ ] Implement data caching
- [ ] Handle offline mode

### 5.2 Map Performance
- [ ] Implement marker pooling
- [ ] Optimize marker updates (diff only)
- [ ] Implement viewport-based loading
- [ ] Add stale marker cleanup (2min threshold)
- [ ] Smooth marker animation

### 5.3 Connection Handling
- [ ] Detect network connectivity changes
- [ ] Show offline indicator
- [ ] Queue updates when offline (Driver)
- [ ] Sync queued updates on reconnect
- [ ] Handle Firestore reconnection

---

## Phase 6: Polish & Optimization (Sprint 8-9)

### 6.1 Push Notifications
- [ ] Configure FCM for iOS
- [ ] Configure FCM for Android
- [ ] Implement driver approval notification
- [ ] Implement arrival notifications (Commuter)
- [ ] Create notification settings screen
- [ ] Handle notification permissions

### 6.2 Performance
- [ ] Profile and optimize startup time
- [ ] Reduce memory footprint
- [ ] Optimize battery usage (Driver)
- [ ] Implement lazy loading where applicable
- [ ] Add image caching

### 6.3 UX Polish
- [ ] Add loading skeletons everywhere
- [ ] Create empty state designs
- [ ] Implement error state designs
- [ ] Add haptic feedback
- [ ] Implement pull-to-refresh
- [ ] Add transition animations

### 6.4 Accessibility
- [ ] Add semantic labels
- [ ] Ensure proper contrast ratios
- [ ] Support dynamic text sizes
- [ ] Test with screen readers
- [ ] Add keyboard navigation (web)

---

## Phase 7: Testing & Deployment (Sprint 10)

### 7.1 Testing
- [ ] Unit tests for AuthRepository
- [ ] Unit tests for UserRepository
- [ ] Unit tests for RouteRepository
- [ ] Unit tests for TripRepository
- [ ] Unit tests for LocationService
- [ ] Widget tests for authentication screens
- [ ] Widget tests for home screens
- [ ] Integration test for login flow
- [ ] Integration test for trip flow

### 7.2 iOS Deployment
- [ ] Configure App Store Connect
- [ ] Create app icons and screenshots
- [ ] Write App Store description
- [ ] Submit to TestFlight
- [ ] Internal testing round
- [ ] Address TestFlight feedback
- [ ] Submit for App Store review

### 7.3 Android Deployment
- [ ] Configure Google Play Console
- [ ] Create app icons and screenshots
- [ ] Write Play Store description
- [ ] Submit to internal testing
- [ ] Internal testing round
- [ ] Address testing feedback
- [ ] Submit for Play Store review

### 7.4 Documentation
- [ ] Update README with final instructions
- [ ] Create user guide for drivers
- [ ] Create user guide for commuters
- [ ] Document API/backend setup
- [ ] Create troubleshooting guide

---

## Quick Stats

| Category | Completed | Total | Progress |
|----------|-----------|-------|----------|
| Phase 1 | 38 | 52 | 73% |
| Phase 2 | 0 | 22 | 0% |
| Phase 3 | 0 | 20 | 0% |
| Phase 4 | 0 | 23 | 0% |
| Phase 5 | 0 | 13 | 0% |
| Phase 6 | 0 | 18 | 0% |
| Phase 7 | 0 | 26 | 0% |
| **Total** | **38** | **174** | **22%** |

---

## Legend

- [x] Completed
- [ ] Pending
- 🚧 In Progress (marked in PROGRESS.txt)
- ⚠️ Blocked (marked in PROGRESS.txt)
