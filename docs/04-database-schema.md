# JeepneyGo: Database Schema (Cloud Firestore)

## Document Information

| Attribute | Value |
|-----------|-------|
| Project | JeepneyGo: Real-Time Transport Monitoring System |
| Version | 1.0 |
| Date | January 2026 |
| Status | Draft for Proposal |

---

## 1. Entity Relationship Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     FIRESTORE COLLECTIONS SCHEMA                            │
└─────────────────────────────────────────────────────────────────────────────┘

    ┌───────────────┐         ┌───────────────┐         ┌───────────────┐
    │    users      │         │   vehicles    │         │    routes     │
    │───────────────│         │───────────────│         │───────────────│
    │ uid (doc ID)  │◄───────┐│ vehicleId     │    ┌───▶│ routeId       │
    │ email         │        ││ plateNumber   │    │    │ name          │
    │ phone         │        ││ capacity      │    │    │ color         │
    │ displayName   │        ││ driverId ─────┼────┘    │ fareBase      │
    │ role          │        ││ routeId ──────┼────┘    │ farePerKm     │
    │ photoUrl      │        ││ isActive      │         │ operatingStart│
    │ createdAt     │        │└───────────────┘         │ operatingEnd  │
    │ lastLoginAt   │        │                          │ createdAt     │
    └───────────────┘        │                          └───────┬───────┘
           │                 │                                  │
           │                 │                                  │
           ▼                 │                                  ▼
    ┌───────────────┐        │                          ┌───────────────┐
    │ users/{uid}/  │        │                          │ routes/{id}/  │
    │ favorites     │        │                          │ stops         │
    │(subcollection)│        │                          │(subcollection)│
    │───────────────│        │                          │───────────────│
    │ stopId        │        │                          │ stopId        │
    │ addedAt       │        │                          │ name          │
    └───────────────┘        │                          │ latitude      │
                             │                          │ longitude     │
                             │                          │ order         │
                             │                          └───────────────┘
                             │
                             │
    ┌───────────────────────────────────────────────────────────────────┐
    │                                                                   │
    ▼                                                                   ▼
┌───────────────────┐                                   ┌───────────────────┐
│   activeTrips     │ ◄──── REAL-TIME ────────────────▶ │    tripHistory    │
│ (live tracking)   │       (move on trip end)          │ (completed trips) │
│───────────────────│                                   │───────────────────│
│ tripId            │                                   │ tripId            │
│ vehicleId         │                                   │ vehicleId         │
│ driverId          │                                   │ driverId          │
│ routeId           │                                   │ routeId           │
│ currentLocation   │──┐                                │ startLocation     │
│   ├── latitude    │  │                                │ endLocation       │
│   ├── longitude   │  │                                │ startedAt         │
│   ├── heading     │  │                                │ endedAt           │
│   ├── speed       │  │                                │ totalDistance     │
│   └── timestamp   │  │                                │ passengerCount    │
│ passengerCount    │  │                                │   (average)       │
│ startedAt         │  │                                └───────────────────┘
│ status            │  │
└───────────────────┘  │
                       │
                       ▼
              ┌───────────────────┐
              │ activeTrips/{id}/ │
              │ locationHistory   │
              │ (subcollection)   │
              │───────────────────│
              │ latitude          │
              │ longitude         │
              │ heading           │
              │ speed             │
              │ accuracy          │
              │ timestamp         │
              └───────────────────┘
```

---

## 2. Detailed Collection Schemas

### 2.1 users Collection

```typescript
// Collection: users
// Document ID: Firebase Auth UID

interface User {
  uid: string;                    // Same as document ID
  email: string | null;
  phone: string;                  // Required for drivers
  displayName: string;
  role: 'commuter' | 'driver' | 'admin' | 'super_admin';
  photoUrl: string | null;
  isActive: boolean;              // Account status
  isApproved: boolean;            // For drivers: admin approval
  
  // Driver-specific fields
  licenseNumber?: string;
  address?: string;
  
  // Timestamps
  createdAt: Timestamp;
  updatedAt: Timestamp;
  lastLoginAt: Timestamp;
}

