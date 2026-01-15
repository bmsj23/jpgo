# JeepneyGo: Functional & Non-Functional Requirements

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Functional Requirements (FR)

### 1.1 Driver App Module

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-D01 | Driver Authentication | Must | Drivers shall be able to register and log in using phone number with OTP verification |
| FR-D02 | Trip Activation | Must | Drivers shall be able to start/end a trip with a single tap, selecting their assigned route |
| FR-D03 | GPS Location Broadcasting | Must | The app shall broadcast the driver's GPS location to the backend every 10 seconds while a trip is active |
| FR-D04 | Background Location Tracking | Must | The app shall continue tracking location even when minimized or screen is off |
| FR-D05 | Passenger Count Input | Should | Drivers shall be able to update the current number of passengers (0 to vehicle capacity) |
| FR-D06 | Offline Location Queue | Should | The app shall queue location updates locally when offline and sync when connection is restored |
| FR-D07 | Trip History View | Could | Drivers shall be able to view their past trips with date, route, and duration |
| FR-D08 | Connection Status Indicator | Must | The app shall display real-time connection status (online/offline/syncing) |
| FR-D09 | Route Selection | Must | Drivers shall select from predefined routes configured by administrators |
| FR-D10 | Daily Summary | Could | Drivers shall see a summary of trips completed today |

### 1.2 Commuter App Module

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-C01 | Commuter Registration | Must | Commuters shall be able to register with email or phone number |
| FR-C02 | Guest Mode | Should | Commuters shall be able to use basic map features without registration |
| FR-C03 | Real-Time Map View | Must | The app shall display a map showing all active jeepneys with their current positions |
| FR-C04 | Route Filtering | Must | Commuters shall be able to filter the map by specific routes |
| FR-C05 | Jeepney Details | Must | Tapping a jeepney marker shall show route name, plate number, passenger count, and last update time |
| FR-C06 | ETA Display | Must | The app shall calculate and display estimated arrival time at user-selected stops |
| FR-C07 | Favorite Stops | Should | Commuters shall be able to save frequently used stops for quick access |
| FR-C08 | Approaching Notification | Should | The app shall send push notifications when a jeepney is approaching a saved stop |
| FR-C09 | Route Information | Must | The app shall display route details including terminals, key stops, and operating hours |
| FR-C10 | Fare Estimation | Must | The app shall calculate estimated fare based on origin and destination stops |
| FR-C11 | Seat Availability Indicator | Should | The app shall show seat availability status (available/limited/full) based on driver input |
| FR-C12 | Search Stops | Must | Commuters shall be able to search for stops by name |

### 1.3 Web Dashboard Module (Admin/Operator)

| ID | Requirement | Priority | Description |
|----|-------------|----------|-------------|
| FR-W01 | Admin Authentication | Must | Administrators shall log in with email/password with role-based access control |
| FR-W02 | Live Fleet Map | Must | Dashboard shall display real-time positions of all active jeepneys on a map |
| FR-W03 | Driver Management | Must | Admins shall be able to add, edit, approve, suspend, and delete driver accounts |
| FR-W04 | Vehicle Management | Must | Admins shall be able to register vehicles with plate number, capacity, and assign to drivers |
| FR-W05 | Route Configuration | Must | Admins shall be able to create/edit routes with name, stops (coordinates), and fare matrix |
| FR-W06 | Stop Management | Must | Admins shall be able to add/edit/delete stop locations with name and coordinates |
| FR-W07 | Trip Analytics | Should | Dashboard shall display trip statistics (daily trips, peak hours, route utilization) |
| FR-W08 | Driver Performance | Should | Dashboard shall show driver activity metrics (trips completed, online hours) |
| FR-W09 | Report Generation | Should | Admins shall be able to generate and export reports (CSV/PDF) for trips and usage |
| FR-W10 | Announcement System | Could | Admins shall be able to broadcast announcements to all app users |
| FR-W11 | Incident Logging | Could | Admins shall be able to log and track reported incidents |
| FR-W12 | User Statistics | Should | Dashboard shall display commuter statistics (registrations, active users) |

