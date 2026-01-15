# JeepneyGo (Software-Only): Project Summary and Requirements

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 2.0 |
| Date | January 2026 |
| Status | Draft (Software-Only Pivot) |

---

## 1. Software-Only Project Summary

### 1.1 Background and Problem

Commuters in Lipa City often rely on guesswork or word-of-mouth to estimate jeepney arrivals. This leads to inefficient trip planning, long wait times, and overcrowding at stops. Operators and route managers also lack reliable visibility on fleet activity and trip patterns.

JeepneyGo addresses this through a software-only real-time monitoring system where the driver’s smartphone provides GPS location updates during active trips. The system surfaces live vehicle positions, approximate ETAs, route information, and basic analytics through mobile apps and a web dashboard.

### 1.2 Target Users and Roles

- Drivers: start/end trips, broadcast location, update passenger count, view history
- Commuters: view real-time map, filter by route, view stop ETAs, save favorite stops, receive approaching alerts
- Admin/Operator: manage drivers/vehicles/routes/stops, monitor fleet in real-time, view analytics and exports

### 1.3 System Scope (MVP)

In-scope for MVP:
- Driver mobile app (tracking, trip management, passenger count)
- Commuter mobile app (real-time map, route filtering, stop search, ETA display, favorites)
- Web dashboard (management CRUD, live fleet map, basic analytics, CSV export)
- Backend using Firebase Auth, Firestore, Cloud Functions, and FCM

Out-of-scope for MVP (explicitly deferred):
- IoT/GPS hardware trackers and hardware installation manuals
- Sensor-based seat counting
- Live traffic ingestion and traffic-aware ETA
- Advertising platform
- Citywide production rollout and multi-city expansion

### 1.4 Architecture Overview

- Client apps
  - Driver App: Flutter (iOS primary, Android secondary) — separate app for drivers only
  - Commuter App: Flutter (iOS primary, Android secondary) — separate app for commuters
  - Web Dashboard: Flutter Web
- Backend
  - Authentication: Firebase Auth
  - Data: Cloud Firestore
  - Server-side logic: Cloud Functions (validation, cleanup, aggregation)
  - Notifications: Firebase Cloud Messaging
- Maps
  - Google Maps SDK for Flutter (map rendering and markers)

### 1.5 Core User Journeys

- Driver
  - login (phone OTP) → select route → start trip → background tracking + passenger updates → end trip → trip summary/history
- Commuter
  - open map (guest or logged-in) → filter by route → select stop or jeepney → view ETA → save favorite stop → receive approaching notification
- Admin/Operator
  - login → manage drivers/vehicles/routes/stops → view live fleet map → view analytics → export trip summary

### 1.6 Data Model Summary (Firestore)

Primary collections (aligned to the database schema document):
- `users` and `users/{uid}/favorites`
- `vehicles`
- `routes` and `routes/{routeId}/stops`
- `activeTrips` and optional `activeTrips/{tripId}/locationHistory`
- `tripHistory`

### 1.7 Privacy, Security, and Cost Controls

- Only driver location is tracked for real-time monitoring
- Commuter location is not stored
- Role-based access control is enforced for admin features
- Default tracking interval is limited (e.g., 10–15 seconds) to control Firestore usage
- Billing alerts and budget guardrails are required for Firebase and Maps usage

---

## 2. Functional Requirements (FR)

### 2.1 Driver App Module

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-D01 | Driver Authentication | Must | Drivers shall be able to register and log in using phone number with OTP verification |
| FR-D02 | Trip Activation | Must | Drivers shall be able to start/end a trip with a single tap after selecting their assigned route |
| FR-D03 | GPS Location Broadcasting | Must | The app shall broadcast the driver’s GPS location to the backend at a configured interval (default 10 seconds) while a trip is active |
| FR-D04 | Background Location Tracking | Must | The app shall continue tracking location during an active trip when minimized or screen is off, subject to OS rules |
| FR-D05 | Passenger Count Input | Should | Drivers shall be able to update current passenger count (0 to vehicle capacity) |
| FR-D06 | Offline Location Queue | Should | The app shall queue location updates locally when offline and sync when connection is restored |
| FR-D07 | Trip History View | Could | Drivers shall be able to view their past trips with date, route, and duration |
| FR-D08 | Connection Status Indicator | Must | The app shall display connection status (online/offline/syncing) during active trips |
| FR-D09 | Route Selection | Must | Drivers shall select from predefined routes configured by administrators |
| FR-D10 | Daily Summary | Could | Drivers shall see a daily summary of trips completed |

### 2.2 Commuter App Module

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-C01 | Commuter Registration | Must | Commuters shall be able to register with email or phone number |
| FR-C02 | Guest Mode | Should | Commuters shall be able to use basic map features without registration |
| FR-C03 | Real-Time Map View | Must | The app shall display a map showing all active jeepneys with their current positions |
| FR-C04 | Route Filtering | Must | Commuters shall be able to filter the map by specific routes |
| FR-C05 | Jeepney Details | Must | Tapping a jeepney marker shall show route name, plate number, passenger count status, and last update time |
| FR-C06 | ETA Display | Must | The app shall calculate and display estimated arrival time at user-selected stops based on current vehicle position and stop geometry |
| FR-C07 | Favorite Stops | Should | Commuters shall be able to save frequently used stops for quick access |
| FR-C08 | Approaching Notification | Should | The app shall send push notifications when a jeepney is approaching a saved stop |
| FR-C09 | Route Information | Must | The app shall display route details including terminals, key stops, and operating hours |
| FR-C10 | Fare Estimation | Must | The app shall calculate estimated fare based on origin and destination stops using route fare configuration |
| FR-C11 | Seat Availability Indicator | Should | The app shall show seat availability status (available/limited/full) based on driver input and vehicle capacity |
| FR-C12 | Search Stops | Must | Commuters shall be able to search for stops by name |

