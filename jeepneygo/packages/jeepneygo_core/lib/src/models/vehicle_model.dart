import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

/// Vehicle (Jeepney) model
@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String plateNumber,
    required String routeId,
    
    // Vehicle details
    String? bodyNumber,
    String? color,
    @Default(20) int capacity,
    
    // Assignment
    String? currentDriverId,
    
    // Status
    @Default(true) bool isActive,
    @Default(false) bool isOnTrip,
    
    // Metadata
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