// Example Document
{
  "uid": "abc123xyz",
  "email": null,
  "phone": "+639171234567",
  "displayName": "Juan Dela Cruz",
  "role": "driver",
  "photoUrl": null,
  "isActive": true,
  "isApproved": true,
  "licenseNumber": "N01-12-345678",
  "address": "Lipa City, Batangas",
  "createdAt": "2026-01-15T08:00:00Z",
  "updatedAt": "2026-01-15T08:00:00Z",
  "lastLoginAt": "2026-01-15T08:30:00Z"
}
```

### 2.2 users/{uid}/favorites Subcollection

```typescript
// Subcollection: users/{uid}/favorites

interface FavoriteStop {
  stopId: string;
  routeId: string;
  stopName: string;               // Denormalized for quick access
  addedAt: Timestamp;
}

// Example Document
{
  "stopId": "stop_sm_lipa",
  "routeId": "route_sm_downtown",
  "stopName": "SM Lipa Terminal",
  "addedAt": "2026-01-15T09:00:00Z"
}
```

---

### 2.3 vehicles Collection

```typescript
// Collection: vehicles
// Document ID: Auto-generated

interface Vehicle {
  vehicleId: string;              // Same as document ID
  plateNumber: string;            // e.g., "ABC 1234"
  capacity: number;               // e.g., 20
  model: string;                  // e.g., "Owner Type Jeep"
  color: string;                  // e.g., "Yellow/Blue"
  
  // References
  driverId: string | null;        // Currently assigned driver (users doc ID)
  routeId: string | null;         // Assigned route
  
  // Status
  isActive: boolean;
  isApproved: boolean;
  
  // Metadata
  registeredAt: Timestamp;
  updatedAt: Timestamp;
}

// Example Document
{
  "vehicleId": "vehicle_001",
  "plateNumber": "ABC 1234",
  "capacity": 20,
  "model": "Owner Type Jeep",
  "color": "Yellow/Blue",
  "driverId": "abc123xyz",
  "routeId": "route_sm_downtown",
  "isActive": true,
  "isApproved": true,
  "registeredAt": "2026-01-10T08:00:00Z",
  "updatedAt": "2026-01-15T08:00:00Z"
}
```

---

### 2.4 routes Collection

```typescript
// Collection: routes
// Document ID: Auto-generated

interface Route {
  routeId: string;                // Same as document ID
  name: string;                   // e.g., "SM Lipa - Downtown"
  shortName: string;              // e.g., "SM-DT"
  description: string;
  color: string;                  // Hex color for map display, e.g., "#FF5733"
  
  // Fare configuration
  fareBase: number;               // Base fare in PHP, e.g., 13
  farePerKm: number;              // Additional per km, e.g., 1.80
  
  // Operating hours
  operatingStart: string;         // "05:00"
  operatingEnd: string;           // "22:00"
  
  // Route line for map (optional, for drawing the route)
  polyline: string | null;        // Encoded polyline string
  
  // Status
  isActive: boolean;
  
  // Timestamps
  createdAt: Timestamp;
  updatedAt: Timestamp;
}

// Example Document
{
  "routeId": "route_sm_downtown",
  "name": "SM Lipa - Downtown",
  "shortName": "SM-DT",
  "description": "Main route connecting SM Lipa to Downtown Lipa",
  "color": "#FF5733",
  "fareBase": 13,
  "farePerKm": 1.80,
  "operatingStart": "05:00",
  "operatingEnd": "22:00",
  "polyline": null,
  "isActive": true,
  "createdAt": "2026-01-01T00:00:00Z",
  "updatedAt": "2026-01-01T00:00:00Z"
}
```

### 2.5 routes/{routeId}/stops Subcollection

```typescript
// Subcollection: routes/{routeId}/stops

interface Stop {
  stopId: string;                 // Document ID
  name: string;                   // e.g., "SM Lipa Terminal"
  latitude: number;
  longitude: number;
  order: number;                  // Sequence in route (1, 2, 3...)
  isTerminal: boolean;            // Is this a start/end terminal?
  landmark: string | null;        // Nearby landmark description
}

