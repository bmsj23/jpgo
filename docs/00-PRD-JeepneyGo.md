# JeepneyGo: Product Requirements Document (PRD)

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Final Draft |
| Authors | SoftEng2 Team |

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Product Vision and Goals](#2-product-vision-and-goals)
3. [Target Users and Personas](#3-target-users-and-personas)
4. [Product Scope](#4-product-scope)
5. [System Architecture](#5-system-architecture)
6. [Functional Requirements](#6-functional-requirements)
7. [Non-Functional Requirements](#7-non-functional-requirements)
8. [User Flows](#8-user-flows)
9. [UI/UX Guidelines](#9-uiux-guidelines)
10. [Data Model](#10-data-model)
11. [Security and Privacy](#11-security-and-privacy)
12. [Technical Constraints](#12-technical-constraints)
13. [Success Metrics](#13-success-metrics)
14. [Appendix](#14-appendix)

---

## 1. Executive Summary

### 1.1 Problem Statement

Commuters in Lipa City face daily uncertainty when waiting for jeepneys. Without visibility into vehicle locations or arrival times, passengers resort to guesswork, leading to:

- Long, unpredictable wait times at stops
- Overcrowding when multiple passengers converge on a single jeepney
- Inefficient trip planning and missed connections
- Frustration and stress during daily commutes

Jeepney operators and transport authorities also lack data on fleet activity, route utilization, and service gaps.

### 1.2 Solution

**JeepneyGo** is a real-time jeepney transport monitoring system that provides:

- Live jeepney positions on a digital map
- Estimated arrival times (ETAs) at stops
- Route and fare information
- Seat availability indicators
- Fleet monitoring and analytics for operators

### 1.3 Key Decision: Monitoring, Not Booking

JeepneyGo is explicitly designed as a **monitoring and information system**, not a ride-hailing or booking platform. 

| What JeepneyGo IS | What JeepneyGo is NOT |
|-------------------|----------------------|
| Live vehicle tracker | Ride-hailing app (no Grab-style bookings) |
| ETA information tool | Payment or ticketing system |
| Route/fare reference | Driver-passenger matching service |
| Fleet monitoring dashboard | Dispatch or scheduling system |

Commuters use JeepneyGo to **see where jeepneys are** and **decide when to head to a stop**. Drivers simply drive their normal routes with the app broadcasting their location—no booking acceptance required.

---

## 2. Product Vision and Goals

### 2.1 Vision Statement

To make jeepney commuting in Lipa City predictable, transparent, and stress-free by providing real-time visibility into the public transport system.

### 2.2 Project Goals

| Goal | Description | Success Indicator |
|------|-------------|-------------------|
| G1 | Reduce commuter uncertainty | Commuters can see jeepney positions in real-time |
| G2 | Provide accurate ETAs | ETA displayed for selected stops with ≤3 min average error |
| G3 | Enable fleet visibility | Operators can monitor all active jeepneys on dashboard |
| G4 | Deliver a polished mobile experience | Smooth, modern UI with <1% crash rate |
| G5 | Complete academic deliverable | Fully functional system for SoftEng2 demonstration |

### 2.3 Design Principles

1. **Simplicity First** — Minimize taps; core tasks achievable in seconds
2. **Real-Time or Nothing** — If data is stale, say so clearly
3. **Driver Safety** — Minimal interaction required while driving
4. **Visual Clarity** — Information hierarchy; maps over text
5. **Graceful Degradation** — Useful even with poor connectivity

---

## 3. Target Users and Personas

### 3.1 Persona: The Commuter

**Name:** Maria, 24, Office Worker  
**Device:** iPhone 13  
**Context:** Takes jeepney from SM Lipa to Downtown daily  

**Goals:**
- Know when the next jeepney will arrive at her stop
- Avoid long waits in the sun/rain
- Plan her departure time from home or office

**Pain Points:**
- No idea if a jeepney just left or is 10 minutes away
- Sometimes waits 20+ minutes, other times misses one by seconds

**How JeepneyGo Helps:**
- Opens app, sees 2 jeepneys on her route, nearest is 3 minutes away
- Leaves office at the right time, catches jeepney with minimal wait

---

### 3.2 Persona: The Driver

**Name:** Mang Pedro, 52, Jeepney Driver  
**Device:** Android phone (older model) or iPhone SE  
**Context:** Drives SM-Downtown route, 6 AM to 8 PM  

**Goals:**
- Keep his phone charged and app running during trips
- Update passenger count when asked
- See his trip history and daily summary

**Pain Points:**
- Doesn't want complicated apps
- Worried about phone battery
- Needs large buttons he can tap without looking

**How JeepneyGo Helps:**
- One tap to start trip, one tap to end
- Big passenger count buttons (+/-)
- Runs in background; minimal interaction needed

---

### 3.3 Persona: The Operator/Admin

**Name:** Sir Jun, 38, Jeepney Association Coordinator  
**Device:** Laptop/Desktop  
**Context:** Manages 15 jeepneys across 3 routes  

**Goals:**
- See which drivers are active right now
- Check route coverage and trip counts
- Approve new drivers and manage vehicles

**Pain Points:**
- Currently tracks via Viber groups and guesswork
- No historical data for reporting

**How JeepneyGo Helps:**
- Live fleet map shows all active jeepneys
- Dashboard shows trips per day, driver activity
- Can export CSV reports for meetings

---

## 4. Product Scope

### 4.1 In Scope (MVP)

| Component | Features |
|-----------|----------|
| **Driver App (iOS/Android)** | Phone OTP login, trip start/end, GPS broadcasting, passenger count, trip history |
| **Commuter App (iOS/Android)** | Map view, real-time jeepney markers, route filtering, stop search, ETA display, favorites, approaching notifications |
| **Web Dashboard** | Admin login, driver/vehicle/route/stop management, live fleet map, basic analytics, CSV export |
| **Backend (Firebase)** | Authentication, Firestore database, Cloud Functions, FCM notifications |

### 4.2 Out of Scope (Deferred)

| Feature | Reason for Deferral |
|---------|---------------------|
| Booking/ride-hailing | Not aligned with product vision (monitoring only) |
| In-app payments | Complexity; jeepneys use cash fare |
| IoT/hardware GPS trackers | Cost and complexity; using phone GPS instead |
| Live traffic integration | API costs; requires traffic data source |
| Sensor-based seat counting | Hardware dependency |
| Multi-city deployment | Focus on Lipa City pilot first |
| Advertising platform | Not core to MVP |

### 4.3 Platform Priority

| Platform | Priority | Testing Approach |
|----------|----------|------------------|
| **iOS** | Primary | Full testing on team devices (iPhone) |
| **Android** | Secondary | Smoke testing on emulator + borrowed device |
| **Web (Dashboard)** | Primary | Chrome, Safari, Edge testing |

---

## 5. System Architecture

### 5.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              JEEPNEYGO SYSTEM                               │
└─────────────────────────────────────────────────────────────────────────────┘

    ┌─────────────┐     ┌─────────────┐     ┌─────────────────┐
    │  Driver App │     │ Commuter App│     │  Web Dashboard  │
    │   (iOS*)    │     │   (iOS*)    │     │  (Flutter Web)  │
    │  (Android)  │     │  (Android)  │     │                 │
    └──────┬──────┘     └──────┬──────┘     └────────┬────────┘
           │                   │                     │
           │                   │                     │
           ▼                   ▼                     ▼
    ┌─────────────────────────────────────────────────────────────────────┐
    │                         FIREBASE BACKEND                            │
    │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌────────────┐ │
    │  │ Firebase    │  │  Cloud      │  │   Cloud     │  │    FCM     │ │
    │  │ Auth        │  │  Firestore  │  │  Functions  │  │ (Push)     │ │
    │  │ (OTP/Email) │  │  (Database) │  │  (Logic)    │  │            │ │
    │  └─────────────┘  └─────────────┘  └─────────────┘  └────────────┘ │
    └─────────────────────────────────────────────────────────────────────┘
           │
           ▼
    ┌─────────────────┐
    │  Google Maps    │
    │  SDK / API      │
    └─────────────────┘

    * iOS is primary testing platform
```

### 5.2 Technology Stack

| Layer | Technology | Rationale |
|-------|------------|-----------|
| Mobile Apps | Flutter (Dart) | Cross-platform; single codebase for iOS/Android |
| Web Dashboard | Flutter Web | Code sharing with mobile; fast development |
| Authentication | Firebase Auth | Phone OTP for drivers; email for commuters/admin |
| Database | Cloud Firestore | Real-time sync; offline support; scalable |
| Server Logic | Cloud Functions | Validation, aggregation, scheduled cleanup |
| Notifications | Firebase Cloud Messaging | Cross-platform push notifications |
| Maps | Google Maps SDK for Flutter | Reliable; good iOS/Android support |

### 5.3 App Strategy: Two Separate Apps

JeepneyGo ships as **two separate mobile applications**:

| App | Target User | Auth Method | Key Features |
|-----|-------------|-------------|--------------|
| **JeepneyGo Driver** | Jeepney drivers | Phone OTP | Trip management, GPS broadcast, passenger count |
| **JeepneyGo** | Commuters | Email/Phone or Guest | Live map, ETA, routes, favorites, notifications |

**Rationale:**
- Cleaner UX for each user type
- Smaller app size per user
- Separate App Store listings with clear descriptions
- Shared codebase via Flutter packages (efficient development)

---

## 6. Functional Requirements

### 6.1 Driver App Module

| ID | Requirement | Priority | Description | Acceptance Criteria |
|----|-------------|----------|-------------|---------------------|
| FR-D01 | Driver Registration | Must | Driver registers with phone number, full name, and uploads driver's license photo | Account created in Firestore with `isApproved: false` |
| FR-D02 | Phone OTP Login | Must | Driver logs in via phone number with OTP verification | Firebase Auth OTP flow completes; session persists |
| FR-D03 | Pending Approval State | Must | Unapproved drivers see "Pending Approval" screen and cannot start trips | UI blocks trip start if `isApproved: false` |
| FR-D04 | Route Selection | Must | Driver selects from admin-configured routes before starting a trip | Only active routes shown; selection stored with trip |
| FR-D05 | Trip Start | Must | Driver starts trip with single tap after route selection | `activeTrips` document created; GPS broadcast begins |
| FR-D06 | GPS Location Broadcasting | Must | App broadcasts GPS location every 10–15 seconds while trip is active | `activeTrips` document updated with `currentLocation` |
| FR-D07 | Background Tracking | Must | Tracking continues when app is minimized or screen is off | Location updates continue (foreground service on Android; background modes on iOS) |
| FR-D08 | Passenger Count Update | Should | Driver updates passenger count (0 to vehicle capacity) via +/- buttons | `activeTrips.passengerCount` updated; commuters see status |
| FR-D09 | Trip End | Must | Driver ends trip with single tap | `activeTrips` document deleted; `tripHistory` document created |
| FR-D10 | Connection Status | Must | App shows online/offline/syncing indicator | Visual indicator matches actual connectivity state |
| FR-D11 | Offline Queue | Should | Location updates queued locally when offline; synced on reconnect | No data loss; queue replays on connectivity restore |
| FR-D12 | Trip History | Could | Driver views past trips (date, route, duration) | List of `tripHistory` documents for this driver |
| FR-D13 | Daily Summary | Could | Home screen shows today's trip count and total time | Computed from `tripHistory` |

### 6.2 Commuter App Module

| ID | Requirement | Priority | Description | Acceptance Criteria |
|----|-------------|----------|-------------|---------------------|
| FR-C01 | Guest Mode | Should | Commuters can use map and view jeepneys without logging in | Map loads; markers visible; favorites/notifications disabled |
| FR-C02 | Commuter Registration | Must | Commuters register with email or phone number | Account created in Firestore with `role: commuter` |
| FR-C03 | Real-Time Map View | Must | Map displays all active jeepneys with custom markers | Markers update automatically; smooth pan/zoom |
| FR-C04 | Route Filtering | Must | Commuter filters map to show only selected route(s) | Markers filtered; route polyline displayed |
| FR-C05 | Jeepney Details | Must | Tapping marker shows bottom sheet with details | Shows: route, plate, passenger status, last updated |
| FR-C06 | Stop Search | Must | Commuter searches stops by name | Search results from all configured stops |
| FR-C07 | Stop Details | Must | Selecting a stop shows ETAs for approaching jeepneys | ETA list for jeepneys on routes serving this stop |
| FR-C08 | ETA Display | Must | App calculates and displays ETA based on vehicle position and stop distance | ETA shown in minutes; updates as vehicle moves |
| FR-C09 | Route Information | Must | App displays route details (terminals, stops, hours, fare) | Complete route info accessible from route list or map |
| FR-C10 | Fare Estimation | Must | App calculates fare between two stops | Fare = base + (distance × per-km rate) |
| FR-C11 | Seat Availability | Should | Marker/details show availability status (Available/Limited/Full) | Status derived from `passengerCount` vs `capacity` |
| FR-C12 | Favorite Stops | Should | Logged-in user saves stops for quick access | Favorites stored in `users/{uid}/favorites` |
| FR-C13 | Approaching Notification | Should | Push notification when jeepney is within ~300–500m of favorite stop | FCM notification triggered; user can tap to open app |
| FR-C14 | Stale Marker Handling | Must | Markers for jeepneys not updated in >60 seconds show "stale" state or hide | Visual differentiation or removal of stale markers |

### 6.3 Web Dashboard Module

| ID | Requirement | Priority | Description | Acceptance Criteria |
|----|-------------|----------|-------------|---------------------|
| FR-W01 | Admin Login | Must | Admin logs in with email/password | Firebase Auth email login; role verified |
| FR-W02 | Role-Based Access | Must | Features restricted by role (super_admin, operator) | UI elements hidden/disabled per role |
| FR-W03 | Driver Management | Must | Admin views, adds, edits, approves, suspends drivers | CRUD operations on `users` where `role: driver` |
| FR-W04 | Driver Approval Workflow | Must | New drivers appear as "Pending"; admin reviews and approves | `isApproved` toggled; driver can now start trips |
| FR-W05 | Vehicle Management | Must | Admin manages vehicles (plate, capacity, color, assignment) | CRUD on `vehicles` collection |
| FR-W06 | Route Management | Must | Admin creates/edits routes (name, color, fare config, hours) | CRUD on `routes` collection |
| FR-W07 | Stop Management | Must | Admin adds/edits/orders stops for each route | CRUD on `routes/{routeId}/stops` subcollection |
| FR-W08 | Live Fleet Map | Must | Dashboard shows real-time positions of all active jeepneys | Map updates with `activeTrips` data |
| FR-W09 | Trip Analytics | Should | Dashboard shows trip counts, peak hours, route utilization | Charts/tables from `tripHistory` aggregation |
| FR-W10 | Driver Activity | Should | Dashboard shows driver metrics (trips, online hours) | Per-driver stats from `tripHistory` |
| FR-W11 | CSV Export | Should | Admin exports trip data as CSV | Download with date range filter |
| FR-W12 | User Statistics | Should | Dashboard shows registered commuters count | Count of `users` where `role: commuter` |
| FR-W13 | Announcements | Could | Admin broadcasts announcements to app users | Message stored; displayed in apps |

---

## 7. Non-Functional Requirements

### 7.1 Performance

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| NFR-P01 | Location Propagation | ≤ 5 seconds | Time from driver GPS write to commuter map display |
| NFR-P02 | App Launch | < 4 seconds | Cold start to usable state on mid-range device |
| NFR-P03 | Map Render | < 2 seconds | Initial map with markers after data load |
| NFR-P04 | Concurrent Users | 100+ commuters, 20+ drivers | System remains responsive under pilot load |
| NFR-P05 | Frame Rate | ≥ 30 FPS | Map interactions (pan/zoom) stay smooth |

### 7.2 Reliability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-R01 | Uptime | 99% | During operating hours (5 AM – 10 PM) |
| NFR-R02 | Crash Rate | < 1% | Percentage of sessions ending in crash |
| NFR-R03 | Offline Resilience | Functional | Driver app queues; commuter app shows cached data |
| NFR-R04 | Data Integrity | No loss | Queued location updates must sync successfully |

### 7.3 Usability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-U01 | Learnability | < 5 minutes | New user can complete core task without training |
| NFR-U02 | Driver Safety | ≤ 2 taps | Start/end trip requires minimal interaction |
| NFR-U03 | Language | Filipino + English | Bilingual UI with toggle |
| NFR-U04 | Accessibility | WCAG 2.1 AA | Contrast ratios, touch targets ≥ 44pt |

### 7.4 Security & Privacy

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-S01 | Encryption | All data in transit uses TLS 1.2+ |
| NFR-S02 | Session Expiry | Sessions expire after 30 days of inactivity |
| NFR-S03 | Location Privacy | Commuter location is never tracked or stored |
| NFR-S04 | Driver Data | Only approved drivers can broadcast; data tied to verified accounts |
| NFR-S05 | Role Enforcement | Firestore rules enforce role-based read/write access |
| NFR-S06 | Compliance | Aligned with Data Privacy Act of 2012 (RA 10173) |

### 7.5 Compatibility

| ID | Requirement | Target |
|----|-------------|--------|
| NFR-C01 | iOS Version | iOS 12.0+ (primary platform) |
| NFR-C02 | Android Version | Android 8.0 / API 26+ (secondary, smoke-tested) |
| NFR-C03 | Web Browsers | Chrome, Safari, Edge (latest 2 versions) |
| NFR-C04 | Screen Sizes | 4.7" to 6.7" (iPhone SE to iPhone Pro Max range) |

### 7.6 Scalability & Cost

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-SC01 | Update Interval | 10–15 seconds to balance freshness vs Firestore costs |
| NFR-SC02 | Data Retention | Location breadcrumbs: 30 days; trip history: 1 year |
| NFR-SC03 | Billing Alerts | Firebase/Maps alerts at ₱500, ₱1000, ₱2000 thresholds |
| NFR-SC04 | Route-Based Queries | Commuters subscribe only to selected routes, not all trips |

---

## 8. User Flows

### 8.1 Driver App Flow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DRIVER APP FLOW                                    │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────┐
                              │   SPLASH    │
                              └──────┬──────┘
                                     │
                      ┌──────────────┴──────────────┐
                      ▼                              ▼
              [Not Logged In]                [Logged In]
                      │                              │
                      ▼                              │
              ┌─────────────┐                        │
              │   LOGIN     │                        │
              │ (Phone OTP) │                        │
              └──────┬──────┘                        │
                     │                               │
                     ▼                               │
              ┌─────────────┐                        │
              │   OTP       │                        │
              │ VERIFICATION│                        │
              └──────┬──────┘                        │
                     │                               │
        ┌────────────┴────────────┐                  │
        ▼                         ▼                  │
   [New User]              [Existing User]           │
        │                         │                  │
        ▼                         │                  │
┌───────────────┐                 │                  │
│  REGISTRATION │                 │                  │
│               │                 │                  │
│ • Full Name   │                 │                  │
│ • License     │                 │                  │
│   Photo       │                 │                  │
│ • Vehicle #   │                 │                  │
└───────┬───────┘                 │                  │
        │                         │                  │
        ▼                         ▼                  ▼
        ┌─────────────────────────────────────────────┐
        │            CHECK APPROVAL STATUS            │
        └──────────────────────┬──────────────────────┘
                               │
              ┌────────────────┴────────────────┐
              ▼                                 ▼
      [Not Approved]                      [Approved]
              │                                 │
              ▼                                 ▼
      ┌───────────────┐                ┌─────────────────┐
      │    PENDING    │                │  DRIVER HOME    │
      │   APPROVAL    │                │                 │
      │               │                │ • Welcome       │
      │ "Your account │                │ • Today's Stats │
      │  is under     │                │ • [Start Trip]  │
      │  review"      │                │ • [History]     │
      └───────────────┘                └────────┬────────┘
                                                │
                                   ┌────────────┴────────────┐
                                   ▼                         ▼
                            [Start Trip]              [View History]
                                   │                         │
                                   ▼                         ▼
                          ┌─────────────────┐       ┌─────────────────┐
                          │ ROUTE SELECTION │       │  TRIP HISTORY   │
                          │                 │       │                 │
                          │ • Select route  │       │ • Past trips    │
                          └────────┬────────┘       └─────────────────┘
                                   │
                                   ▼
                          ┌─────────────────┐
                          │   ACTIVE TRIP   │
                          │                 │
                          │ ┌─────────────┐ │
                          │ │ Status Bar  │ │ ← Online / Offline / Syncing
                          │ └─────────────┘ │
                          │                 │
                          │ Route: SM-DT    │
                          │                 │
                          │ ┌─────────────┐ │
                          │ │ Passengers  │ │
                          │ │  [-] 12 [+] │ │ ← Large tap targets
                          │ │   / 20      │ │
                          │ └─────────────┘ │
                          │                 │
                          │ ┌─────────────┐ │
                          │ │  END TRIP   │ │
                          │ └─────────────┘ │
                          └────────┬────────┘
                                   │
                                   ▼
                          ┌─────────────────┐
                          │  TRIP SUMMARY   │
                          │                 │
                          │ • Duration      │
                          │ • Route         │
                          │ • Passengers    │
                          │                 │
                          │ [Back to Home]  │
                          └─────────────────┘
```

### 8.2 Commuter App Flow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         COMMUTER APP FLOW                                   │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────┐
                              │   SPLASH    │
                              └──────┬──────┘
                                     │
                      ┌──────────────┴──────────────┐
                      ▼                              ▼
              [Continue as Guest]           [Login/Register]
                      │                              │
                      └──────────────┬───────────────┘
                                     ▼
                         ┌─────────────────────┐
                         │    HOME / MAP       │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │  🔍 Search      │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │                 │ │
                         │ │   LIVE MAP      │ │
                         │ │  🚐 🚐    🚐    │ │ ← Jeepney markers
                         │ │       🚐        │ │
                         │ │                 │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │ [All] [SM-DT]   │ │ ← Route filter chips
                         │ │ [Sabang] [...]  │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ═══════════════════ │
                         │ 🗺 Map │ 📍 Routes  │
                         │ ⭐ Favs │ 👤 Profile│ ← Bottom nav
                         └──────────┬──────────┘
                                    │
        ┌──────────────┬────────────┼────────────┬──────────────┐
        ▼              ▼            ▼            ▼              ▼
   [Tap Marker]  [Search Stop]  [Routes]   [Favorites]    [Profile]
        │              │            │            │              │
        ▼              ▼            ▼            ▼              ▼
┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│  JEEPNEY    │ │   STOP      │ │  ROUTES     │ │  FAVORITES  │ │  PROFILE    │
│  DETAILS    │ │  DETAILS    │ │   LIST      │ │             │ │             │
│ (Bottom     │ │             │ │             │ │ • Saved     │ │ • Account   │
│  Sheet)     │ │ • Stop name │ │ • All routes│ │   stops     │ │ • Language  │
│             │ │ • ETAs:     │ │ • Tap for   │ │ • Tap for   │ │ • Logout    │
│ • Route     │ │   🚐 3 min  │ │   details   │ │   ETA       │ │             │
│ • Plate     │ │   🚐 8 min  │ │             │ │             │ │             │
│ • 12/20 🟢  │ │   🚐 15 min │ │             │ │             │ │             │
│ • Updated   │ │             │ │             │ │             │ │             │
│   30s ago   │ │ [⭐ Save]   │ │             │ │             │ │             │
└─────────────┘ └─────────────┘ └──────┬──────┘ └─────────────┘ └─────────────┘
                                       │
                                       ▼
                               ┌─────────────────┐
                               │  ROUTE DETAILS  │
                               │                 │
                               │ SM Lipa ↔ DTown │
                               │                 │
                               │ • Terminals     │
                               │ • All stops     │
                               │ • Fare: ₱13 base│
                               │ • Hours: 5A-10P │
                               │                 │
                               │ [Fare Calculator]│
                               └─────────────────┘
```

---

## 9. UI/UX Guidelines

### 9.1 Design System

| Element | Specification |
|---------|---------------|
| **Primary Color** | Jeepney Yellow (#FFB800) |
| **Secondary Color** | Deep Blue (#1A237E) |
| **Background** | Light Gray (#F5F5F5) for light mode |
| **Typography** | Poppins (headings), Inter (body) via Google Fonts |
| **Icons** | Material Icons or SF Symbols (iOS-native feel) |
| **Corner Radius** | 12dp for cards, 8dp for buttons |
| **Shadows** | Subtle elevation (2-4dp) for cards and FABs |

### 9.2 Map Design

| Element | Specification |
|---------|---------------|
| **Jeepney Markers** | Custom icon (jeepney silhouette), color-coded by route |
| **Stop Markers** | Circle with route color, smaller than jeepney markers |
| **Route Lines** | Colored polylines matching route color, 4dp width |
| **Marker Clustering** | Group markers when zoomed out (>10 markers close together) |
| **Stale Markers** | Grayed out or reduced opacity if not updated in 60+ seconds |

### 9.3 Component States

Every interactive screen must handle:

| State | Implementation |
|-------|----------------|
| **Loading** | Skeleton loaders or shimmer effect (not spinners) |
| **Empty** | Friendly illustration + message + CTA (e.g., "No jeepneys on this route right now") |
| **Error** | Clear error message + retry button |
| **Offline** | Banner at top: "You're offline. Showing cached data." |
| **Success** | Brief toast or checkmark animation |

### 9.4 Driver App Specifics

| Principle | Implementation |
|-----------|----------------|
| **Large Touch Targets** | Buttons ≥ 60pt height for tap while driving |
| **High Contrast** | Readable in bright sunlight |
| **Minimal Text** | Icons + numbers preferred over paragraphs |
| **Status Always Visible** | Connection status bar always at top during trip |
| **One-Handed Use** | Critical controls reachable with thumb |

### 9.5 Accessibility

| Requirement | Implementation |
|-------------|----------------|
| **Contrast** | Minimum 4.5:1 for text, 3:1 for UI components |
| **Touch Targets** | Minimum 44×44 pt |
| **Screen Reader** | All images have alt text; buttons have labels |
| **Motion** | Respect "Reduce Motion" setting |
| **Color Independence** | Don't rely solely on color (add icons/labels) |

---

## 10. Data Model

### 10.1 Firestore Collections

```
├── users
│   ├── {uid}
│   │   ├── displayName: string
│   │   ├── phone: string
│   │   ├── email: string | null
│   │   ├── role: "commuter" | "driver" | "admin" | "super_admin"
│   │   ├── isActive: boolean
│   │   ├── isApproved: boolean (drivers only)
│   │   ├── licensePhotoUrl: string (drivers only)
│   │   ├── vehicleId: string | null (drivers only)
│   │   ├── createdAt: timestamp
│   │   └── favorites/ (subcollection, commuters only)
│   │       └── {favoriteId}
│   │           ├── stopId: string
│   │           ├── routeId: string
│   │           └── addedAt: timestamp
│
├── vehicles
│   └── {vehicleId}
│       ├── plateNumber: string
│       ├── capacity: number
│       ├── color: string
│       ├── routeId: string | null
│       ├── driverId: string | null
│       ├── isActive: boolean
│       └── createdAt: timestamp
│
├── routes
│   └── {routeId}
│       ├── name: string
│       ├── shortName: string
│       ├── color: string (hex)
│       ├── fareBase: number
│       ├── farePerKm: number
│       ├── operatingStart: string ("05:00")
│       ├── operatingEnd: string ("22:00")
│       ├── polyline: string (encoded)
│       ├── isActive: boolean
│       └── stops/ (subcollection)
│           └── {stopId}
│               ├── name: string
│               ├── latitude: number
│               ├── longitude: number
│               └── order: number
│
├── activeTrips (real-time tracking)
│   └── {tripId}
│       ├── driverId: string
│       ├── vehicleId: string
│       ├── routeId: string
│       ├── currentLocation:
│       │   ├── latitude: number
│       │   ├── longitude: number
│       │   ├── heading: number
│       │   ├── speed: number
│       │   └── timestamp: timestamp
│       ├── passengerCount: number
│       ├── startedAt: timestamp
│       └── status: "active"
│
└── tripHistory (completed trips)
    └── {tripId}
        ├── driverId: string
        ├── vehicleId: string
        ├── routeId: string
        ├── startedAt: timestamp
        ├── endedAt: timestamp
        ├── durationMinutes: number
        └── avgPassengerCount: number
```

### 10.2 Real-Time Data Flow

```
┌─────────────┐     GPS Update      ┌─────────────┐
│ Driver App  │ ─────────────────▶  │  Firestore  │
│             │   every 10-15s      │ activeTrips │
└─────────────┘                     └──────┬──────┘
                                           │
                                    Real-time sync
                                           │
                                           ▼
                                   ┌──────────────┐
                                   │ Commuter App │
                                   │  (listener)  │
                                   └──────────────┘
```

---

## 11. Security and Privacy

### 11.1 Authentication Model

| User Type | Auth Method | Verification |
|-----------|-------------|--------------|
| Driver | Phone OTP | Phone verified; account approval required |
| Commuter | Email/Phone or Guest | Email verified or phone OTP |
| Admin | Email/Password | Pre-created by super_admin |

### 11.2 Driver Verification Requirements

| Document | Purpose | Process |
|----------|---------|---------|
| Phone Number | Contact + OTP login | Auto-verified via Firebase |
| Full Name | Identity | Admin reviews |
| Driver's License Photo | Prove licensed to drive | Uploaded during registration; admin reviews |
| Vehicle Plate Number | Link to registered vehicle | Admin matches to `vehicles` collection |

### 11.3 Firestore Security Rules (Summary)

| Collection | Read | Write |
|------------|------|-------|
| `users` | Own document only | Own document only (profile updates) |
| `vehicles` | Authenticated users | Admin only |
| `routes` + `stops` | Public (cached for offline) | Admin only |
| `activeTrips` | Public (for real-time map) | Driver (own trip only, validated) |
| `tripHistory` | Driver (own) + Admin | Cloud Functions only |

### 11.4 Privacy Commitments

- **Commuter location is never tracked or stored**
- Driver location is stored only during active trips
- Location history retained for 30 days; trip summary retained for 1 year
- Users can request data deletion (via admin for pilot; self-service post-MVP)

---

## 12. Technical Constraints

### 12.1 Platform-Specific Considerations

| Platform | Constraint | Mitigation |
|----------|------------|------------|
| **iOS** | Background location requires "Always Allow" + background modes | Clear permission explanation; test thoroughly on team devices |
| **iOS** | Strict App Store review | Justify location usage in Info.plist |
| **Android** | Battery optimization kills background apps | Foreground service with notification; instruct users to whitelist |
| **Android** | Fragmentation (many OS versions) | Target API 26+; test on emulator with various API levels |

### 12.2 Firebase Constraints

| Constraint | Impact | Mitigation |
|------------|--------|------------|
| Free tier limits | 50K reads/day, 20K writes/day | Route-based subscriptions; batch updates; monitor usage |
| Firestore latency | ~100-300ms per write | Acceptable for 10-15s update interval |
| No native geospatial queries | Can't do radius queries easily | Filter by route; client-side distance calc |

### 12.3 Google Maps Constraints

| Constraint | Impact | Mitigation |
|------------|--------|------------|
| Free tier: $200/month credit | Covers ~28K map loads or 40K directions | Sufficient for pilot; monitor usage |
| iOS billing differs from Android | Must track both | Set up billing alerts |

---

## 13. Success Metrics

### 13.1 Pilot Success Criteria

| Metric | Target | Measurement |
|--------|--------|-------------|
| App launches without crash | >99% of sessions | Firebase Crashlytics |
| Driver can complete trip flow | 100% success rate | Manual testing |
| Commuter sees live map | <5s load time | Manual timing |
| ETA accuracy | Within 3 min of actual | Field testing with stopwatch |
| System uptime during demo | 100% | Observation |

### 13.2 Usability Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Time to complete first task | <2 min (commuter), <1 min (driver) | User testing |
| Task completion rate | >95% | User testing |
| User satisfaction | >4/5 rating | Post-test survey |

---

## 14. Appendix

### 14.1 Glossary

| Term | Definition |
|------|------------|
| **Active Trip** | A trip that is currently in progress, with live GPS tracking |
| **ETA** | Estimated Time of Arrival at a stop |
| **OTP** | One-Time Password for phone verification |
| **Marker** | A pin or icon on the map representing a jeepney or stop |
| **Route** | A defined path with stops that jeepneys follow |
| **Foreground Service** | Android service that shows a persistent notification to keep app alive |

### 14.2 Reference Documents

| Document | Location |
|----------|----------|
| UI Screen Flow | `docs/03-ui-screen-flow.md` |
| Database Schema | `docs/04-database-schema.md` |
| Sprint Plan | `docs/05-sprint-milestone-plan.md` |
| Risk Assessment | `docs/07-risk-assessment.md` |

### 14.3 Open Questions (To Resolve)

| Question | Owner | Status |
|----------|-------|--------|
| Which jeepney routes to include in pilot? | Team + Operator | Open |
| How many drivers for pilot testing? | Team | Open |
| Admin account credentials for demo | Lead | Open |

---

*End of PRD*