---

## 2. Non-Functional Requirements (NFR)

### 2.1 Performance

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-P01 | Location Update Latency | < 3 seconds | Time from driver GPS capture to commuter map display shall be under 3 seconds |
| NFR-P02 | App Launch Time | < 4 seconds | Mobile apps shall launch to usable state within 4 seconds on mid-range devices |
| NFR-P03 | Map Load Time | < 2 seconds | Map with jeepney markers shall render within 2 seconds |
| NFR-P04 | Concurrent Users | 500+ | System shall support at least 500 concurrent commuter users |
| NFR-P05 | API Response Time | < 500ms | Backend API responses shall return within 500 milliseconds |

### 2.2 Reliability & Availability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-R01 | System Uptime | 99.5% | System shall maintain 99.5% uptime during operating hours (5 AM - 10 PM) |
| NFR-R02 | Data Persistence | Zero loss | Location data queued offline shall never be lost; must sync when online |
| NFR-R03 | Graceful Degradation | - | App shall remain usable with limited features when offline |
| NFR-R04 | Crash Rate | < 1% | App crash rate shall be below 1% of sessions |

### 2.3 Usability

| ID | Requirement | Target | Description |
|----|-------------|--------|-------------|
| NFR-U01 | Learnability | < 5 min | New users shall be able to perform core tasks within 5 minutes without training |
| NFR-U02 | Driver Interface | One-hand use | Driver app shall be operable with one hand while seated |
| NFR-U03 | Language | Filipino/English | App shall support bilingual interface (Filipino and English) |
| NFR-U04 | Accessibility | WCAG 2.1 AA | App shall meet basic accessibility standards (contrast, touch targets) |

### 2.4 Security

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-S01 | Data Encryption | All data in transit shall use TLS 1.2+ encryption |
| NFR-S02 | Authentication | User sessions shall expire after 30 days of inactivity |
| NFR-S03 | Data Privacy | System shall comply with the Data Privacy Act of 2012 (RA 10173) |
| NFR-S04 | Location Privacy | Commuter location shall not be tracked or stored; only driver location is tracked |
| NFR-S05 | Role-Based Access | Admin functions shall be restricted by role (super-admin, operator, viewer) |

### 2.5 Scalability

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-SC01 | Horizontal Scaling | Backend shall support scaling to handle increased users without code changes |
| NFR-SC02 | Route Expansion | System shall support adding new routes without app updates |
| NFR-SC03 | Multi-City | Architecture shall allow future expansion to other cities |

### 2.6 Maintainability

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-M01 | Code Documentation | All public functions shall have documentation comments |
| NFR-M02 | Modular Architecture | Codebase shall follow clean architecture with separated layers |
| NFR-M03 | Version Control | All code shall be managed in Git with meaningful commit messages |

### 2.7 Compatibility

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-C01 | iOS Version | App shall support iOS 12.0 and above (primary testing platform) |
| NFR-C02 | Android Version | App shall support Android 8.0 (API 26) and above (secondary, smoke-tested) |
| NFR-C03 | Browser Support | Web dashboard shall work on Chrome, Firefox, Safari, Edge (latest 2 versions) |
| NFR-C04 | Screen Sizes | Mobile app shall adapt to screen sizes from 4.7" to 6.7" |

---

## 3. Requirements Traceability

### 3.1 Priority Legend

| Priority | Description |
|----------|-------------|
| **Must** | Critical for MVP; system cannot function without it |
| **Should** | Important for user experience; include if time permits |
| **Could** | Nice to have; defer to post-pilot if needed |

### 3.2 Requirements Summary

| Category | Must | Should | Could | Total |
|----------|------|--------|-------|-------|
| Driver App | 6 | 2 | 2 | 10 |
| Commuter App | 7 | 4 | 1 | 12 |
| Web Dashboard | 6 | 4 | 2 | 12 |
| Non-Functional | 17 | - | - | 17 |
| **Total** | **36** | **10** | **5** | **51** |