// Example Document
{
  "stopId": "stop_sm_lipa",
  "name": "SM Lipa Terminal",
  "latitude": 13.9411,
  "longitude": 121.1644,
  "order": 1,
  "isTerminal": true,
  "landmark": "In front of SM Lipa main entrance"
}
```

---

### 2.6 activeTrips Collection (REAL-TIME)

```typescript
// Collection: activeTrips
// Document ID: Auto-generated
// PURPOSE: Live tracking data - queried frequently by commuters

interface ActiveTrip {
  tripId: string;                 // Same as document ID
  
  // References
  vehicleId: string;
  driverId: string;
  routeId: string;
  
  // Denormalized for quick reads (avoids joins)
  driverName: string;
  plateNumber: string;
  routeName: string;
  routeColor: string;
  vehicleCapacity: number;
  
  // Current state
  currentLocation: {
    latitude: number;
    longitude: number;
    heading: number;              // Direction in degrees (0-360)
    speed: number;                // km/h
    accuracy: number;             // GPS accuracy in meters
    timestamp: Timestamp;
  };
  
  passengerCount: number;
  status: 'active' | 'paused';    // Paused = temporary stop
  
  // Trip metadata
  startedAt: Timestamp;
  startLocation: {
    latitude: number;
    longitude: number;
  };
}

// Example Document
{
  "tripId": "trip_20260115_001",
  "vehicleId": "vehicle_001",
  "driverId": "abc123xyz",
  "routeId": "route_sm_downtown",
  "driverName": "Juan Dela Cruz",
  "plateNumber": "ABC 1234",
  "routeName": "SM Lipa - Downtown",
  "routeColor": "#FF5733",
  "vehicleCapacity": 20,
  "currentLocation": {
    "latitude": 13.9415,
    "longitude": 121.1650,
    "heading": 45,
    "speed": 25.5,
    "accuracy": 10,
    "timestamp": "2026-01-15T08:45:00Z"
  },
  "passengerCount": 12,
  "status": "active",
  "startedAt": "2026-01-15T08:30:00Z",
  "startLocation": {
    "latitude": 13.9411,
    "longitude": 121.1644
  }
}
```

### 2.7 activeTrips/{tripId}/locationHistory Subcollection

```typescript
// Subcollection: activeTrips/{tripId}/locationHistory
// PURPOSE: Store location breadcrumbs for route analysis

interface LocationPoint {
  latitude: number;
  longitude: number;
  heading: number;
  speed: number;
  accuracy: number;
  timestamp: Timestamp;
}

// Example Document
{
  "latitude": 13.9415,
  "longitude": 121.1650,
  "heading": 45,
  "speed": 25.5,
  "accuracy": 10,
  "timestamp": "2026-01-15T08:45:00Z"
}
```

---

### 2.8 tripHistory Collection

```typescript
// Collection: tripHistory
// Document ID: Same as original tripId from activeTrips
// PURPOSE: Historical data for analytics

interface TripHistory {
  tripId: string;
  
  // References
  vehicleId: string;
  driverId: string;
  routeId: string;
  
  // Denormalized
  driverName: string;
  plateNumber: string;
  routeName: string;
  
  // Trip data
  startedAt: Timestamp;
  endedAt: Timestamp;
  durationMinutes: number;
  totalDistanceKm: number;
  averagePassengerCount: number;
  
  startLocation: {
    latitude: number;
    longitude: number;
  };
  endLocation: {
    latitude: number;
    longitude: number;
  };
  
  // Status
  completionStatus: 'completed' | 'cancelled' | 'system_ended';
}

// Example Document
{
  "tripId": "trip_20260115_001",
  "vehicleId": "vehicle_001",
  "driverId": "abc123xyz",
  "routeId": "route_sm_downtown",
  "driverName": "Juan Dela Cruz",
  "plateNumber": "ABC 1234",
  "routeName": "SM Lipa - Downtown",
  "startedAt": "2026-01-15T08:30:00Z",
  "endedAt": "2026-01-15T09:45:00Z",
  "durationMinutes": 75,
  "totalDistanceKm": 12.5,
  "averagePassengerCount": 15,
  "startLocation": {
    "latitude": 13.9411,
    "longitude": 121.1644
  },
  "endLocation": {
    "latitude": 13.9520,
    "longitude": 121.1580
  },
  "completionStatus": "completed"
}
```

---

### 2.9 announcements Collection (Optional)

```typescript
// Collection: announcements

