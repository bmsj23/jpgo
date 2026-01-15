# JeepneyGo: UI Screen Flow

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Driver App Screen Flow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          DRIVER APP FLOW                                    │
└─────────────────────────────────────────────────────────────────────────────┘

                              ┌─────────────┐
                              │   SPLASH    │
                              │   SCREEN    │
                              └──────┬──────┘
                                     │
                      ┌──────────────┴──────────────┐
                      ▼                              ▼
              [Not Logged In]                [Logged In]
                      │                              │
                      ▼                              ▼
              ┌─────────────┐               ┌─────────────────┐
              │   LOGIN     │               │  DRIVER HOME    │
              │   SCREEN    │               │    SCREEN       │
              │             │               │                 │
              │ • Phone #   │               │ • Welcome msg   │
              │ • Login btn │               │ • Today stats   │
              └──────┬──────┘               │ • Start Trip    │
                     │                      │ • Trip History  │
                     ▼                      └────────┬────────┘
              ┌─────────────┐                        │
              │   OTP       │         ┌─────────────┴─────────────┐
              │ VERIFICATION│         ▼                           ▼
              └──────┬──────┘  [Start Trip]              [View History]
                     │              │                           │
                     ▼              ▼                           ▼
              ┌─────────────┐ ┌─────────────────┐      ┌─────────────────┐
              │  REGISTER   │ │ ROUTE SELECTION │      │  TRIP HISTORY   │
              │  (if new)   │ │                 │      │                 │
              │             │ │ • List of routes│      │ • Past trips    │
              │ • Full name │ │ • Select one    │      │ • Date, route   │
              │ • Vehicle # │ └────────┬────────┘      │ • Duration      │
              └─────────────┘          │               └─────────────────┘
                                       ▼
                             ┌─────────────────┐
                             │  ACTIVE TRIP    │
                             │    SCREEN       │◄─────────────────────┐
                             │                 │                      │
                             │ ┌─────────────┐ │                      │
                             │ │ Connection  │ │   [Update Count]     │
                             │ │ Status Bar  │ │         │            │
                             │ └─────────────┘ │         ▼            │
                             │                 │  ┌─────────────┐     │
                             │ ┌─────────────┐ │  │ PASSENGER   │     │
                             │ │ Current     │ │  │ COUNTER     │     │
                             │ │ Route       │ │  │             │     │
                             │ └─────────────┘ │  │  [-]  12  [+] ────┘
                             │                 │  │  / 20       │
                             │ ┌─────────────┐ │  └─────────────┘
                             │ │ Passengers  │ │
                             │ │  12 / 20    │ │
                             │ └─────────────┘ │
                             │                 │
                             │ ┌─────────────┐ │
                             │ │  END TRIP   │ │
                             │ │   BUTTON    │ │
                             │ └──────┬──────┘ │
                             └────────┼────────┘
                                      │
                                      ▼
                             ┌─────────────────┐
                             │  TRIP SUMMARY   │
                             │                 │
                             │ • Duration      │
                             │ • Distance      │
                             │ • Route         │
                             │                 │
                             │ [Back to Home]  │
                             └─────────────────┘
