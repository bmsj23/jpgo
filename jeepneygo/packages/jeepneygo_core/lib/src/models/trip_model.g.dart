// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
  id: json['id'] as String,
  driverId: json['driverId'] as String,
  vehicleId: json['vehicleId'] as String,
  routeId: json['routeId'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  status:
      $enumDecodeNullable(_$TripStatusEnumMap, json['status']) ??
      TripStatus.active,
  distanceKm: (json['distanceKm'] as num?)?.toDouble(),
  durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
  trackPoints:
      (json['trackPoints'] as List<dynamic>?)
          ?.map(
            (e) => (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'vehicleId': instance.vehicleId,
      'routeId': instance.routeId,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'status': _$TripStatusEnumMap[instance.status]!,
      'distanceKm': instance.distanceKm,
      'durationMinutes': instance.durationMinutes,
      'trackPoints': instance.trackPoints,
    };

const _$TripStatusEnumMap = {
  TripStatus.active: 'active',
  TripStatus.completed: 'completed',
  TripStatus.cancelled: 'cancelled',
};
