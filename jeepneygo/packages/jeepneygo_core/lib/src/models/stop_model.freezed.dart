// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Stop _$StopFromJson(Map<String, dynamic> json) {
  return _Stop.fromJson(json);
}

/// @nodoc
mixin _$Stop {
  String get id => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // Location
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError; // Order in route
  int get sequence => throw _privateConstructorUsedError; // Optional details
  String? get landmark => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError; // Status
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this Stop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Stop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StopCopyWith<Stop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopCopyWith<$Res> {
  factory $StopCopyWith(Stop value, $Res Function(Stop) then) =
      _$StopCopyWithImpl<$Res, Stop>;
  @useResult
  $Res call({
    String id,
    String routeId,
    String name,
    double latitude,
    double longitude,
    int sequence,
    String? landmark,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class _$StopCopyWithImpl<$Res, $Val extends Stop>
    implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? sequence = null,
    Object? landmark = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            routeId: null == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            sequence: null == sequence
                ? _value.sequence
                : sequence // ignore: cast_nullable_to_non_nullable
                      as int,
            landmark: freezed == landmark
                ? _value.landmark
                : landmark // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> implements $StopCopyWith<$Res> {
  factory _$$StopImplCopyWith(
    _$StopImpl value,
    $Res Function(_$StopImpl) then,
  ) = __$$StopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String routeId,
    String name,
    double latitude,
    double longitude,
    int sequence,
    String? landmark,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$StopCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
    : super(_value, _then);

  /// Create a copy of Stop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? sequence = null,
    Object? landmark = freezed,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$StopImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        routeId: null == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        sequence: null == sequence
            ? _value.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        landmark: freezed == landmark
            ? _value.landmark
            : landmark // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StopImpl implements _Stop {
  const _$StopImpl({
    required this.id,
    required this.routeId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.sequence,
    this.landmark,
    this.description,
    this.isActive = true,
  });

  factory _$StopImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopImplFromJson(json);

  @override
  final String id;
  @override
  final String routeId;
  @override
  final String name;
  // Location
  @override
  final double latitude;
  @override
  final double longitude;
  // Order in route
  @override
  final int sequence;
  // Optional details
  @override
  final String? landmark;
  @override
  final String? description;
  // Status
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'Stop(id: $id, routeId: $routeId, name: $name, latitude: $latitude, longitude: $longitude, sequence: $sequence, landmark: $landmark, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    routeId,
    name,
    latitude,
    longitude,
    sequence,
    landmark,
    description,
    isActive,
  );

  /// Create a copy of Stop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      __$$StopImplCopyWithImpl<_$StopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StopImplToJson(this);
  }
}

abstract class _Stop implements Stop {
  const factory _Stop({
    required final String id,
    required final String routeId,
    required final String name,
    required final double latitude,
    required final double longitude,
    required final int sequence,
    final String? landmark,
    final String? description,
    final bool isActive,
  }) = _$StopImpl;

  factory _Stop.fromJson(Map<String, dynamic> json) = _$StopImpl.fromJson;

  @override
  String get id;
  @override
  String get routeId;
  @override
  String get name; // Location
  @override
  double get latitude;
  @override
  double get longitude; // Order in route
  @override
  int get sequence; // Optional details
  @override
  String? get landmark;
  @override
  String? get description; // Status
  @override
  bool get isActive;

  /// Create a copy of Stop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
