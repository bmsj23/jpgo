# JeepneyGo Multi-Phase Development Plan

> **Version:** 1.0  
> **Created:** January 14, 2026  
> **Timeline:** 16 weeks (4 months)

---

## Executive Summary

This document outlines the phased approach to developing JeepneyGo, a real-time jeepney monitoring system for Lipa City. The development is structured into 7 distinct phases, each with clear deliverables, success criteria, and handoff points.

---

## Phase Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        DEVELOPMENT TIMELINE                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  Week 1-2     │  Week 3-4     │  Week 5-8     │  Week 9-12   │ Week 13-16│
│               │               │               │              │           │
│  ┌─────────┐  │  ┌─────────┐  │  ┌─────────┐  │  ┌────────┐  │ ┌───────┐ │
│  │ Phase 1 │  │  │ Phase 2 │  │  │Phase 3-4│  │  │Phase 5 │  │ │Phase  │ │
│  │ Found-  │──┼──│  Auth   │──┼──│  Core   │──┼──│Real-   │──┼─│ 6-7   │ │
│  │ ation   │  │  │         │  │  │Features │  │  │ time   │  │ │Polish │ │
│  └─────────┘  │  └─────────┘  │  └─────────┘  │  └────────┘  │ │Deploy │ │
│               │               │               │              │ └───────┘ │
│  ▓▓▓▓▓▓▓░░░  │  ░░░░░░░░░░  │  ░░░░░░░░░░   │  ░░░░░░░░░   │ ░░░░░░░░  │
│  60% Done    │  Not Started  │  Not Started  │  Not Started │Not Started│
│               │               │               │              │           │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Phase 1: Foundation & Infrastructure

**Duration:** 2 weeks (Sprint 0-1)  
**Status:** 🟡 In Progress (60% complete)

### Objectives
1. Establish project architecture and monorepo structure
2. Create shared packages for code reuse
3. Set up external service integrations
4. Define data models and repository patterns

### Deliverables

| Deliverable | Status | Owner |
|-------------|--------|-------|
| Monorepo with Melos | ✅ Complete | Dev Team |
| Driver app scaffold | ✅ Complete | Dev Team |
| Commuter app scaffold | ✅ Complete | Dev Team |
| Admin dashboard scaffold | ✅ Complete | Dev Team |
| jeepneygo_core package | ✅ Complete | Dev Team |
| jeepneygo_ui package | ✅ Complete | Dev Team |
| Firebase project setup | ⏳ Pending | Dev Team |
| Google Maps integration | ⏳ Pending | Dev Team |
| Code generation (Freezed) | ⏳ Pending | Dev Team |

### Success Criteria
- [ ] All packages resolve dependencies without errors
- [ ] Firebase initialized in both mobile apps
- [ ] Google Maps renders in both apps
- [ ] Freezed models generate successfully
- [ ] Apps build for iOS Simulator and Android Emulator

### Handoff Checklist
- [ ] All team members can run `melos bootstrap`
- [ ] Firebase console access shared with team
- [ ] API keys documented in secure location
- [ ] Architecture documented in README

---

## Phase 2: Authentication & User Management

**Duration:** 2 weeks (Sprint 2-3)  
**Status:** ⚪ Not Started

### Objectives
1. Implement phone-based OTP authentication
2. Create driver verification workflow
3. Build commuter onboarding flow
4. Establish session management

### Key Features

#### Driver App
```
┌──────────────────────────────────────────────────────────┐
│                   DRIVER AUTH FLOW                        │
├──────────────────────────────────────────────────────────┤
│                                                           │
│   Splash → Phone Input → OTP → Registration → Pending    │
│                                      │                    │
│                                      ▼                    │
│                              License Photo Upload         │
│                                      │                    │
│                                      ▼                    │
│                         ┌────────────┴────────────┐       │
│                         │                         │       │
│                         ▼                         ▼       │
│                    [Approved]               [Rejected]    │
│                         │                         │       │
│                         ▼                         ▼       │
│                    Home Screen             Rejection Msg  │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

#### Commuter App
```
┌──────────────────────────────────────────────────────────┐
│                  COMMUTER AUTH FLOW                       │
├──────────────────────────────────────────────────────────┤
│                                                           │
│   Splash → Phone Input → OTP → [Optional Profile] → Map  │
│                                        │                  │
│                                        ▼                  │
│                                   [Skip] → Map            │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

### Deliverables

| Deliverable | Target Date | Owner |
|-------------|-------------|-------|
| Phone OTP service | Week 3 | Backend |
| Driver auth screens | Week 3 | Frontend |
| License upload flow | Week 3 | Frontend |
| Commuter auth screens | Week 4 | Frontend |
| Session management | Week 4 | Backend |
| Auto-login logic | Week 4 | Frontend |