interface Announcement {
  announcementId: string;
  title: string;
  message: string;
  targetAudience: 'all' | 'drivers' | 'commuters';
  isActive: boolean;
  priority: 'low' | 'medium' | 'high';
  createdAt: Timestamp;
  expiresAt: Timestamp | null;
  createdBy: string;              // Admin user ID
}

// Example Document
{
  "announcementId": "ann_001",
  "title": "Route Update",
  "message": "SM-Downtown route will have a detour due to road construction",
  "targetAudience": "all",
  "isActive": true,
  "priority": "high",
  "createdAt": "2026-01-15T06:00:00Z",
  "expiresAt": "2026-01-20T23:59:59Z",
  "createdBy": "admin_user_001"
}
```

---

## 3. Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // ============================================
    // HELPER FUNCTIONS
    // ============================================
    
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }
    
    function getUserRole() {
      return get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role;
    }
    
    function isDriver() {
      return isAuthenticated() && getUserRole() == 'driver';
    }
    
    function isAdmin() {
      return isAuthenticated() && getUserRole() in ['admin', 'super_admin'];
    }
    
    function isSuperAdmin() {
      return isAuthenticated() && getUserRole() == 'super_admin';
    }
    
    // ============================================
    // USERS COLLECTION
    // ============================================
    
    match /users/{userId} {
      // Anyone authenticated can read user profiles
      allow read: if isAuthenticated();
      
      // Users can create their own profile
      allow create: if isOwner(userId);
      
      // Users can update their own profile, admins can update any
      allow update: if isOwner(userId) || isAdmin();
      
      // Only super admins can delete users
      allow delete: if isSuperAdmin();
      
      // Favorites subcollection
      match /favorites/{favoriteId} {
        allow read, write: if isOwner(userId);
      }
    }
    
    // ============================================
    // VEHICLES COLLECTION
    // ============================================
    
    match /vehicles/{vehicleId} {
      // Public read for all vehicles
      allow read: if true;
      
      // Only admins can manage vehicles
      allow create, update, delete: if isAdmin();
    }
    
    // ============================================
    // ROUTES COLLECTION
    // ============================================
    
    match /routes/{routeId} {
      // Public read for routes
      allow read: if true;
      
      // Only admins can manage routes
      allow create, update, delete: if isAdmin();
      
      // Stops subcollection
      match /stops/{stopId} {
        allow read: if true;
        allow create, update, delete: if isAdmin();
      }
    }
    
    // ============================================
    // ACTIVE TRIPS COLLECTION
    // ============================================
    
    match /activeTrips/{tripId} {
      // Public read - commuters need to see all active trips
      allow read: if true;
      
      // Only drivers can create trips
      allow create: if isDriver();
      
      // Only the trip's driver can update their trip
      allow update: if isDriver() && resource.data.driverId == request.auth.uid;
      
      // Driver can delete (end) their own trip
      allow delete: if isDriver() && resource.data.driverId == request.auth.uid;
      
      // Location history subcollection
      match /locationHistory/{locationId} {
        allow read: if isAdmin();
        allow create: if isDriver();
        allow update, delete: if false; // Immutable
      }
    }
    
    // ============================================
    // TRIP HISTORY COLLECTION
    // ============================================
    
    match /tripHistory/{tripId} {
      // Drivers can read their own history, admins can read all
      allow read: if isAdmin() || 
        (isDriver() && resource.data.driverId == request.auth.uid);
      
      // Created by Cloud Function when trip ends
      allow create: if isDriver();
      
      // Only admins can modify historical data
      allow update, delete: if isAdmin();
    }
    
    // ============================================
    // ANNOUNCEMENTS COLLECTION
    // ============================================
    
    match /announcements/{announcementId} {
      // Public read for active announcements
      allow read: if true;
      
      // Only admins can manage announcements
      allow create, update, delete: if isAdmin();
    }
  }
}
```