```

### 1.1 Driver App Screens Description

| Screen | Purpose | Key Elements |
|--------|---------|--------------|
| **Splash Screen** | App initialization, auth check | Logo, loading indicator |
| **Login Screen** | Driver authentication | Phone number input, login button |
| **OTP Verification** | Verify phone number | 6-digit OTP input, resend button |
| **Register Screen** | New driver registration | Name, license, vehicle info form |
| **Driver Home** | Central hub for drivers | Welcome message, today's stats, action buttons |
| **Route Selection** | Choose route before trip | List of assigned routes |
| **Active Trip** | Main tracking screen | Connection status, route info, passenger count, end button |
| **Passenger Counter** | Update passenger count | +/- buttons, current count display |
| **Trip Summary** | Post-trip information | Duration, distance, earnings estimate |
| **Trip History** | View past trips | List of completed trips with details |

---

## 2. Commuter App Screen Flow

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
              [Guest Mode]                   [Logged In]
                      │                              │
                      └──────────────┬───────────────┘
                                     ▼
                         ┌─────────────────────┐
                         │    HOME SCREEN      │
                         │    (MAP VIEW)       │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │  Search Bar     │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │                 │ │
                         │ │   GOOGLE MAP    │ │
                         │ │  with jeepney   │ │
                         │ │    markers      │ │
                         │ │                 │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ┌─────────────────┐ │
                         │ │ [Routes] [Fav]  │ │
                         │ │  Filter Tabs    │ │
                         │ └─────────────────┘ │
                         │                     │
                         │ ══════════════════ │
                         │ ┌─────────────────┐ │
                         │ │ Bottom Nav Bar  │ │
                         │ │ Map|Routes|Favs │ │
                         │ │    |Profile     │ │
                         │ └─────────────────┘ │
                         └──────────┬──────────┘
                                    │
        ┌───────────────┬───────────┼───────────┬───────────────┐
        ▼               ▼           ▼           ▼               ▼
  [Tap Marker]    [Search Stop]  [Routes]   [Favorites]    [Profile]
        │               │           │           │               │
        ▼               ▼           ▼           ▼               ▼
┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│ JEEPNEY     │ │ STOP        │ │ ROUTES      │ │ FAVORITES   │ │ PROFILE     │
│ DETAILS     │ │ SEARCH      │ │ LIST        │ │ SCREEN      │ │ SCREEN      │
│ (Bottom     │ │             │ │             │ │             │ │             │
│  Sheet)     │ │ • Keyboard  │ │ • All routes│ │ • Saved     │ │ • Name      │
│             │ │ • Results   │ │ • Tap for   │ │   stops     │ │ • Settings  │
│ • Route     │ │ • Tap to    │ │   details   │ │ • Tap for   │ │ • Language  │
│ • Plate #   │ │   select    │ │             │ │   ETA       │ │ • Logout    │
│ • Passengers│ └──────┬──────┘ └──────┬──────┘ └─────────────┘ └─────────────┘
│ • ETA to me │        │               │
│             │        ▼               ▼
│ [Track This]│ ┌─────────────┐ ┌─────────────────┐
└──────┬──────┘ │ STOP        │ │ ROUTE DETAILS   │
       │        │ DETAILS     │ │                 │
       │        │             │ │ • Terminals     │
       │        │ • Stop name │ │ • All stops     │
       │        │ • Next ETAs │ │ • Fare matrix   │
       │        │ • Add to    │ │ • Operating hrs │
       │        │   favorites │ │ • Active jeeps  │
       │        └─────────────┘ └─────────────────┘
       │
       ▼
┌─────────────────┐
│ TRACKING VIEW   │
│                 │
│ • Selected jeep │
│   highlighted   │
│ • ETA countdown │
│ • Notification  │
│   when near     │
└─────────────────┘
```

### 2.1 Commuter App Screens Description

| Screen | Purpose | Key Elements |
|--------|---------|--------------|
| **Splash Screen** | App initialization | Logo, loading indicator |
| **Home/Map View** | Main screen with live map | Google Map, jeepney markers, search bar, bottom nav |
| **Jeepney Details** | Info about selected jeepney | Route, plate number, passengers, ETA, track button |
| **Stop Search** | Find stops by name | Search input, results list |
| **Stop Details** | Information about a stop | Stop name, next arriving jeepneys with ETAs |
| **Routes List** | Browse all routes | List of routes with basic info |
| **Route Details** | Full route information | Terminals, stops, fare matrix, operating hours |
| **Favorites** | Saved stops for quick access | List of favorite stops |
| **Profile** | User settings | Name, language preference, logout |
| **Tracking View** | Follow a specific jeepney | Highlighted jeepney, ETA countdown |

---

## 3. Web Dashboard Screen Flow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       WEB DASHBOARD FLOW                                    │
└─────────────────────────────────────────────────────────────────────────────┘

                        ┌─────────────────┐
                        │   LOGIN PAGE    │
                        │                 │
                        │  • Email        │
                        │  • Password     │
                        └────────┬────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│  ┌──────────────┐  ┌────────────────────────────────────────────────────┐  │