### Success Criteria
- [ ] Users can sign in with Philippines phone numbers
- [ ] OTP delivered within 30 seconds
- [ ] Driver can upload license photo
- [ ] Pending status persists across app restarts
- [ ] Commuter can skip profile and access map

### Dependencies
- Firebase Authentication enabled
- Firebase Storage for license photos
- Cloud Functions for phone validation (optional)

---

## Phase 3: Core Features - Driver App

**Duration:** 2 weeks (Sprint 4-5)  
**Status:** ⚪ Not Started

### Objectives
1. Build driver home screen with map
2. Implement trip start/end functionality
3. Create location broadcasting service
4. Build trip history feature

### Key Features

#### Trip Lifecycle
```
┌──────────────────────────────────────────────────────────┐
│                    TRIP LIFECYCLE                         │
├──────────────────────────────────────────────────────────┤
│                                                           │
│                     ┌─────────┐                           │
│                     │  IDLE   │                           │
│                     └────┬────┘                           │
│                          │ [Start Trip]                   │
│                          ▼                                │
│                     ┌─────────┐                           │
│            ┌────────│ ACTIVE  │────────┐                  │
│            │        └────┬────┘        │                  │
│            │             │             │                  │
│     [Update Location]    │    [Update Passengers]         │
│     Every 10-15s         │                                │
│            │             │             │                  │
│            └─────────────┴─────────────┘                  │
│                          │ [End Trip]                     │
│                          ▼                                │
│                    ┌──────────┐                           │
│                    │ COMPLETE │                           │
│                    └──────────┘                           │
│                          │                                │
│                          ▼                                │
│                    Trip Summary                           │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

### Technical Implementation

| Feature | Technology | Notes |
|---------|------------|-------|
| Map Display | Google Maps Flutter | Show assigned route |
| Location | geolocator + BGTaskScheduler | iOS background mode |
| Broadcasting | Cloud Firestore | active_trips collection |
| Trip Storage | Cloud Firestore | trips collection |

### Deliverables

| Deliverable | Target Date | Owner |
|-------------|-------------|-------|
| Driver home screen | Week 5 | Frontend |
| Trip start/end UI | Week 5 | Frontend |
| Location service | Week 5 | Backend/Mobile |
| Background location (iOS) | Week 6 | iOS Dev |
| Passenger count controls | Week 6 | Frontend |
| Trip history screen | Week 6 | Frontend |

### Success Criteria
- [ ] Driver sees assigned route on map
- [ ] Trip start creates Firestore document
- [ ] Location updates every 10-15 seconds while on trip
- [ ] Location continues in background (iOS)
- [ ] Passenger count updates in real-time
- [ ] Trip end removes active_trip document
- [ ] Completed trips appear in history

---

## Phase 4: Core Features - Commuter App

**Duration:** 2 weeks (Sprint 6-7)  
**Status:** ⚪ Not Started

### Objectives
1. Display real-time jeepney locations on map
2. Build route discovery interface
3. Implement jeepney tracking feature
4. Create search functionality

### Key Features

#### Map Interface
```
┌─────────────────────────────────────────┐
│ 🔍 Search routes or stops...            │
├─────────────────────────────────────────┤
│                                         │
│          ┌─────┐                        │
│          │ 🚐  │  Jeepney Marker        │
│          └─────┘                        │
│                                         │
│     ═══════════════════                 │
│         Route Polyline                  │
│                                         │
│                      ┌────┐             │
│                      │ 📍 │ User        │
│                      └────┘             │
│                                         │
│                         ┌─────────────┐ │
│                         │ 📍 My Loc   │ │
│                         │ ➕ Zoom In  │ │
│                         │ ➖ Zoom Out │ │
│                         └─────────────┘ │
├─────────────────────────────────────────┤
│ ┌─────────────────────────────────────┐ │
│ │        Active Jeepneys (12)         │ │
│ │                                     │ │
│ │  🚐 SM Route         5 active       │ │
│ │  🚐 Tambo Route      3 active       │ │
│ │  🚐 Sabang Route     4 active       │ │
│ └─────────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

### Deliverables

| Deliverable | Target Date | Owner |
|-------------|-------------|-------|
| Map with markers | Week 7 | Frontend |
| Route list screen | Week 7 | Frontend |
| Route detail view | Week 7 | Frontend |
| Jeepney tracking | Week 8 | Frontend |
| Search functionality | Week 8 | Frontend |
| Favorites feature | Week 8 | Frontend |

