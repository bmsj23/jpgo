// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: json['id'] as String,
      plateNumber: json['plateNumber'] as String,
      routeId: json['routeId'] as String,
      bodyNumber: json['bodyNumber'] as String?,
      color: json['color'] as String?,
      capacity: (json['capacity'] as num?)?.toInt() ?? 20,
      currentDriverId: json['currentDriverId'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      isOnTrip: json['isOnTrip'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plateNumber': instance.plateNumber,
      'routeId': instance.routeId,
      'bodyNumber': instance.bodyNumber,
      'color': instance.color,
      'capacity': instance.capacity,
      'currentDriverId': instance.currentDriverId,
      'isActive': instance.isActive,
      'isOnTrip': instance.isOnTrip,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
