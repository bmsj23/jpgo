import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

/// Status of a trip
enum TripStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

/// Historical trip record
@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String driverId,
    required String vehicleId,
    required String routeId,
    
    // Timing
    required DateTime startedAt,
    DateTime? endedAt,
    
    // Status
    @Default(TripStatus.active) TripStatus status,
    
    // Stats (calculated at end)
    double? distanceKm,
    int? durationMinutes,
    
    // Route tracking (list of lat/lng points)
    @Default([]) List<Map<String, double>> trackPoints,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