### Success Criteria
- [ ] All active jeepneys display on map
- [ ] Markers update in real-time (<3s delay)
- [ ] User can filter by route
- [ ] Tapping marker shows jeepney details
- [ ] Track feature follows jeepney on map
- [ ] Search returns routes and stops

---

## Phase 5: Real-time Integration & Optimization

**Duration:** 2 weeks (Sprint 8-9)  
**Status:** ⚪ Not Started

### Objectives
1. Optimize Firestore subscriptions
2. Implement marker clustering
3. Handle offline scenarios
4. Ensure smooth real-time updates

### Technical Challenges

| Challenge | Solution |
|-----------|----------|
| Too many markers | Marker clustering with SuperCluster |
| Firestore costs | Route-based subscriptions |
| Stale data | 2-minute timeout + cleanup |
| Battery drain | Throttled location updates |
| Network drops | Offline indicators + queue |

### Performance Targets

| Metric | Target |
|--------|--------|
| Map load time | < 2 seconds |
| Marker update latency | < 3 seconds |
| Memory usage (Driver) | < 150 MB |
| Battery usage (Driver) | < 5%/hour |
| Firestore reads/day | < 50,000 |

---

## Phase 6: Polish & User Experience

**Duration:** 2 weeks (Sprint 10-11)  
**Status:** ⚪ Not Started

### Objectives
1. Implement push notifications
2. Refine UI/UX details
3. Add accessibility features
4. Performance optimization

### Push Notification Types

| Notification | App | Trigger |
|--------------|-----|---------|
| Driver Approved | Driver | Admin approves |
| Driver Rejected | Driver | Admin rejects |
| Jeepney Nearby | Commuter | ETA < 5 min |
| Trip Reminder | Driver | Shift start time |

### UI Polish Checklist
- [ ] Loading skeletons on all lists
- [ ] Empty states with illustrations
- [ ] Error states with retry actions
- [ ] Pull-to-refresh on lists
- [ ] Smooth page transitions
- [ ] Haptic feedback on actions

---

## Phase 7: Testing & Deployment

**Duration:** 4 weeks (Sprint 12-15)  
**Status:** ⚪ Not Started

### Testing Strategy

| Test Type | Coverage Target | Tools |
|-----------|-----------------|-------|
| Unit Tests | 80% repositories | flutter_test, mockito |
| Widget Tests | Key screens | flutter_test |
| Integration | Critical flows | integration_test |
| E2E | Happy paths | Patrol (optional) |

### Deployment Timeline

```
Week 13: Internal Testing
├── Deploy to TestFlight (iOS)
├── Deploy to Internal Track (Android)
└── Team testing and bug bash

Week 14: Beta Testing
├── Expand TestFlight to beta users
├── Collect feedback
└── Fix critical bugs

Week 15: Final Fixes
├── Address beta feedback
├── Performance final pass
└── Prepare store listings

Week 16: Release
├── Submit to App Store
├── Submit to Play Store
├── Monitor and hotfix
└── Celebrate! 🎉
```

---

## Risk Mitigation

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Firebase costs exceed budget | Medium | High | Implement aggressive caching, route-based subs |
| iOS background location rejected | Low | Critical | Follow Apple guidelines, clear usage description |
| Google Maps quota exceeded | Low | High | Cache map tiles, limit API calls |
| Team velocity lower than planned | Medium | Medium | Prioritize MVP features, defer nice-to-haves |
| Driver adoption low | Medium | High | Partner with local transport groups |

---

## Communication Plan

### Weekly Sync
- **When:** Every Monday, 10:00 AM
- **Duration:** 30 minutes
- **Agenda:** Progress review, blockers, week ahead

### Sprint Reviews
- **When:** End of each sprint (bi-weekly)
- **Duration:** 1 hour
- **Agenda:** Demo completed features, stakeholder feedback

### Documentation Updates
- Update PROGRESS.txt after each completed task
- Update this checklist weekly
- Commit changes with clear messages

---

## Appendix: Sprint Mapping

| Phase | Sprints | Calendar Weeks |
|-------|---------|----------------|
| Phase 1 | Sprint 0-1 | Week 1-2 |
| Phase 2 | Sprint 2-3 | Week 3-4 |
| Phase 3 | Sprint 4-5 | Week 5-6 |
| Phase 4 | Sprint 6-7 | Week 7-8 |
| Phase 5 | Sprint 8-9 | Week 9-10 |
| Phase 6 | Sprint 10-11 | Week 11-12 |
| Phase 7 | Sprint 12-15 | Week 13-16 |
