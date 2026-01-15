/// Firestore collection and document paths
class FirestorePaths {
  FirestorePaths._();

  // ============ COLLECTIONS ============
  static const String users = 'users';
  static const String routes = 'routes';
  static const String stops = 'stops';
  static const String vehicles = 'vehicles';
  static const String trips = 'trips';
  static const String activeTrips = 'active_trips';

  // ============ DOCUMENT PATHS ============
  static String user(String uid) => '$users/$uid';
  static String route(String routeId) => '$routes/$routeId';
  static String stop(String stopId) => '$stops/$stopId';
  static String vehicle(String vehicleId) => '$vehicles/$vehicleId';
  static String trip(String tripId) => '$trips/$tripId';
  static String activeTrip(String tripId) => '$activeTrips/$tripId';
}