### 2.3 Web Dashboard Module (Admin/Operator)

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-W01 | Admin Authentication | Must | Administrators shall log in with email/password with role-based access control |
| FR-W02 | Live Fleet Map | Must | Dashboard shall display real-time positions of all active jeepneys on a map |
| FR-W03 | Driver Management | Must | Admins shall be able to add, edit, approve, suspend, and delete driver accounts |
| FR-W04 | Vehicle Management | Must | Admins shall be able to register vehicles with plate number, capacity, and assign to drivers |
| FR-W05 | Route Configuration | Must | Admins shall be able to create/edit routes with name, stops (coordinates), operating hours, and fare configuration |
| FR-W06 | Stop Management | Must | Admins shall be able to add/edit/delete stop locations with name and coordinates |
| FR-W07 | Trip Analytics | Should | Dashboard shall display trip statistics (daily trips, peak hours, route utilization) |
| FR-W08 | Driver Performance | Should | Dashboard shall show driver activity metrics (trips completed, online hours) |
| FR-W09 | Report Generation | Should | Admins shall be able to export reports as CSV for trips and usage |
| FR-W10 | Announcement System | Could | Admins shall be able to broadcast announcements to app users |
| FR-W11 | User Statistics | Should | Dashboard shall display commuter statistics (registrations, active users) |

---

## 3. Non-Functional Requirements (NFR)

### 3.1 Performance

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-P01 | Location Propagation Latency | ≤ 5 seconds (median, pilot load) | Time from driver update written to backend to commuter map display should be within target under pilot load |
| NFR-P02 | App Launch Time | < 4 seconds | Mobile apps shall launch to a usable state within 4 seconds on mid-range devices |
| NFR-P03 | Map Render Time | < 2 seconds | Map with jeepney markers shall render within 2 seconds after data is available |

### 3.2 Reliability & Availability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-R01 | Operating Hours Availability | 99.5% | System shall maintain 99.5% uptime during operating hours (5 AM - 10 PM) |
| NFR-R02 | Offline Sync Behavior | Best effort with documented limits | Offline-queued updates must synchronize when online, prioritizing the latest current location and preserving trip boundaries |
| NFR-R03 | Graceful Degradation | - | When offline, commuter app shall still display cached routes/stops and clearly label tracking as stale/unavailable |
| NFR-R04 | Crash Rate | < 1% | App crash rate shall be below 1% of sessions in pilot testing |

### 3.3 Usability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-U01 | Learnability | < 5 minutes | New users shall be able to perform core tasks within 5 minutes without training |
| NFR-U02 | Driver Interface Safety | Minimal interaction | Driver flows shall minimize taps while trip is active to reduce distraction risk |
| NFR-U03 | Language | Filipino/English | App shall support bilingual interface (Filipino and English) |
| NFR-U04 | Accessibility | WCAG 2.1 AA (target) | App shall meet basic accessibility standards (contrast, touch targets) |

### 3.4 Security & Privacy

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-S01 | Data Encryption | All data in transit shall use TLS 1.2+ encryption |
| NFR-S02 | Session Handling | User sessions shall expire after 30 days of inactivity |
| NFR-S03 | Data Privacy Compliance | System shall comply with the Data Privacy Act of 2012 (RA 10173) within the project context |
| NFR-S04 | Location Privacy Boundary | Commuter location shall not be tracked or stored; only driver trip location is stored |
| NFR-S05 | Role-Based Access | Admin functions shall be restricted by role; driver writes limited to own data |

### 3.5 Cost Controls

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-COST01 | Location Write Frequency | 10–15 seconds default | Tracking updates should not exceed the configured interval unless explicitly enabled for testing |
| NFR-COST02 | Data Retention | 30 days (breadcrumbs), 1 year (history) | Location history retention should follow the retention guidance in the database schema |
| NFR-COST03 | Budget Guardrails | Alerts enabled | Firebase and Maps billing alerts shall be configured and reviewed weekly during the pilot |

### 3.6 Compatibility

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-C01 | iOS Version | Mobile apps shall support iOS 12.0+ (primary testing platform) |
| NFR-C02 | Android Version | Mobile apps shall support Android 8.0 (API 26)+ (secondary, smoke-tested) |
| NFR-C03 | Browser Support | Web dashboard shall support the latest 2 versions of Chrome, Safari, and Edge |

---

## 4. Traceability Notes (Docs Alignment)

This document is intended to be consistent with:
- UI flows in `03-ui-screen-flow.md`
- Data entities and collections in `04-database-schema.md`
- Development sequencing in `05-sprint-milestone-plan.md`
- Pivot rationale and mitigations in `07-risk-assessment.md`

Conflicts with the original charter are resolved by treating IoT hardware as deprecated and focusing on phone-based GPS tracking as the tracking source.