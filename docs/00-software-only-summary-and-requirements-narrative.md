# JeepneyGo (Software-Only): Project Summary and Requirements (Narrative Format)

## Document Information

Project: JeepneyGo: Real-Time Transport Monitoring System
Version: 2.0
Date: January 2026
Status: Draft (Software-Only Pivot)

---

## Abstract

This document presents a software-only project summary and consolidated requirements specification for JeepneyGo, a real-time jeepney transport monitoring system intended for pilot deployment in Lipa City. The system consists of two mobile applications (Driver and Commuter) and a web-based dashboard (Admin/Operator). The driver’s smartphone GPS serves as the telemetry source for vehicle location updates during active trips. The commuter application provides near-real-time vehicle visibility on a digital map, route information, approximate ETAs at stops, and optional approaching notifications. The dashboard supports operational monitoring and basic analytics through centralized management of drivers, vehicles, routes, and stops. The document also defines non-functional requirements for performance, reliability, security, privacy, cost controls, and compatibility.

## 1. Introduction

### 1.1 Background

Public jeepney commuting in Lipa City remains difficult to plan due to uncertain arrival times and limited visibility of vehicle positions. Commuters often rely on informal information channels, which contributes to inefficient waiting behavior and overcrowding at stops. Operators and coordinators also face challenges in understanding route utilization, driver activity, and service consistency.

### 1.2 Purpose of the System

JeepneyGo aims to improve transparency and predictability in jeepney operations through a software-based real-time monitoring approach. The primary mechanism is continuous location reporting from the driver’s smartphone during an active trip, enabling passenger-facing visibility and operator-facing monitoring without relying on dedicated IoT hardware.

### 1.3 Software-Only Scope Statement

This specification adopts a fully software-only implementation. Dedicated GPS tracking devices, installation manuals, and hardware dependencies are treated as deprecated for the MVP and are not included in the deliverables described herein.

## 2. Stakeholders and User Roles

JeepneyGo defines three primary stakeholder roles.

Drivers are responsible for initiating and ending trips, permitting location tracking, and maintaining basic operational inputs such as passenger count. Commuters use the system to view near-real-time jeepney positions, understand route information, search for stops, and view approximate ETAs. Admins/Operators manage the system configuration (drivers, vehicles, routes, and stops), observe fleet activity, and generate operational summaries.

## 3. System Overview

### 3.1 System Components

The system consists of three client applications and a cloud backend.

The Driver App is a Flutter-based mobile application (iOS primary, Android secondary) used by drivers to authenticate via phone OTP, select a route, start a trip, and publish periodic GPS location updates. The Commuter App is a separate Flutter-based mobile application (iOS primary, Android secondary) that renders a live map and provides search, route browsing, and ETA visualization features. The two mobile apps are distributed separately to provide a cleaner user experience for each role. The Web Dashboard is a Flutter Web application that enables administrative configuration and monitoring.

### 3.2 Backend and Services

Firebase Auth is used for authentication. Cloud Firestore is used as the primary data store for routes, stops, users, vehicles, and active trip telemetry. Cloud Functions are used for server-side validation, aggregation, scheduled cleanup, and controlled creation of derived data such as historical trip summaries when appropriate. Firebase Cloud Messaging is used to deliver approaching notifications. Google Maps SDK for Flutter is used to render maps and markers.

### 3.3 Data Model Summary

JeepneyGo uses the following primary Firestore collections: `users`, `vehicles`, `routes`, and `activeTrips`. Route stop data is stored under `routes/{routeId}/stops`, and commuter favorites are stored under `users/{uid}/favorites`. Completed trip data is stored in `tripHistory`, with optional per-trip breadcrumbs stored under `activeTrips/{tripId}/locationHistory` depending on retention and cost constraints.

## 4. Scope Delimitation (MVP)

### 4.1 In-Scope

The MVP includes: phone-based tracking, trip lifecycle management, near-real-time commuter map view, route filtering, stop search, ETA display using available route and stop geometry, favorites, optional approaching notifications, admin CRUD for drivers/vehicles/routes/stops, a fleet monitoring map, basic analytics, and CSV export.

### 4.2 Out-of-Scope (Deferred)

The MVP explicitly defers: dedicated IoT trackers, sensor-based passenger counting, live traffic ingestion and traffic-aware ETA, a full advertising platform, multi-city expansion, and citywide production rollout.

## 5. Functional Requirements

Functional requirements are enumerated for each module. The priority labels are interpreted as follows: Must (required for MVP operation), Should (important but negotiable if time-constrained), and Could (optional enhancements).

### 5.1 Driver App Functional Requirements

FR-D01 (Must): Driver Authentication. Drivers shall be able to register and log in using phone number with OTP verification.

FR-D02 (Must): Trip Activation. Drivers shall be able to start and end a trip with a single tap after selecting their assigned route.

FR-D03 (Must): GPS Location Broadcasting. The app shall broadcast the driver’s GPS location to the backend at a configured interval, with a default interval of 10 seconds, while a trip is active.

FR-D04 (Must): Background Location Tracking. The app shall continue tracking location during an active trip when minimized or screen is off, subject to OS rules.

FR-D05 (Should): Passenger Count Input. Drivers shall be able to update current passenger count (0 to vehicle capacity).

FR-D06 (Should): Offline Location Queue. The app shall queue location updates locally when offline and sync when connection is restored.

FR-D07 (Could): Trip History View. Drivers shall be able to view past trips with date, route, and duration.

FR-D08 (Must): Connection Status Indicator. The app shall display connection status (online/offline/syncing) during active trips.

FR-D09 (Must): Route Selection. Drivers shall select from predefined routes configured by administrators.