│  │              │  │                                                    │  │
│  │   SIDEBAR    │  │                    MAIN CONTENT                    │  │
│  │              │  │                                                    │  │
│  │  ┌────────┐  │  │  ┌────────────────────────────────────────────┐   │  │
│  │  │   D    │  │  │  │           DASHBOARD (Default)              │   │  │
│  │  │Dashboard│◄─┼──┼─▶│                                            │   │  │
│  │  └────────┘  │  │  │  ┌─────────┐ ┌─────────┐ ┌─────────┐       │   │  │
│  │              │  │  │  │Active   │ │Trips    │ │Online   │       │   │  │
│  │  ┌────────┐  │  │  │  │Jeepneys │ │Today    │ │Drivers  │       │   │  │
│  │  │   M    │  │  │  │  │   12    │ │  156    │ │   8     │       │   │  │
│  │  │Fleet   │◄─┼──┼──│  └─────────┘ └─────────┘ └─────────┘       │   │  │
│  │  │Map     │  │  │  │                                            │   │  │
│  │  └────────┘  │  │  │  ┌──────────────────────────────────────┐  │   │  │
│  │              │  │  │  │          Mini Fleet Map              │  │   │  │
│  │  ┌────────┐  │  │  │  │                                      │  │   │  │
│  │  │   U    │  │  │  │  └──────────────────────────────────────┘  │   │  │
│  │  │Drivers │◄─┼──┼──│                                            │   │  │
│  │  └────────┘  │  │  └────────────────────────────────────────────┘   │  │
│  │              │  │                                                    │  │
│  │  ┌────────┐  │  │  ┌────────────────────────────────────────────┐   │  │
│  │  │   V    │  │  │  │           FLEET MAP (Full)                 │   │  │
│  │  │Vehicles│◄─┼──┼─▶│                                            │   │  │
│  │  └────────┘  │  │  │  • Real-time jeepney positions            │   │  │
│  │              │  │  │  • Click jeepney for details              │   │  │
│  │  ┌────────┐  │  │  │  • Filter by route                        │   │  │
│  │  │   R    │  │  │  └────────────────────────────────────────────┘   │  │
│  │  │Routes  │◄─┼──┼──│                                                │  │
│  │  └────────┘  │  │  ┌────────────────────────────────────────────┐   │  │
│  │              │  │  │           DRIVERS MANAGEMENT               │   │  │
│  │  ┌────────┐  │  │  │                                            │   │  │
│  │  │   A    │  │  │  │  [+ Add Driver]              [Search...]  │   │  │
│  │  │Analytics◄─┼──┼─▶│                                            │   │  │
│  │  └────────┘  │  │  │  ┌──────────────────────────────────────┐  │   │  │
│  │              │  │  │  │ Name    │ Phone   │ Vehicle │ Status │  │   │  │
│  │  ┌────────┐  │  │  │  ├─────────┼─────────┼─────────┼────────│  │   │  │
│  │  │   S    │  │  │  │  │ Juan    │ 09xx    │ ABC-123 │ Active │  │   │  │
│  │  │Settings│  │  │  │  │ Pedro   │ 09xx    │ XYZ-789 │ Pending│  │   │  │
│  │  └────────┘  │  │  │  └──────────────────────────────────────┘  │   │  │
│  │              │  │  └────────────────────────────────────────────┘   │  │
│  └──────────────┘  │                                                    │  │
│                    │  ┌────────────────────────────────────────────┐   │  │
│                    │  │           ANALYTICS                        │   │  │
│                    │  │                                            │   │  │
│                    │  │  • Trips over time (line chart)           │   │  │
│                    │  │  • Peak hours (bar chart)                 │   │  │
│                    │  │  • Route utilization (pie chart)          │   │  │
│                    │  │  • [Export CSV] [Export PDF]              │   │  │
│                    │  └────────────────────────────────────────────┘   │  │
│                    └────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 3.1 Web Dashboard Screens Description

