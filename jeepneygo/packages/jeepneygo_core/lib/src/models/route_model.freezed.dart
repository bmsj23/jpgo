// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JeepneyRoute _$JeepneyRouteFromJson(Map<String, dynamic> json) {
  return _JeepneyRoute.fromJson(json);
}

/// @nodoc
mixin _$JeepneyRoute {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError; // Route details
  String? get description => throw _privateConstructorUsedError;
  String get startPoint => throw _privateConstructorUsedError;
  String get endPoint => throw _privateConstructorUsedError; // Visual
  String get color => throw _privateConstructorUsedError; // Fare
  double get baseFare => throw _privateConstructorUsedError;
  double get farePerKm =>
      throw _privateConstructorUsedError; // Polyline for map rendering (encoded)
  String? get polylineEncoded =>
      throw _privateConstructorUsedError; // List of stop IDs in order
  List<String> get stopIds => throw _privateConstructorUsedError; // Status
  bool get isActive => throw _privateConstructorUsedError; // Metadata
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this JeepneyRoute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JeepneyRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JeepneyRouteCopyWith<JeepneyRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JeepneyRouteCopyWith<$Res> {
  factory $JeepneyRouteCopyWith(
    JeepneyRoute value,
    $Res Function(JeepneyRoute) then,
  ) = _$JeepneyRouteCopyWithImpl<$Res, JeepneyRoute>;
  @useResult
  $Res call({
    String id,
    String name,
    String shortName,
    String? description,
    String startPoint,
    String endPoint,
    String color,
    double baseFare,
    double farePerKm,
    String? polylineEncoded,
    List<String> stopIds,
    bool isActive,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$JeepneyRouteCopyWithImpl<$Res, $Val extends JeepneyRoute>
    implements $JeepneyRouteCopyWith<$Res> {
  _$JeepneyRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JeepneyRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? description = freezed,
    Object? startPoint = null,
    Object? endPoint = null,
    Object? color = null,
    Object? baseFare = null,
    Object? farePerKm = null,
    Object? polylineEncoded = freezed,
    Object? stopIds = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            shortName: null == shortName
                ? _value.shortName
                : shortName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            startPoint: null == startPoint
                ? _value.startPoint
                : startPoint // ignore: cast_nullable_to_non_nullable
                      as String,
            endPoint: null == endPoint
                ? _value.endPoint
                : endPoint // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            baseFare: null == baseFare
                ? _value.baseFare
                : baseFare // ignore: cast_nullable_to_non_nullable
                      as double,
            farePerKm: null == farePerKm
                ? _value.farePerKm
                : farePerKm // ignore: cast_nullable_to_non_nullable
                      as double,
            polylineEncoded: freezed == polylineEncoded
                ? _value.polylineEncoded
                : polylineEncoded // ignore: cast_nullable_to_non_nullable
                      as String?,
            stopIds: null == stopIds
                ? _value.stopIds
                : stopIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JeepneyRouteImplCopyWith<$Res>
    implements $JeepneyRouteCopyWith<$Res> {
  factory _$$JeepneyRouteImplCopyWith(
    _$JeepneyRouteImpl value,
    $Res Function(_$JeepneyRouteImpl) then,
  ) = __$$JeepneyRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String shortName,
    String? description,
    String startPoint,
    String endPoint,
    String color,
    double baseFare,
    double farePerKm,
    String? polylineEncoded,
    List<String> stopIds,
    bool isActive,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$JeepneyRouteImplCopyWithImpl<$Res>
    extends _$JeepneyRouteCopyWithImpl<$Res, _$JeepneyRouteImpl>
    implements _$$JeepneyRouteImplCopyWith<$Res> {
  __$$JeepneyRouteImplCopyWithImpl(
    _$JeepneyRouteImpl _value,
    $Res Function(_$JeepneyRouteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JeepneyRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? description = freezed,
    Object? startPoint = null,
    Object? endPoint = null,
    Object? color = null,
    Object? baseFare = null,
    Object? farePerKm = null,
    Object? polylineEncoded = freezed,
    Object? stopIds = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$JeepneyRouteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        shortName: null == shortName
            ? _value.shortName
            : shortName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        startPoint: null == startPoint
            ? _value.startPoint
            : startPoint // ignore: cast_nullable_to_non_nullable
                  as String,
        endPoint: null == endPoint
            ? _value.endPoint
            : endPoint // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        baseFare: null == baseFare
            ? _value.baseFare
            : baseFare // ignore: cast_nullable_to_non_nullable
                  as double,
        farePerKm: null == farePerKm
            ? _value.farePerKm
            : farePerKm // ignore: cast_nullable_to_non_nullable
                  as double,
        polylineEncoded: freezed == polylineEncoded
            ? _value.polylineEncoded
            : polylineEncoded // ignore: cast_nullable_to_non_nullable
                  as String?,
        stopIds: null == stopIds
            ? _value._stopIds
            : stopIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JeepneyRouteImpl implements _JeepneyRoute {
  const _$JeepneyRouteImpl({
    required this.id,
    required this.name,
    required this.shortName,
    this.description,
    required this.startPoint,
    required this.endPoint,
    this.color = '#FFB800',
    this.baseFare = 13.0,
    this.farePerKm = 1.80,
    this.polylineEncoded,
    final List<String> stopIds = const [],
    this.isActive = true,
    required this.createdAt,
    this.updatedAt,
  }) : _stopIds = stopIds;

  factory _$JeepneyRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$JeepneyRouteImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String shortName;
  // Route details
  @override
  final String? description;
  @override
  final String startPoint;
  @override
  final String endPoint;
  // Visual
  @override
  @JsonKey()
  final String color;
  // Fare
  @override
  @JsonKey()
  final double baseFare;
  @override
  @JsonKey()
  final double farePerKm;
  // Polyline for map rendering (encoded)
  @override
  final String? polylineEncoded;
  // List of stop IDs in order
  final List<String> _stopIds;
  // List of stop IDs in order
  @override
  @JsonKey()
  List<String> get stopIds {
    if (_stopIds is EqualUnmodifiableListView) return _stopIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stopIds);
  }

  // Status
  @override
  @JsonKey()
  final bool isActive;
  // Metadata
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'JeepneyRoute(id: $id, name: $name, shortName: $shortName, description: $description, startPoint: $startPoint, endPoint: $endPoint, color: $color, baseFare: $baseFare, farePerKm: $farePerKm, polylineEncoded: $polylineEncoded, stopIds: $stopIds, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JeepneyRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startPoint, startPoint) ||
                other.startPoint == startPoint) &&
            (identical(other.endPoint, endPoint) ||
                other.endPoint == endPoint) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.baseFare, baseFare) ||
                other.baseFare == baseFare) &&
            (identical(other.farePerKm, farePerKm) ||
                other.farePerKm == farePerKm) &&
            (identical(other.polylineEncoded, polylineEncoded) ||
                other.polylineEncoded == polylineEncoded) &&
            const DeepCollectionEquality().equals(other._stopIds, _stopIds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    shortName,
    description,
    startPoint,
    endPoint,
    color,
    baseFare,
    farePerKm,
    polylineEncoded,
    const DeepCollectionEquality().hash(_stopIds),
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of JeepneyRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JeepneyRouteImplCopyWith<_$JeepneyRouteImpl> get copyWith =>
      __$$JeepneyRouteImplCopyWithImpl<_$JeepneyRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JeepneyRouteImplToJson(this);
  }
}

abstract class _JeepneyRoute implements JeepneyRoute {
  const factory _JeepneyRoute({
    required final String id,
    required final String name,
    required final String shortName,
    final String? description,
    required final String startPoint,
    required final String endPoint,
    final String color,
    final double baseFare,
    final double farePerKm,
    final String? polylineEncoded,
    final List<String> stopIds,
    final bool isActive,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$JeepneyRouteImpl;

  factory _JeepneyRoute.fromJson(Map<String, dynamic> json) =
      _$JeepneyRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get shortName; // Route details
  @override
  String? get description;
  @override
  String get startPoint;
  @override
  String get endPoint; // Visual
  @override
  String get color; // Fare
  @override
  double get baseFare;
  @override
  double get farePerKm; // Polyline for map rendering (encoded)
  @override
  String? get polylineEncoded; // List of stop IDs in order
  @override
  List<String> get stopIds; // Status
  @override
  bool get isActive; // Metadata
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of JeepneyRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JeepneyRouteImplCopyWith<_$JeepneyRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
