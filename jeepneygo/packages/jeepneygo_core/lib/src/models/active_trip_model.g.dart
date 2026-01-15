// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveTripImpl _$$ActiveTripImplFromJson(Map<String, dynamic> json) =>
    _$ActiveTripImpl(
      tripId: json['tripId'] as String,
      driverId: json['driverId'] as String,
      vehicleId: json['vehicleId'] as String,
      routeId: json['routeId'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      heading: (json['heading'] as num).toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      capacity: (json['capacity'] as num?)?.toInt() ?? 20,
      currentPassengers: (json['currentPassengers'] as num?)?.toInt() ?? 0,
      nextStopId: json['nextStopId'] as String?,
      etaMinutes: (json['etaMinutes'] as num?)?.toInt(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    );

Map<String, dynamic> _$$ActiveTripImplToJson(_$ActiveTripImpl instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'driverId': instance.driverId,
      'vehicleId': instance.vehicleId,
      'routeId': instance.routeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'heading': instance.heading,
      'speed': instance.speed,
      'capacity': instance.capacity,
      'currentPassengers': instance.currentPassengers,
      'nextStopId': instance.nextStopId,
      'etaMinutes': instance.etaMinutes,
      'startedAt': instance.startedAt.toIso8601String(),
      'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
    };
