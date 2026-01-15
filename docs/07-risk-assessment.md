# JeepneyGo: Risk Assessment Document

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Risk Assessment Overview

This document identifies technical, operational, and project risks associated with pivoting from IoT hardware to a mobile-sensor-based tracking system for JeepneyGo.

### 1.1 Risk Severity Matrix

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         RISK SEVERITY MATRIX                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   IMPACT     │  Low Probability  │  Med Probability  │  High Probability  │
│  ────────────┼───────────────────┼───────────────────┼───────────────────  │
│   High       │   MEDIUM          │   HIGH            │   CRITICAL         │
│   Medium     │   LOW             │   MEDIUM          │   HIGH             │
│   Low        │   LOW             │   LOW             │   MEDIUM           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 1.2 Risk Categories

| Category | Description |
|----------|-------------|
| **Technical** | Risks related to technology, implementation, and infrastructure |
| **Operational** | Risks related to users, processes, and daily operations |
| **Project** | Risks related to timeline, resources, and scope |
| **External** | Risks from third-party dependencies and external factors |

---

## 2. Technical Risks

### RISK T1: Battery Drain on Driver Devices

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T1 |
| **Category** | Technical |
| **Description** | Continuous GPS tracking may drain driver phone batteries, causing them to disable tracking or run out of power mid-trip |
| **Probability** | High |
| **Impact** | High |
| **Severity** | CRITICAL |

**Mitigation Strategies:**
1. Use fused location provider (battery-optimized GPS)
2. Reduce update frequency to 10-15 seconds instead of continuous
3. Implement adaptive tracking (lower frequency when vehicle is stationary)
4. Require drivers to keep phones plugged into vehicle power
5. Add battery level warning indicator in the app
6. Implement power-saving mode when battery is low

**Contingency Plan:**
- Provide portable power banks to pilot drivers
- Partner with operators to install USB charging ports in vehicles

**Owner:** Lead Developer

**Status:** Open

---

### RISK T2: GPS Accuracy in Urban Areas

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T2 |
| **Category** | Technical |
| **Description** | Tall buildings and signal interference in Lipa City may cause inaccurate GPS readings, displaying jeepneys in wrong locations |
| **Probability** | Medium |
| **Impact** | High |
| **Severity** | HIGH |

**Mitigation Strategies:**
1. Filter out low-accuracy readings (discard if accuracy > 50 meters)
2. Apply location smoothing algorithm (average last 3-5 points)
3. Show accuracy radius on commuter map
4. Display "last updated X minutes ago" timestamp
5. Consider using Google Roads API to snap positions to roads
6. Use multiple location sources (GPS + network + cell tower)

**Contingency Plan:**
- Display disclaimer about GPS accuracy limitations to commuters
- Allow drivers to manually report location issues

**Owner:** Developer 1

**Status:** Open

---

### RISK T3: Background Location Restrictions

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T3 |
| **Category** | Technical |
| **Description** | Android and iOS increasingly restrict background location access; apps may be killed or throttled when in background |
| **Probability** | High |
| **Impact** | High |
| **Severity** | CRITICAL |

**Mitigation Strategies:**
1. Request "Allow all the time" location permission with clear explanation
2. Use foreground service with persistent notification (Android)
3. Educate drivers to disable battery optimization for the app
4. Show clear in-app guide for permission setup with screenshots
5. Detect when permissions are revoked and alert the driver
6. Implement fallback to lower-frequency tracking if restricted

**Contingency Plan:**
- Create fallback system for manual check-in at major stops
- Partner with Android device manufacturers for whitelisting

**Owner:** Lead Developer

**Status:** Open

---

### RISK T4: Connectivity Dead Zones

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T4 |
| **Category** | Technical |
| **Description** | Some areas in Lipa City may have poor mobile network coverage, causing location updates to fail or be significantly delayed |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Implement offline location queue (store locally, sync when online)
2. Use Firestore offline persistence for seamless sync
3. Show "syncing" indicator to driver when reconnecting
4. Display "last updated X minutes ago" to commuters
5. Cache route and stop data for offline access
6. Batch location updates to reduce data usage

**Contingency Plan:**
- Map known dead zones and inform commuters
- Consider SMS-based fallback for critical updates

**Owner:** Developer 1

**Status:** Open

---

### RISK T5: Firebase Cost Overruns

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T5 |
| **Category** | Technical |
| **Description** | Real-time location updates may generate excessive Firestore reads/writes, exceeding free tier and increasing costs beyond budget |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Batch location updates (write every 10-15 seconds, not every second)
2. Use efficient query patterns (limit results, use where clauses)
3. Monitor usage in Firebase console weekly
4. Set billing alerts at PHP 500, 1000, and 2000 thresholds
5. Use Cloud Functions to aggregate and cleanup old data
6. Limit real-time listeners to visible routes only

