import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/route_model.dart';
import '../models/stop_model.dart';

/// Repository for route and stop operations
class RouteRepository {
  final FirebaseFirestore _firestore;

  RouteRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _routesCollection =>
      _firestore.collection('routes');

  CollectionReference<Map<String, dynamic>> get _stopsCollection =>
      _firestore.collection('stops');

  /// Get all active routes
  Stream<List<JeepneyRoute>> activeRoutesStream() {
    return _routesCollection
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => JeepneyRoute.fromJson({...doc.data(), 'id': doc.id}))
            .toList());
  }

  /// Get route by ID
  Future<JeepneyRoute?> getRoute(String routeId) async {
    final doc = await _routesCollection.doc(routeId).get();
    if (!doc.exists || doc.data() == null) return null;
    return JeepneyRoute.fromJson({...doc.data()!, 'id': doc.id});
  }

  /// Get stops for a route
  Stream<List<Stop>> stopsForRouteStream(String routeId) {
    return _stopsCollection
        .where('routeId', isEqualTo: routeId)
        .where('isActive', isEqualTo: true)
        .orderBy('sequence')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Stop.fromJson({...doc.data(), 'id': doc.id}))
            .toList());
  }

  /// Get single stop
  Future<Stop?> getStop(String stopId) async {
    final doc = await _stopsCollection.doc(stopId).get();
    if (!doc.exists || doc.data() == null) return null;
    return Stop.fromJson({...doc.data()!, 'id': doc.id});
  }
}

/// Provider for RouteRepository
final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  return RouteRepository();
});