---

## 4. Firestore Indexes

```json
{
  "indexes": [
    {
      "collectionGroup": "activeTrips",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "routeId", "order": "ASCENDING" },
        { "fieldPath": "status", "order": "ASCENDING" }
      ]
    },
    {
      "collectionGroup": "activeTrips",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "status", "order": "ASCENDING" },
        { "fieldPath": "currentLocation.timestamp", "order": "DESCENDING" }
      ]
    },
    {
      "collectionGroup": "tripHistory",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "driverId", "order": "ASCENDING" },
        { "fieldPath": "startedAt", "order": "DESCENDING" }
      ]
    },
    {
      "collectionGroup": "tripHistory",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "routeId", "order": "ASCENDING" },
        { "fieldPath": "startedAt", "order": "DESCENDING" }
      ]
    },
    {
      "collectionGroup": "tripHistory",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "startedAt", "order": "DESCENDING" }
      ]
    },
    {
      "collectionGroup": "users",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "role", "order": "ASCENDING" },
        { "fieldPath": "isActive", "order": "ASCENDING" }
      ]
    },
    {
      "collectionGroup": "vehicles",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "routeId", "order": "ASCENDING" },
        { "fieldPath": "isActive", "order": "ASCENDING" }
      ]
    }
  ],
  "fieldOverrides": []
}
```

---

## 5. Data Flow Diagrams

### 5.1 Driver Location Update Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Driver    │    │  Location   │    │  Firestore  │    │  Commuter   │
│    App      │    │  Service    │    │   Cloud     │    │    App      │
└──────┬──────┘    └──────┬──────┘    └──────┬──────┘    └──────┬──────┘
       │                  │                  │                  │
       │ Start Trip       │                  │                  │
       │─────────────────▶│                  │                  │
       │                  │                  │                  │
       │                  │ Create activeTrip│                  │
       │                  │─────────────────▶│                  │
       │                  │                  │                  │
       │                  │                  │ Real-time        │
       │                  │                  │ Listener         │
       │                  │                  │◄─────────────────│
       │                  │                  │                  │
       │ GPS Update       │                  │                  │
       │ (every 10 sec)   │                  │                  │
       │─────────────────▶│                  │                  │
       │                  │                  │                  │
       │                  │ Update location  │                  │
       │                  │─────────────────▶│                  │
       │                  │                  │                  │
       │                  │                  │ Push update      │
       │                  │                  │─────────────────▶│
       │                  │                  │                  │
       │                  │                  │                  │ Map updates
       │                  │                  │                  │
```

### 5.2 Trip End Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Driver    │    │  Firestore  │    │   Cloud     │
│    App      │    │   Cloud     │    │  Function   │
└──────┬──────┘    └──────┬──────┘    └──────┬──────┘
       │                  │                  │
       │ End Trip         │                  │
       │─────────────────▶│                  │
       │                  │                  │
       │                  │ onDelete trigger │
       │                  │─────────────────▶│
       │                  │                  │
       │                  │                  │ Calculate stats
       │                  │                  │ (duration, distance)
       │                  │                  │
       │                  │ Create tripHistory
       │                  │◄─────────────────│
       │                  │                  │
       │ Trip Summary     │                  │
       │◄─────────────────│                  │
       │                  │                  │
```

---

## 6. Data Retention Policy

| Collection | Retention Period | Cleanup Method |
|------------|------------------|----------------|
| `users` | Indefinite | Manual deletion |
| `vehicles` | Indefinite | Manual deletion |
| `routes` | Indefinite | Manual deletion |
| `activeTrips` | Until trip ends | Moved to tripHistory |
| `tripHistory` | 1 year | Scheduled Cloud Function |
| `locationHistory` | 30 days | Scheduled Cloud Function |
| `announcements` | Until expiry | Scheduled Cloud Function |

---

## 7. Backup Strategy

| Backup Type | Frequency | Retention |
|-------------|-----------|-----------|
| Automatic Firestore backup | Daily | 7 days |
| Manual export | Weekly | 30 days |
| Pre-deployment snapshot | Before each release | 90 days |