**Contingency Plan:**
- Reduce update frequency if costs exceed budget
- Limit pilot fleet size to control costs
- Consider alternative backends if costs become prohibitive

**Owner:** Project Manager

**Status:** Open

---

### RISK T6: Real-Time Performance at Scale

| Attribute | Value |
|-----------|-------|
| **Risk ID** | T6 |
| **Category** | Technical |
| **Description** | With many active jeepneys and commuters, map rendering and real-time updates may become slow or unresponsive |
| **Probability** | Low (during pilot) |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Implement marker clustering for map (group nearby markers)
2. Limit real-time listeners to visible map area or selected routes
3. Use pagination for lists and data tables
4. Optimize widget rebuilds using const constructors
5. Profile app performance during development
6. Implement lazy loading for off-screen content

**Contingency Plan:**
- Scale Firebase as needed (acceptable for pilot phase)
- Implement server-side filtering if client-side becomes slow

**Owner:** Lead Developer

**Status:** Open

---

## 3. Operational Risks

### RISK O1: Driver Non-Compliance

| Attribute | Value |
|-----------|-------|
| **Risk ID** | O1 |
| **Category** | Operational |
| **Description** | Drivers may forget to start the app, disable tracking, or intentionally not use the system, resulting in incomplete data |
| **Probability** | High |
| **Impact** | High |
| **Severity** | CRITICAL |

**Mitigation Strategies:**
1. Make app usage mandatory via operator agreement
2. Send reminder notifications at operating hours start (5 AM)
3. Implement gamification (daily/weekly leaderboards with incentives)
4. Tie app usage to monetary incentives (bonus per trip logged)
5. Show driver activity reports to operators for accountability
6. Make the app extremely simple to use (one-tap start)

**Contingency Plan:**
- Identify and work with most compliant drivers first for pilot
- Consider integrating with existing dispatch systems

**Owner:** Project Manager + Operator Partner

**Status:** Open

---

### RISK O2: Driver Digital Literacy

| Attribute | Value |
|-----------|-------|
| **Risk ID** | O2 |
| **Category** | Operational |
| **Description** | Some drivers may not be familiar with smartphones and struggle to use the app correctly, leading to errors or abandonment |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Design extremely simple driver UI (large buttons, minimal screens)
2. Conduct hands-on training sessions before pilot launch
3. Create video tutorials in Filipino
4. Pair tech-savvy drivers with those needing assistance
5. Provide printed quick-reference cards for common tasks
6. Use visual icons instead of text where possible

**Contingency Plan:**
- Offer phone support hotline during pilot phase
- Assign "driver champions" to help others

**Owner:** Project Manager

**Status:** Open

---

### RISK O3: Driver Smartphone Availability

| Attribute | Value |
|-----------|-------|
| **Risk ID** | O3 |
| **Category** | Operational |
| **Description** | Not all drivers may own smartphones capable of running the app (requires GPS, Android 8+, sufficient RAM) |
| **Probability** | Low-Medium |
| **Impact** | High |
| **Severity** | HIGH |

**Mitigation Strategies:**
1. Define and communicate minimum device requirements early
2. Survey drivers during onboarding to assess device compatibility
3. Consider subsidized device program from budget savings (no hardware cost)
4. Partner with operators to provide devices for their drivers
5. Test app on low-end devices during development
6. Optimize app for minimal resource usage

**Contingency Plan:**
- Start pilot with drivers who have compatible devices
- Explore device rental or lease programs

**Owner:** Project Manager + Operator Partner

**Status:** Open

---

### RISK O4: Commuter Adoption

| Attribute | Value |
|-----------|-------|
| **Risk ID** | O4 |
| **Category** | Operational |
| **Description** | Commuters may not download or regularly use the app if they don't see enough active jeepneys or find the app unreliable |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Ensure sufficient driver coverage before promoting to commuters
2. Launch marketing campaign in pilot areas
3. Partner with local government for promotion
4. Offer value-added features (fare calculator, route info)
5. Collect and act on user feedback quickly
6. Ensure app store listing is professional and informative

**Contingency Plan:**
- Focus on high-traffic routes first
- Consider web version for users without app

**Owner:** Project Manager

**Status:** Open

---

## 4. Project Risks

### RISK P1: Team Inexperience with Mobile Development

| Attribute | Value |
|-----------|-------|
| **Risk ID** | P1 |
| **Category** | Project |
| **Description** | Team has no prior mobile development experience, which may lead to delays, technical debt, and quality issues |
| **Probability** | High |
| **Impact** | Medium |
| **Severity** | HIGH |

