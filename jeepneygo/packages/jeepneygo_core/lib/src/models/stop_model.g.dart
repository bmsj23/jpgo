// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StopImpl _$$StopImplFromJson(Map<String, dynamic> json) => _$StopImpl(
  id: json['id'] as String,
  routeId: json['routeId'] as String,
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  sequence: (json['sequence'] as num).toInt(),
  landmark: json['landmark'] as String?,
  description: json['description'] as String?,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$StopImplToJson(_$StopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeId': instance.routeId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'sequence': instance.sequence,
      'landmark': instance.landmark,
      'description': instance.description,
      'isActive': instance.isActive,
    };
