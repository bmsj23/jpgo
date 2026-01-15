import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_model.freezed.dart';
part 'stop_model.g.dart';

/// A stop along a jeepney route
@freezed
class Stop with _$Stop {
  const factory Stop({
    required String id,
    required String routeId,
    required String name,
    
    // Location
    required double latitude,
    required double longitude,
    
    // Order in route
    required int sequence,
    
    // Optional details
    String? landmark,
    String? description,
    
    // Status
    @Default(true) bool isActive,
  }) = _Stop;

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
}
