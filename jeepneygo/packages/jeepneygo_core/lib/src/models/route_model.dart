import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

/// Jeepney route model
@freezed
class JeepneyRoute with _$JeepneyRoute {
  const factory JeepneyRoute({
    required String id,
    required String name,
    required String shortName,
    
    // Route details
    String? description,
    required String startPoint,
    required String endPoint,
    
    // Visual
    @Default('#FFB800') String color,
    
    // Fare
    @Default(13.0) double baseFare,
    @Default(1.80) double farePerKm,
    
    // Polyline for map rendering (encoded)
    String? polylineEncoded,
    
    // List of stop IDs in order
    @Default([]) List<String> stopIds,
    
    // Status
    @Default(true) bool isActive,
    
    // Metadata
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _JeepneyRoute;

  factory JeepneyRoute.fromJson(Map<String, dynamic> json) =>
      _$JeepneyRouteFromJson(json);
}