| Screen | Purpose | Key Elements |
|--------|---------|--------------|
| **Login** | Admin authentication | Email, password, login button |
| **Dashboard** | Overview and quick stats | Stat cards, mini fleet map, recent activity |
| **Fleet Map** | Full-screen real-time tracking | Interactive map, jeepney markers, filters |
| **Drivers Management** | CRUD for driver accounts | Data table, add/edit forms, approval workflow |
| **Vehicles Management** | CRUD for vehicles | Data table, vehicle registration form |
| **Routes Management** | Configure routes and stops | Route list, map-based stop editor |
| **Analytics** | Reports and statistics | Charts, date filters, export buttons |
| **Settings** | System configuration | App settings, admin preferences |

---

## 4. Screen Inventory Summary

| App | Screen | Priority | Complexity | Notes |
|-----|--------|----------|------------|-------|
| **Driver** | Splash | Must | Low | Check auth state |
| | Login | Must | Medium | Phone + OTP |
| | OTP Verification | Must | Medium | 6-digit code |
| | Register (first-time) | Must | Medium | Capture driver details |
| | Driver Home | Must | Medium | Central hub |
| | Route Selection | Must | Low | Before trip start |
| | Active Trip | Must | High | GPS broadcasting, core screen |
| | Passenger Counter (modal) | Should | Low | Quick +/- input |
| | Trip Summary | Should | Low | After trip ends |
| | Trip History | Could | Medium | Past trips list |
| **Commuter** | Splash | Must | Low | Check auth state |
| | Home/Map View | Must | High | Core screen |
| | Jeepney Details (bottom sheet) | Must | Medium | On marker tap |
| | Stop Search | Must | Medium | Find stops |
| | Stop Details | Must | Medium | ETA display |
| | Routes List | Must | Low | All routes |
| | Route Details | Must | Medium | Full route info |
| | Favorites | Should | Low | Saved stops |
| | Profile | Should | Low | Settings |
| | Login/Register | Should | Medium | For personalization |
| **Web** | Login | Must | Low | Admin auth |
| | Dashboard | Must | Medium | Overview stats |
| | Fleet Map | Must | High | Real-time tracking |
| | Drivers Management | Must | Medium | CRUD |
| | Vehicles Management | Must | Medium | CRUD |
| | Routes Management | Must | High | CRUD with map |
| | Analytics | Should | High | Charts/reports |
| | Settings | Could | Low | System config |

---

## 5. Navigation Patterns

### 5.1 Driver App Navigation

```
Bottom Navigation: None (simple linear flow)

Primary Flow:
Home → Route Selection → Active Trip → Trip Summary → Home

Secondary:
Home → Trip History
Home → Profile/Settings
```

### 5.2 Commuter App Navigation

```
Bottom Navigation Bar:
┌─────────┬─────────┬─────────┬─────────┐
│   Map   │  Routes │  Favs   │ Profile │
└─────────┴─────────┴─────────┴─────────┘

Tab Navigation on Map:
[All Routes] [Following]
```

### 5.3 Web Dashboard Navigation

```
Sidebar Navigation:
├── Dashboard (default)
├── Fleet Map
├── Management
│   ├── Drivers
│   ├── Vehicles
│   └── Routes
├── Analytics
└── Settings
```

---

## 6. Responsive Breakpoints

### 6.1 Mobile App

| Device | Width | Layout |
|--------|-------|--------|
| Small phone | < 360px | Compact spacing |
| Normal phone | 360-414px | Standard layout |
| Large phone | 414-480px | Standard layout |
| Small tablet | 480-768px | Adaptive layout |

### 6.2 Web Dashboard

| Breakpoint | Width | Layout |
|------------|-------|--------|
| Mobile | < 768px | Collapsed sidebar, stacked content |
| Tablet | 768-1024px | Mini sidebar, adaptive grid |
| Desktop | 1024-1440px | Full sidebar, 2-3 column grid |
| Large | > 1440px | Full sidebar, max-width container |
