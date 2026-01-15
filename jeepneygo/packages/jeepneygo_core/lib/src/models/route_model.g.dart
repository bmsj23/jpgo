// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JeepneyRouteImpl _$$JeepneyRouteImplFromJson(Map<String, dynamic> json) =>
    _$JeepneyRouteImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      description: json['description'] as String?,
      startPoint: json['startPoint'] as String,
      endPoint: json['endPoint'] as String,
      color: json['color'] as String? ?? '#FFB800',
      baseFare: (json['baseFare'] as num?)?.toDouble() ?? 13.0,
      farePerKm: (json['farePerKm'] as num?)?.toDouble() ?? 1.80,
      polylineEncoded: json['polylineEncoded'] as String?,
      stopIds:
          (json['stopIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$JeepneyRouteImplToJson(_$JeepneyRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'description': instance.description,
      'startPoint': instance.startPoint,
      'endPoint': instance.endPoint,
      'color': instance.color,
      'baseFare': instance.baseFare,
      'farePerKm': instance.farePerKm,
      'polylineEncoded': instance.polylineEncoded,
      'stopIds': instance.stopIds,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
