# JeepneyGo: Sprint/Milestone Plan

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Project Timeline Overview

**Total Duration:** 16 weeks (December 2025 - March 2026)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                    JEEPNEYGO DEVELOPMENT TIMELINE                            │
│                     (Dec 2025 - March 2026)                                  │
└──────────────────────────────────────────────────────────────────────────────┘

Week   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16
      Dec------Jan------▶Feb------▶Mar------▶
       │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │
       ├───┴───┤                                                   
       │Phase 0│  Foundation & Setup                               
       │       │                                                   
       └───────┼───┴───┴───┴───┤                                   
               │    Phase 1    │  Driver App Development           
               │               │                                   
               └───────────────┼───┴───┴───┴───┤                   
                               │    Phase 2    │  Commuter App     
                               │               │                   
                               └───────────────┼───┴───┴───┤       
                                               │  Phase 3  │  Web Dashboard
                                               │           │       
                                               └───────────┼───┴───┤
                                                           │Phase 4│ Test & Deploy
                                                           │       │
                                                           └───────┘
```

---

## 2. Phase Breakdown

| Phase | Duration | Focus Area | Key Deliverables |
|-------|----------|------------|------------------|
| **Phase 0** | Weeks 1-2 | Foundation & Setup | Dev environment, Firebase project, app shell |
| **Phase 1** | Weeks 3-6 | Driver App | Authentication, GPS tracking, trip management |
| **Phase 2** | Weeks 7-10 | Commuter App | Map view, real-time display, ETA, notifications |
| **Phase 3** | Weeks 11-13 | Web Dashboard | Admin panel, fleet map, analytics |
| **Phase 4** | Weeks 14-16 | Testing & Deployment | Bug fixes, pilot launch, documentation |

---

## 3. Detailed Sprint Breakdown

### Phase 0: Foundation & Setup (Weeks 1-2)

**Duration:** December 1 - December 14, 2025

#### Sprint 0: Environment Setup

| ID | Task | Assignee | Est. Days | Dependencies | Status |
|----|------|----------|-----------|--------------|--------|
| S0-1 | Install Flutter SDK, Xcode, VS Code | All | 1 | - | Pending |
| S0-2 | Create Firebase project (dev environment) | Lead | 0.5 | - | Pending |
| S0-3 | Enable Firebase Auth, Firestore, Hosting, FCM | Lead | 0.5 | S0-2 | Pending |
| S0-4 | Initialize Flutter monorepo with two apps + shared packages | Lead | 1.5 | S0-1 | Pending |
| S0-5 | Connect both Flutter apps to Firebase (iOS configs) | Lead | 1 | S0-3, S0-4 | Pending |
| S0-6 | Set up Git repository and branching strategy | Lead | 0.5 | S0-4 | Pending |
| S0-7 | Create Firestore collections (empty schemas) | All | 1 | S0-3 | Pending |
| S0-8 | Add core dependencies (pubspec.yaml for all packages) | Lead | 0.5 | S0-4 | Pending |
| S0-9 | Build basic navigation structure (GoRouter) for both apps | Dev 1 | 1.5 | S0-8 | Pending |
| S0-10 | Create shared theme, design tokens, and UI components | Dev 2 | 1.5 | S0-8 | Pending |
| S0-11 | Team Flutter + iOS development tutorial completion | All | 3 | S0-1 | Pending |
| S0-12 | Configure iOS background location entitlements | Lead | 0.5 | S0-4 | Pending |

**Sprint 0 Exit Criteria:**
- [ ] All team members can run both Flutter apps on iOS Simulator
- [ ] Firebase console accessible to all team members
- [ ] Both apps (Driver + Commuter) open on iOS Simulator
- [ ] Git repository created with monorepo structure
- [ ] Team completed basic Flutter + iOS tutorials

---

### Phase 1: Driver App Development (Weeks 3-6)

**Duration:** December 15, 2025 - January 11, 2026

#### Sprint 1: Authentication (Weeks 3-4)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S1-1 | Create User model and repository | 4 | Must | Pending |
| S1-2 | Implement phone auth with Firebase | 6 | Must | Pending |
| S1-3 | Build Login screen UI | 4 | Must | Pending |
| S1-4 | Build OTP verification screen | 4 | Must | Pending |
| S1-5 | Build Driver registration form | 6 | Must | Pending |
| S1-6 | Implement role-based routing (driver vs commuter) | 4 | Must | Pending |
| S1-7 | Create AuthProvider/AuthState management | 6 | Must | Pending |
| S1-8 | Add session persistence (stay logged in) | 3 | Must | Pending |
| S1-9 | Handle auth errors gracefully | 3 | Should | Pending |
| S1-10 | Write unit tests for auth logic | 4 | Should | Pending |

**Sprint 1 Exit Criteria:**
- [ ] Driver can register with phone number
- [ ] OTP verification works correctly
- [ ] Driver stays logged in after app restart
- [ ] Role correctly determined after login
- [ ] Error messages display for invalid inputs

---

#### Sprint 2: GPS & Trip Management (Weeks 5-6)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S2-1 | Implement location service (geolocator + permission_handler) | 6 | Must | Pending |
| S2-2 | Request and handle iOS location permissions (Always Allow flow) | 5 | Must | Pending |
| S2-3 | Build Driver Home screen | 6 | Must | Pending |
| S2-4 | Create Route model and repository | 4 | Must | Pending |
| S2-5 | Build Route Selection screen | 4 | Must | Pending |
| S2-6 | Create Trip model and repository | 4 | Must | Pending |
| S2-7 | Build Active Trip screen | 8 | Must | Pending |
| S2-8 | Implement iOS background location tracking (BGTaskScheduler) | 10 | Must | Pending |
| S2-9 | Broadcast location to Firestore (every 10-15s) | 6 | Must | Pending |
| S2-10 | Build Passenger Counter widget (large touch targets) | 3 | Should | Pending |
| S2-11 | Implement offline location queue with Firestore offline | 6 | Should | Pending |
| S2-12 | Add connection status indicator | 3 | Should | Pending |
| S2-13 | Create Trip Summary screen | 4 | Could | Pending |
| S2-14 | Test on physical iOS device (background tracking) | 4 | Must | Pending |

**Sprint 2 Exit Criteria:**
- [ ] Driver can start and end a trip on iOS
- [ ] Location updates appear in Firestore console
- [ ] Background tracking works when app is minimized (tested on real iPhone)
- [ ] Passenger count updates correctly
- [ ] Connection status displays accurately

---

### Phase 2: Commuter App Development (Weeks 7-10)

**Duration:** January 12 - February 8, 2026

#### Sprint 3: Map & Real-time Display (Weeks 7-8)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S3-1 | Integrate Google Maps Flutter plugin | 4 | Must | Pending |
| S3-2 | Build Commuter Home/Map screen | 8 | Must | Pending |
| S3-3 | Create real-time listener for activeTrips | 6 | Must | Pending |
| S3-4 | Display jeepney markers on map | 6 | Must | Pending |
| S3-5 | Create custom jeepney marker icons | 4 | Should | Pending |
| S3-6 | Build Jeepney Details bottom sheet | 6 | Must | Pending |
| S3-7 | Implement route filtering on map | 4 | Must | Pending |
| S3-8 | Create Stop model and repository | 4 | Must | Pending |
| S3-9 | Display stop markers on map | 4 | Should | Pending |
| S3-10 | Add map controls (zoom, center on user) | 3 | Should | Pending |
| S3-11 | Optimize map performance (marker clustering) | 6 | Could | Pending |

**Sprint 3 Exit Criteria:**
- [ ] Map displays with Google Maps integration
- [ ] Jeepney positions display and update in real-time
- [ ] Tapping a marker shows jeepney details
- [ ] Can filter jeepneys by route
- [ ] Map performance is smooth

---

#### Sprint 4: ETA & Routes (Weeks 9-10)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S4-1 | Build Stop Search screen | 6 | Must | Pending |
| S4-2 | Build Stop Details screen with ETA | 8 | Must | Pending |
| S4-3 | Implement ETA calculation logic | 10 | Must | Pending |
| S4-4 | Build Routes List screen | 4 | Must | Pending |
| S4-5 | Build Route Details screen | 6 | Must | Pending |
| S4-6 | Implement fare calculation logic | 4 | Must | Pending |
| S4-7 | Set up Firebase Cloud Messaging (FCM) | 4 | Should | Pending |
| S4-8 | Implement approaching jeepney notifications | 8 | Should | Pending |
| S4-9 | Build Favorites screen | 4 | Should | Pending |
| S4-10 | Implement save/remove favorite stops | 4 | Should | Pending |
| S4-11 | Build Profile screen with settings | 4 | Could | Pending |
| S4-12 | Add language toggle (EN/FIL) | 6 | Could | Pending |

**Sprint 4 Exit Criteria:**
- [ ] Can search and select stops
- [ ] ETA displays correctly for selected stop
- [ ] All routes viewable with complete info
- [ ] Fare calculation works
- [ ] Push notifications work (if implemented)

---

### Phase 3: Web Dashboard Development (Weeks 11-13)

**Duration:** February 9 - March 1, 2026

#### Sprint 5: Admin Core Features (Weeks 11-12)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S5-1 | Set up Flutter Web configuration | 4 | Must | Pending |
| S5-2 | Build responsive sidebar navigation | 6 | Must | Pending |
| S5-3 | Create admin login screen | 4 | Must | Pending |
| S5-4 | Build Dashboard overview screen | 6 | Must | Pending |
| S5-5 | Build Fleet Map screen (full-page map) | 8 | Must | Pending |
| S5-6 | Build Drivers Management screen (table + CRUD) | 10 | Must | Pending |
| S5-7 | Build Vehicles Management screen | 8 | Must | Pending |
| S5-8 | Build Routes Management screen | 10 | Must | Pending |
| S5-9 | Implement route stop editor (map-based) | 8 | Should | Pending |
| S5-10 | Add driver approval workflow | 4 | Should | Pending |

**Sprint 5 Exit Criteria:**
- [ ] Admin can log in to dashboard
- [ ] Fleet map shows all active jeepneys in real-time
- [ ] Can create, read, update, delete drivers
- [ ] Can create, read, update, delete vehicles
- [ ] Can create, read, update, delete routes with stops

---

#### Sprint 6: Analytics (Week 13)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S6-1 | Build Analytics screen layout | 4 | Should | Pending |
| S6-2 | Implement trip statistics queries | 6 | Should | Pending |
| S6-3 | Add charts (using fl_chart or similar) | 8 | Should | Pending |
| S6-4 | Implement CSV export functionality | 4 | Should | Pending |
| S6-5 | Build driver performance view | 6 | Could | Pending |
| S6-6 | Add date range filtering | 4 | Should | Pending |
| S6-7 | Implement PDF report generation | 6 | Could | Pending |

**Sprint 6 Exit Criteria:**
- [ ] Dashboard shows trip statistics
- [ ] Charts display peak hours, route usage
- [ ] Can export data as CSV
- [ ] Date range filtering works

---

### Phase 4: Testing & Deployment (Weeks 14-16)

**Duration:** March 2 - March 20, 2026

#### Sprint 7: Integration Testing (Weeks 14-15)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S7-1 | End-to-end testing: driver flow | 8 | Must | Pending |
| S7-2 | End-to-end testing: commuter flow | 8 | Must | Pending |
| S7-3 | End-to-end testing: admin flow | 6 | Must | Pending |
| S7-4 | Performance testing: many jeepneys on map | 6 | Should | Pending |
| S7-5 | Fix critical bugs | 20 | Must | Pending |
| S7-6 | Fix high-priority bugs | 15 | Should | Pending |
| S7-7 | User acceptance testing with stakeholders | 8 | Must | Pending |
| S7-8 | Accessibility review | 4 | Could | Pending |

**Sprint 7 Exit Criteria:**
- [ ] All critical user flows work end-to-end
- [ ] No critical bugs remaining
- [ ] Performance acceptable with expected load
- [ ] Stakeholder approval received

---

#### Sprint 8: Deployment (Week 16)

| ID | Task | Est. Hours | Priority | Status |
|----|------|-----------|----------|--------|
| S8-1 | Create Firebase production project | 2 | Must | Pending |
| S8-2 | Set up production environment variables | 2 | Must | Pending |
| S8-3 | Deploy web dashboard to Firebase Hosting | 2 | Must | Pending |
| S8-4 | Generate iOS builds for both apps (Ad Hoc/TestFlight) | 6 | Must | Pending |
| S8-5 | Generate Android APKs for smoke testing | 3 | Should | Pending |
| S8-6 | (Optional) Submit to TestFlight for beta testing | 4 | Could | Pending |
| S8-7 | Write User Manual (commuter) | 6 | Should | Pending |
| S8-8 | Write Driver Manual | 6 | Should | Pending |
| S8-9 | Write Admin Manual | 4 | Should | Pending |
| S8-10 | Onboard pilot drivers (iOS devices) | 4 | Must | Pending |
| S8-11 | Monitor pilot and collect feedback | Ongoing | Must | Pending |

**Sprint 8 Exit Criteria:**
- [ ] Production environment fully configured
- [ ] Web dashboard deployed and accessible
- [ ] iOS apps distributed via TestFlight or Ad Hoc
- [ ] Android APKs generated for smoke testing
- [ ] Documentation complete
- [ ] Pilot drivers onboarded and using the app

---

## 4. Milestone Summary

| Milestone | Target Date | Success Criteria |
|-----------|-------------|------------------|
| **M0: Project Kickoff** | Dec 1, 2025 | Charter approved, team assembled |
| **M1: Dev Environment Ready** | Dec 14, 2025 | All devs can build and run app |
| **M2: Auth Complete** | Dec 28, 2025 | Users can register and log in |
| **M3: Driver App MVP** | Jan 11, 2026 | Driver can complete full trip cycle |
| **M4: Commuter App MVP** | Feb 8, 2026 | Commuter can view jeepneys and ETAs |
| **M5: Dashboard MVP** | Feb 22, 2026 | Admin can manage fleet |
| **M6: Full Feature Complete** | Mar 1, 2026 | All features implemented |
| **M7: Testing Complete** | Mar 13, 2026 | All critical bugs fixed |
| **M8: Pilot Launch** | Mar 20, 2026 | App deployed, pilot running |

---

## 5. Resource Allocation

### 5.1 Team Structure

| Role | Responsibilities | Allocation |
|------|------------------|------------|
| **Project Lead** | Architecture, Firebase setup, code reviews | 100% |
| **Developer 1** | Driver app, location services | 100% |
| **Developer 2** | Commuter app, maps integration | 100% |
| **Developer 3** | Web dashboard, analytics | 100% |
| **All** | Testing, documentation | Shared |

### 5.2 Sprint Workload Distribution

| Sprint | Lead | Dev 1 | Dev 2 | Dev 3 |
|--------|------|-------|-------|-------|
| Sprint 0 | Setup, Firebase | Learning | Learning | Learning |
| Sprint 1 | Auth architecture | Auth UI | Auth UI | Support |
| Sprint 2 | Code review | GPS, Trip | Support | Support |
| Sprint 3 | Code review | Support | Maps, Markers | Support |
| Sprint 4 | Code review | Support | ETA, Routes | Support |
| Sprint 5 | Code review | Support | Support | Dashboard |
| Sprint 6 | Code review | Support | Support | Analytics |
| Sprint 7 | Bug triage | Bug fixes | Bug fixes | Bug fixes |
| Sprint 8 | Deployment | Docs | Docs | Docs |

---

## 6. Risk Contingencies for Timeline

| Risk | Impact | Contingency |
|------|--------|-------------|
| Team falls behind on learning | 1-2 week delay | Extend Phase 0, reduce Phase 3 scope |
| GPS tracking issues | 1 week delay | Use simplified tracking, defer background mode |
| Map performance issues | 0.5 week delay | Reduce markers, defer clustering |
| Firebase costs exceed budget | Ongoing | Reduce update frequency, limit pilot size |
| Driver adoption issues | Pilot delay | Focus on fewer, committed drivers |

---

## 7. Weekly Standup Schedule

| Day | Time | Duration | Purpose |
|-----|------|----------|---------|
| Monday | 9:00 AM | 30 min | Sprint planning, task assignment |
| Wednesday | 9:00 AM | 15 min | Mid-week check-in, blocker resolution |
| Friday | 4:00 PM | 30 min | Sprint review, demo progress |

---

## 8. Definition of Done

A task is considered **Done** when:

- [ ] Code is written and compiles without errors
- [ ] Code follows project style guidelines
- [ ] Unit tests pass (if applicable)
- [ ] Feature tested on iOS Simulator and/or physical iPhone (primary)
- [ ] Feature smoke-tested on Android emulator (secondary)
- [ ] Code reviewed by at least one team member
- [ ] Changes committed to Git with meaningful message
- [ ] Documentation updated (if applicable)
- [ ] No known critical bugs