FR-D10 (Could): Daily Summary. Drivers shall see a daily summary of trips completed.

### 5.2 Commuter App Functional Requirements

FR-C01 (Must): Commuter Registration. Commuters shall be able to register with email or phone number.

FR-C02 (Should): Guest Mode. Commuters shall be able to use basic map features without registration.

FR-C03 (Must): Real-Time Map View. The app shall display a map showing all active jeepneys with their current positions.

FR-C04 (Must): Route Filtering. Commuters shall be able to filter the map by specific routes.

FR-C05 (Must): Jeepney Details. Tapping a jeepney marker shall show route name, plate number, passenger count status, and last update time.

FR-C06 (Must): ETA Display. The app shall calculate and display estimated arrival time at user-selected stops based on current vehicle position and stop geometry.

FR-C07 (Should): Favorite Stops. Commuters shall be able to save frequently used stops for quick access.

FR-C08 (Should): Approaching Notification. The app shall send push notifications when a jeepney is approaching a saved stop.

FR-C09 (Must): Route Information. The app shall display route details including terminals, key stops, and operating hours.

FR-C10 (Must): Fare Estimation. The app shall calculate estimated fare based on origin and destination stops using route fare configuration.

FR-C11 (Should): Seat Availability Indicator. The app shall show seat availability status (available/limited/full) based on driver input and vehicle capacity.

FR-C12 (Must): Search Stops. Commuters shall be able to search for stops by name.

### 5.3 Web Dashboard Functional Requirements

FR-W01 (Must): Admin Authentication. Administrators shall log in with email/password with role-based access control.

FR-W02 (Must): Live Fleet Map. The dashboard shall display real-time positions of all active jeepneys on a map.

FR-W03 (Must): Driver Management. Admins shall be able to add, edit, approve, suspend, and delete driver accounts.

FR-W04 (Must): Vehicle Management. Admins shall be able to register vehicles with plate number, capacity, and assign to drivers.

FR-W05 (Must): Route Configuration. Admins shall be able to create and edit routes with stops (coordinates), operating hours, and fare configuration.

FR-W06 (Must): Stop Management. Admins shall be able to add, edit, and delete stop locations with name and coordinates.

FR-W07 (Should): Trip Analytics. The dashboard shall display trip statistics such as daily trips, peak hours, and route utilization.

FR-W08 (Should): Driver Performance. The dashboard shall show driver activity metrics including trips completed and online hours.

FR-W09 (Should): Report Generation. Admins shall be able to export reports as CSV for trips and usage.

FR-W10 (Could): Announcement System. Admins shall be able to broadcast announcements to app users.

FR-W11 (Should): User Statistics. The dashboard shall display commuter statistics including registrations and active users.

## 6. Non-Functional Requirements

Non-functional requirements define quality targets and operational constraints.

### 6.1 Performance

NFR-P01: Location Propagation Latency. The median time from a driver location update being written to the backend to its appearance on the commuter map shall be five seconds or less under pilot load.

NFR-P02: App Launch Time. The mobile applications shall launch to a usable state within four seconds on mid-range devices.

NFR-P03: Map Render Time. The map with jeepney markers shall render within two seconds after relevant data becomes available.

### 6.2 Reliability and Availability

NFR-R01: Operating Hours Availability. The system shall maintain 99.5% uptime during operating hours (05:00–22:00).

NFR-R02: Offline Sync Behavior. Offline-queued location updates shall synchronize when connectivity is restored, prioritizing the latest current location and preserving trip boundaries, with documented limitations.

NFR-R03: Graceful Degradation. When offline, the commuter app shall still display cached routes and stops and clearly label tracking information as stale or unavailable.

NFR-R04: Crash Rate. The crash rate shall be below one percent of sessions during pilot testing.

### 6.3 Usability and Accessibility

NFR-U01: Learnability. New users shall be able to perform core tasks within five minutes without training.

NFR-U02: Driver Interface Safety. Driver flows shall minimize taps and avoid complex interactions while a trip is active.

NFR-U03: Language. The user interface shall support Filipino and English.

NFR-U04: Accessibility. The system targets WCAG 2.1 AA for basic accessibility considerations such as contrast and touch target size.

### 6.4 Security and Privacy

NFR-S01: Data Encryption. All data in transit shall use TLS 1.2+.

NFR-S02: Session Handling. User sessions shall expire after 30 days of inactivity.

NFR-S03: Data Privacy Compliance. The system shall comply with the Data Privacy Act of 2012 (RA 10173) within the scope of this academic project.

NFR-S04: Location Privacy Boundary. Commuter location shall not be tracked or stored; only driver trip location telemetry is stored.

NFR-S05: Role-Based Access. Admin functions shall be restricted by role, and driver write access shall be limited to driver-owned operational data.

### 6.5 Cost Controls

NFR-COST01: Location Write Frequency. The default tracking interval shall be constrained to 10–15 seconds to control read/write volume.

NFR-COST02: Data Retention. Breadcrumb location history retention should be limited to 30 days and trip history to one year, aligned with the database schema guidance.

NFR-COST03: Budget Guardrails. Firebase and Google Maps billing alerts shall be configured and reviewed weekly during the pilot.

### 6.6 Compatibility

NFR-C01: Android Version. The mobile applications shall support Android 8.0 (API 26) and above for MVP.

NFR-C02: Browser Support. The web dashboard shall support the latest two versions of Chrome, Edge, and Firefox.

## 7. Alignment With Existing Project Documents

This narrative specification is intended to remain consistent with the project’s UI screen flow, database schema, sprint plan, and risk assessment. Where the original project charter includes hardware-based tracking assumptions, this document treats those as deprecated in favor of phone-based GPS tracking to maintain a unified, software-only scope.