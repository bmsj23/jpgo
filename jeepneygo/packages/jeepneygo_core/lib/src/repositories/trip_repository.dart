import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/trip_model.dart';
import '../models/active_trip_model.dart';

/// Repository for trip operations
class TripRepository {
  final FirebaseFirestore _firestore;

  TripRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _tripsCollection =>
      _firestore.collection('trips');

  CollectionReference<Map<String, dynamic>> get _activeTripsCollection =>
      _firestore.collection('active_trips');

  // ============ DRIVER OPERATIONS ============

  /// Start a new trip
  Future<String> startTrip({
    required String driverId,
    required String vehicleId,
    required String routeId,
    required double latitude,
    required double longitude,
    required double heading,
  }) async {
    final tripRef = _tripsCollection.doc();
    final now = DateTime.now();

    // Create trip record
    final trip = Trip(
      id: tripRef.id,
      driverId: driverId,
      vehicleId: vehicleId,
      routeId: routeId,
      startedAt: now,
    );

    await tripRef.set(trip.toJson()..remove('id'));

    // Create active trip for real-time tracking
    final activeTrip = ActiveTrip(
      tripId: tripRef.id,
      driverId: driverId,
      vehicleId: vehicleId,
      routeId: routeId,
      latitude: latitude,
      longitude: longitude,
      heading: heading,
      startedAt: now,
      lastUpdatedAt: now,
    );

    await _activeTripsCollection.doc(tripRef.id).set(activeTrip.toJson());

    return tripRef.id;
  }

  /// Update driver location
  Future<void> updateLocation({
    required String tripId,
    required double latitude,
    required double longitude,
    required double heading,
    double? speed,
    String? nextStopId,
    int? etaMinutes,
  }) async {
    await _activeTripsCollection.doc(tripId).update({
      'latitude': latitude,
      'longitude': longitude,
      'heading': heading,
      'speed': speed,
      'nextStopId': nextStopId,
      'etaMinutes': etaMinutes,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    });

    // Optionally append to track points (could be expensive)
    // await _tripsCollection.doc(tripId).update({
    //   'trackPoints': FieldValue.arrayUnion([{'lat': latitude, 'lng': longitude}]),
    // });
  }

  /// Update passenger count
  Future<void> updatePassengerCount({
    required String tripId,
    required int currentPassengers,
  }) async {
    await _activeTripsCollection.doc(tripId).update({
      'currentPassengers': currentPassengers,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// End trip
  Future<void> endTrip(String tripId) async {
    // Remove from active trips
    await _activeTripsCollection.doc(tripId).delete();

    // Update trip record
    await _tripsCollection.doc(tripId).update({
      'status': 'completed',
      'endedAt': FieldValue.serverTimestamp(),
    });
  }

  // ============ COMMUTER OPERATIONS ============

  /// Stream active trips for a route (real-time map updates)
  Stream<List<ActiveTrip>> activeTripsForRouteStream(String routeId) {
    return _activeTripsCollection
        .where('routeId', isEqualTo: routeId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ActiveTrip.fromJson({...doc.data(), 'tripId': doc.id}))
            .toList());
  }

  /// Stream all active trips (for commuter map showing all routes)
  Stream<List<ActiveTrip>> allActiveTripsStream() {
    return _activeTripsCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => ActiveTrip.fromJson({...doc.data(), 'tripId': doc.id}))
        .toList());
  }

  /// Get single active trip
  Stream<ActiveTrip?> activeTripStream(String tripId) {
    return _activeTripsCollection.doc(tripId).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return ActiveTrip.fromJson({...doc.data()!, 'tripId': doc.id});
    });
  }

  // ============ HISTORY ============

  /// Get driver's trip history
  Stream<List<Trip>> driverTripHistoryStream(String driverId) {
    return _tripsCollection
        .where('driverId', isEqualTo: driverId)
        .orderBy('startedAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Trip.fromJson({...doc.data(), 'id': doc.id}))
            .toList());
  }
}

/// Provider for TripRepository
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository();
});