**Mitigation Strategies:**
1. Dedicate Weeks 1-2 to structured learning (tutorials, codelabs)
2. Start with simpler features to build confidence
3. Use well-documented packages with community support
4. Build throwaway prototypes before main development
5. Seek mentorship or code reviews from external Flutter developers
6. Follow established patterns and architecture from tutorials

**Contingency Plan:**
- Reduce scope to MVP if significantly behind schedule
- Consider bringing in external consultant for critical features

**Owner:** Lead Developer

**Status:** Open

---

### RISK P2: Scope Creep

| Attribute | Value |
|-----------|-------|
| **Risk ID** | P2 |
| **Category** | Project |
| **Description** | Stakeholders or team may request additional features, expanding scope beyond what the timeline allows |
| **Probability** | Medium |
| **Impact** | High |
| **Severity** | HIGH |

**Mitigation Strategies:**
1. Clearly document and freeze scope after planning phase
2. Use MoSCoW prioritization (Must/Should/Could/Won't)
3. Create a "future features" parking lot for post-pilot ideas
4. Require formal change request process for new features
5. Review scope at each sprint boundary
6. Communicate timeline impact of any additions

**Contingency Plan:**
- Defer "Could" and "Won't" features to post-pilot phase
- Negotiate timeline extension if scope must increase

**Owner:** Project Manager

**Status:** Open

---

### RISK P3: Timeline Pressure (16 Weeks)

| Attribute | Value |
|-----------|-------|
| **Risk ID** | P3 |
| **Category** | Project |
| **Description** | 16-week timeline with full feature set is aggressive for a beginner team, risking incomplete delivery or poor quality |
| **Probability** | High |
| **Impact** | Medium |
| **Severity** | HIGH |

**Mitigation Strategies:**
1. Prioritize must-have features ruthlessly
2. Use parallel workstreams where possible (different team members on different features)
3. Time-box feature development (move on if stuck after allocated time)
4. Conduct weekly progress reviews against plan
5. Build buffer into estimates (add 20% to task estimates)
6. Identify shortcuts that don't compromise core functionality

**Contingency Plan:**
1. Request timeline extension to 18-20 weeks
2. Deploy MVP at Week 16 and continue development post-launch
3. Reduce scope to core features only

**Owner:** Project Manager

**Status:** Open

---

### RISK P4: Team Availability

| Attribute | Value |
|-----------|-------|
| **Risk ID** | P4 |
| **Category** | Project |
| **Description** | Team members may have competing academic or personal commitments that reduce their availability |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Establish clear time commitment expectations upfront
2. Create shared calendar with blocked development time
3. Cross-train team members on multiple areas
4. Document code and decisions thoroughly
5. Use async communication for flexibility
6. Plan around known academic deadlines

**Contingency Plan:**
- Reassign tasks if team member becomes unavailable
- Reduce scope proportionally to available capacity

**Owner:** Project Manager

**Status:** Open

---

## 5. External Risks

### RISK E1: Third-Party API Changes

| Attribute | Value |
|-----------|-------|
| **Risk ID** | E1 |
| **Category** | External |
| **Description** | Google Maps, Firebase, or other services may change pricing, terms, or APIs, breaking functionality or increasing costs |
| **Probability** | Low |
| **Impact** | High |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Use stable API versions (not beta or preview)
2. Abstract third-party integrations behind interfaces for easier swapping
3. Monitor service status pages and announcements
4. Have backup options identified (e.g., MapBox, Supabase)
5. Document all external dependencies
6. Subscribe to developer newsletters for services used

**Contingency Plan:**
- Migrate to alternative service if needed
- Negotiate with service provider if pricing becomes issue

**Owner:** Lead Developer

**Status:** Open

---

### RISK E2: Google Maps API Billing

| Attribute | Value |
|-----------|-------|
| **Risk ID** | E2 |
| **Category** | External |
| **Description** | Google Maps API has usage-based pricing; heavy usage may exceed budget, especially with many commuters viewing maps |
| **Probability** | Medium |
| **Impact** | Medium |
| **Severity** | MEDIUM |

**Mitigation Strategies:**
1. Utilize $200/month free credit efficiently
2. Cache static map tiles where possible
3. Limit unnecessary map reloads
4. Set billing caps in Google Cloud Console
5. Monitor usage daily during pilot
6. Use simple markers instead of complex overlays

**Contingency Plan:**
- Switch to OpenStreetMap for basic features if costs exceed budget
- Implement map view limits per user

**Owner:** Project Manager

**Status:** Open

---

### RISK E3: App Store Rejection

| Attribute | Value |
|-----------|-------|
| **Risk ID** | E3 |
| **Category** | External |
| **Description** | Google Play Store may reject the app due to policy violations, especially regarding background location usage |
| **Probability** | Low |
| **Impact** | Medium |
| **Severity** | LOW |

**Mitigation Strategies:**
1. Review Google Play policies before development
2. Clearly explain location usage in app and store listing
3. Request only necessary permissions
4. Show prominent disclosure for background location
5. Test submission process with internal track first
6. Prepare for potential appeal or resubmission

**Contingency Plan:**
- Distribute APK directly to drivers (sideloading)
- Use alternative distribution for commuter app

**Owner:** Lead Developer

**Status:** Open

---

## 6. Risk Summary Matrix

| Risk ID | Risk Name | Category | Probability | Impact | Severity | Status |
|---------|-----------|----------|-------------|--------|----------|--------|
| T1 | Battery Drain | Technical | High | High | CRITICAL | Open |
| T2 | GPS Accuracy | Technical | Medium | High | HIGH | Open |
| T3 | Background Location Restrictions | Technical | High | High | CRITICAL | Open |
| T4 | Connectivity Dead Zones | Technical | Medium | Medium | MEDIUM | Open |
| T5 | Firebase Cost Overruns | Technical | Medium | Medium | MEDIUM | Open |
| T6 | Real-Time Performance | Technical | Low | Medium | MEDIUM | Open |
| O1 | Driver Non-Compliance | Operational | High | High | CRITICAL | Open |
| O2 | Driver Digital Literacy | Operational | Medium | Medium | MEDIUM | Open |
| O3 | Driver Smartphone Availability | Operational | Low-Med | High | HIGH | Open |
| O4 | Commuter Adoption | Operational | Medium | Medium | MEDIUM | Open |
| P1 | Team Inexperience | Project | High | Medium | HIGH | Open |
| P2 | Scope Creep | Project | Medium | High | HIGH | Open |
| P3 | Timeline Pressure | Project | High | Medium | HIGH | Open |
| P4 | Team Availability | Project | Medium | Medium | MEDIUM | Open |
| E1 | Third-Party API Changes | External | Low | High | MEDIUM | Open |
| E2 | Google Maps API Billing | External | Medium | Medium | MEDIUM | Open |
| E3 | App Store Rejection | External | Low | Medium | LOW | Open |

---

## 7. Top 5 Risks to Watch

These are the most critical risks that require immediate attention and ongoing monitoring:

| Priority | Risk ID | Risk Name | Immediate Action | Owner |
|----------|---------|-----------|------------------|-------|
| 1 | T3 | Background Location Restrictions | Research and prototype foreground service in Sprint 2 | Lead Developer |
| 2 | O1 | Driver Non-Compliance | Design incentive program before pilot; ensure simple UX | Project Manager |
| 3 | T1 | Battery Drain | Implement battery-optimized location strategy from start | Developer 1 |
| 4 | P1 | Team Inexperience | Complete structured learning in Weeks 1-2; pair programming | Lead Developer |
| 5 | P3 | Timeline Pressure | Establish strict scope freeze; conduct weekly reviews | Project Manager |

---

## 8. Risk Monitoring Plan

### 8.1 Review Schedule

| Review Type | Frequency | Participants | Focus |
|-------------|-----------|--------------|-------|
| Risk Check-in | Weekly | Project Manager | Update status, new risks |
| Sprint Risk Review | Bi-weekly | Full Team | Review sprint-relevant risks |
| Stakeholder Risk Report | Monthly | PM + Stakeholders | High-level status |

### 8.2 Risk Indicators to Monitor

| Indicator | Warning Threshold | Critical Threshold |
|-----------|-------------------|-------------------|
| Sprint velocity | < 80% planned tasks | < 60% planned tasks |
| Bug count | > 10 open bugs | > 25 open bugs |
| Firebase daily cost | > PHP 50/day | > PHP 100/day |
| Driver app crash rate | > 2% sessions | > 5% sessions |
| Location update success rate | < 95% | < 85% |

### 8.3 Escalation Path

1. **Developer** identifies issue → Reports to Lead Developer
2. **Lead Developer** assesses impact → If HIGH/CRITICAL, escalates to Project Manager
3. **Project Manager** evaluates options → If unresolvable, escalates to Stakeholders
4. **Stakeholders** make final decisions on scope/timeline changes

---

## 9. Risk Response Strategies

| Strategy | Description | When to Use |
|----------|-------------|-------------|
| **Avoid** | Change plans to eliminate the risk | When risk is unacceptable and avoidable |
| **Mitigate** | Reduce probability or impact | Most common approach |
| **Transfer** | Shift risk to third party | Insurance, outsourcing |
| **Accept** | Acknowledge and prepare contingency | When cost of mitigation exceeds impact |

---

## 10. Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | January 2026 | Project Team | Initial risk assessment |
