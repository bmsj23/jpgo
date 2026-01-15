# JeepneyGo: Software-Only Architecture Documentation

## Overview

This directory contains comprehensive planning documents for the JeepneyGo real-time transport monitoring system, following the pivot from IoT hardware to a software-only architecture.

---

## Document Index

| # | Document | Description | File |
|---|----------|-------------|------|
| 1 | **Requirements** | Functional and non-functional requirements for all system modules | [01-requirements.md](./01-requirements.md) |
| 2 | **Project Structure** | High-level architecture and Flutter project organization | [02-project-structure.md](./02-project-structure.md) |
| 3 | **UI Screen Flow** | Screen flows and wireframes for Driver, Commuter, and Admin apps | [03-ui-screen-flow.md](./03-ui-screen-flow.md) |
| 4 | **Database Schema** | Cloud Firestore collections, documents, and security rules | [04-database-schema.md](./04-database-schema.md) |
| 5 | **Sprint Plan** | 16-week development timeline with detailed sprint tasks | [05-sprint-milestone-plan.md](./05-sprint-milestone-plan.md) |
| 6 | **Learning Resources** | Curated tutorials and documentation for the tech stack | [06-learning-resources.md](./06-learning-resources.md) |
| 7 | **Risk Assessment** | Identified risks, mitigations, and contingency plans | [07-risk-assessment.md](./07-risk-assessment.md) |
| 9 | **Development Checklist** | 174 task checklist organized by development phase | [09-development-checklist.md](./09-development-checklist.md) |
| 10 | **Multi-Phase Plan** | Strategic 16-week development roadmap | [10-multi-phase-plan.md](./10-multi-phase-plan.md) |
| 11 | **PWA Development Guide** | How to develop, test, and deploy as Web PWAs | [11-pwa-development-guide.md](../jeepneygo/docs/11-pwa-development-guide.md) |

---

## Project Summary

### Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                      JEEPNEYGO SYSTEM                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────┐       │
│  │   DRIVER    │     │  COMMUTER   │     │    WEB      │       │
│  │    APP      │     │    APP      │     │  DASHBOARD  │       │
│  │  (Flutter)  │     │  (Flutter)  │     │(Flutter Web)│       │
│  └──────┬──────┘     └──────┬──────┘     └──────┬──────┘       │
│         │                   │                   │               │
│         └───────────────────┼───────────────────┘               │
│                             │                                   │
│                    ┌────────┴────────┐                          │
│                    │  FIREBASE CLOUD │                          │
│                    │  • Auth         │                          │
│                    │  • Firestore    │                          │
│                    │  • Functions    │                          │
│                    │  • Hosting      │                          │
│                    │  • FCM          │                          │
│                    └─────────────────┘                          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Tech Stack

| Layer | Technology |
|-------|------------|
| Mobile & Web | Flutter (Dart) |
| Backend | Firebase (Auth, Firestore, Functions, Hosting) |
| Maps | Google Maps API |
| State Management | Provider |
| Navigation | GoRouter |

### Key Features

**Driver App:**
- GPS location broadcasting (replaces IoT hardware)
- Trip start/end management
- Passenger count input
- Offline-capable location queue

**Commuter App:**
- Real-time jeepney map display
- ETA at selected stops
- Route information and fare calculator
- Push notifications for approaching jeepneys

**Web Dashboard:**
- Live fleet monitoring
- Driver, vehicle, and route management
- Analytics and reporting
- Data export

---

## Timeline

| Phase | Duration | Deliverable |
|-------|----------|-------------|
| Phase 0: Foundation | Weeks 1-2 | Dev environment, Firebase setup |
| Phase 1: Driver App | Weeks 3-6 | Auth, GPS tracking, trip management |
| Phase 2: Commuter App | Weeks 7-10 | Map view, ETA, notifications |
| Phase 3: Web Dashboard | Weeks 11-13 | Admin panel, analytics |
| Phase 4: Testing & Deploy | Weeks 14-16 | Bug fixes, pilot launch |

---

## Key Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Framework | Flutter | Single codebase for Android, iOS, and Web; beginner-friendly |
| Backend | Firebase | No server management; real-time sync; generous free tier |
| GPS Source | Driver's phone | Eliminates hardware cost; simpler deployment |
| State Management | Provider | Simpler than alternatives for beginners |
| Database | Firestore | Real-time listeners; offline support; NoSQL flexibility |

---

## Top Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| Background location restrictions | Critical | Foreground service with notification |
| Driver non-compliance | Critical | Incentive program, simple UX |
| Battery drain | Critical | Battery-optimized GPS, require charging |
| Team inexperience | High | Structured learning weeks, pair programming |
| Timeline pressure | High | Strict scope control, MVP focus |

---

## Quick Links

- [Project Charter](../project_charter.txt)
- [Flutter Documentation](https://docs.flutter.dev)
- [Firebase Documentation](https://firebase.google.com/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev)

---

## Document Metadata

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Location | Lipa City, Batangas, Philippines |
| Duration | 16 weeks (December 2025 - March 2026) |
| Version | 1.0 |
| Last Updated | January 2026 |
