/// App-wide constants for JeepneyGo
class AppConstants {
  AppConstants._();

  // ============ APP INFO ============
  static const String appName = 'JeepneyGo';
  static const String appVersion = '1.0.0';

  // ============ LOCATION ============
  /// Location update interval in seconds (for driver app)
  static const int locationUpdateIntervalSeconds = 10;

  /// Minimum distance in meters to trigger location update
  static const int locationDistanceFilterMeters = 10;

  // ============ MAP ============
  /// Default map center (Lipa City, Batangas)
  static const double defaultLatitude = 13.9411;
  static const double defaultLongitude = 121.1632;

  /// Default map zoom level
  static const double defaultZoomLevel = 14.0;

  /// Zoom level when viewing a specific route
  static const double routeZoomLevel = 13.0;

  /// Zoom level when tracking a specific jeepney
  static const double trackingZoomLevel = 16.0;

  // ============ JEEPNEY ============
  /// Default jeepney capacity
  static const int defaultJeepneyCapacity = 20;

  // ============ FARE ============
  /// Base fare in PHP
  static const double baseFare = 13.0;

  /// Fare per kilometer in PHP
  static const double farePerKm = 1.80;

  // ============ TIMEOUTS ============
  /// OTP timeout in seconds
  static const int otpTimeoutSeconds = 60;

  /// Consider jeepney stale if no update for this many seconds
  static const int staleLocationThresholdSeconds = 120;

  // ============ VALIDATION ============
  /// Philippines phone number regex
  static final RegExp philippinesPhoneRegex = RegExp(r'^\+63[0-9]{10}$');

  /// Minimum OTP length
  static const int otpLength = 6;
}
