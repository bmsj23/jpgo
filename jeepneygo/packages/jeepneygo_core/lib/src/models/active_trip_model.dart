import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_trip_model.freezed.dart';
part 'active_trip_model.g.dart';

/// Real-time active trip data stored in Firestore
/// This is the main document that commuters subscribe to for real-time updates
@freezed
class ActiveTrip with _$ActiveTrip {
  const factory ActiveTrip({
    required String tripId,
    required String driverId,
    required String vehicleId,
    required String routeId,
    
    // Current location (updated every 10-15 seconds)
    required double latitude,
    required double longitude,
    required double heading,
    double? speed,
    
    // Capacity
    @Default(20) int capacity,
    @Default(0) int currentPassengers,
    
    // ETA to next stop
    String? nextStopId,
    int? etaMinutes,
    
    // Timestamps
    required DateTime startedAt,
    required DateTime lastUpdatedAt,
  }) = _ActiveTrip;

  factory ActiveTrip.fromJson(Map<String, dynamic> json) =>
      _$ActiveTripFromJson(json);
}
