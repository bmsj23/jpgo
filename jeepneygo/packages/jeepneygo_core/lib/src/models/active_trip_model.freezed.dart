// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ActiveTrip _$ActiveTripFromJson(Map<String, dynamic> json) {
  return _ActiveTrip.fromJson(json);
}

/// @nodoc
mixin _$ActiveTrip {
  String get tripId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get routeId =>
      throw _privateConstructorUsedError; // Current location (updated every 10-15 seconds)
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get heading => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError; // Capacity
  int get capacity => throw _privateConstructorUsedError;
  int get currentPassengers =>
      throw _privateConstructorUsedError; // ETA to next stop
  String? get nextStopId => throw _privateConstructorUsedError;
  int? get etaMinutes => throw _privateConstructorUsedError; // Timestamps
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get lastUpdatedAt => throw _privateConstructorUsedError;

  /// Serializes this ActiveTrip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveTrip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveTripCopyWith<ActiveTrip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveTripCopyWith<$Res> {
  factory $ActiveTripCopyWith(
    ActiveTrip value,
    $Res Function(ActiveTrip) then,
  ) = _$ActiveTripCopyWithImpl<$Res, ActiveTrip>;
  @useResult
  $Res call({
    String tripId,
    String driverId,
    String vehicleId,
    String routeId,
    double latitude,
    double longitude,
    double heading,
    double? speed,
    int capacity,
    int currentPassengers,
    String? nextStopId,
    int? etaMinutes,
    DateTime startedAt,
    DateTime lastUpdatedAt,
  });
}

/// @nodoc
class _$ActiveTripCopyWithImpl<$Res, $Val extends ActiveTrip>
    implements $ActiveTripCopyWith<$Res> {
  _$ActiveTripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveTrip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? driverId = null,
    Object? vehicleId = null,
    Object? routeId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? heading = null,
    Object? speed = freezed,
    Object? capacity = null,
    Object? currentPassengers = null,
    Object? nextStopId = freezed,
    Object? etaMinutes = freezed,
    Object? startedAt = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            tripId: null == tripId
                ? _value.tripId
                : tripId // ignore: cast_nullable_to_non_nullable
                      as String,
            driverId: null == driverId
                ? _value.driverId
                : driverId // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            routeId: null == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            heading: null == heading
                ? _value.heading
                : heading // ignore: cast_nullable_to_non_nullable
                      as double,
            speed: freezed == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                      as double?,
            capacity: null == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPassengers: null == currentPassengers
                ? _value.currentPassengers
                : currentPassengers // ignore: cast_nullable_to_non_nullable
                      as int,
            nextStopId: freezed == nextStopId
                ? _value.nextStopId
                : nextStopId // ignore: cast_nullable_to_non_nullable
                      as String?,
            etaMinutes: freezed == etaMinutes
                ? _value.etaMinutes
                : etaMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastUpdatedAt: null == lastUpdatedAt
                ? _value.lastUpdatedAt
                : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActiveTripImplCopyWith<$Res>
    implements $ActiveTripCopyWith<$Res> {
  factory _$$ActiveTripImplCopyWith(
    _$ActiveTripImpl value,
    $Res Function(_$ActiveTripImpl) then,
  ) = __$$ActiveTripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String tripId,
    String driverId,
    String vehicleId,
    String routeId,
    double latitude,
    double longitude,
    double heading,
    double? speed,
    int capacity,
    int currentPassengers,
    String? nextStopId,
    int? etaMinutes,
    DateTime startedAt,
    DateTime lastUpdatedAt,
  });
}

/// @nodoc
class __$$ActiveTripImplCopyWithImpl<$Res>
    extends _$ActiveTripCopyWithImpl<$Res, _$ActiveTripImpl>
    implements _$$ActiveTripImplCopyWith<$Res> {
  __$$ActiveTripImplCopyWithImpl(
    _$ActiveTripImpl _value,
    $Res Function(_$ActiveTripImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActiveTrip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? driverId = null,
    Object? vehicleId = null,
    Object? routeId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? heading = null,
    Object? speed = freezed,
    Object? capacity = null,
    Object? currentPassengers = null,
    Object? nextStopId = freezed,
    Object? etaMinutes = freezed,
    Object? startedAt = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(
      _$ActiveTripImpl(
        tripId: null == tripId
            ? _value.tripId
            : tripId // ignore: cast_nullable_to_non_nullable
                  as String,
        driverId: null == driverId
            ? _value.driverId
            : driverId // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        routeId: null == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        heading: null == heading
            ? _value.heading
            : heading // ignore: cast_nullable_to_non_nullable
                  as double,
        speed: freezed == speed
            ? _value.speed
            : speed // ignore: cast_nullable_to_non_nullable
                  as double?,
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPassengers: null == currentPassengers
            ? _value.currentPassengers
            : currentPassengers // ignore: cast_nullable_to_non_nullable
                  as int,
        nextStopId: freezed == nextStopId
            ? _value.nextStopId
            : nextStopId // ignore: cast_nullable_to_non_nullable
                  as String?,
        etaMinutes: freezed == etaMinutes
            ? _value.etaMinutes
            : etaMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastUpdatedAt: null == lastUpdatedAt
            ? _value.lastUpdatedAt
            : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveTripImpl implements _ActiveTrip {
  const _$ActiveTripImpl({
    required this.tripId,
    required this.driverId,
    required this.vehicleId,
    required this.routeId,
    required this.latitude,
    required this.longitude,
    required this.heading,
    this.speed,
    this.capacity = 20,
    this.currentPassengers = 0,
    this.nextStopId,
    this.etaMinutes,
    required this.startedAt,
    required this.lastUpdatedAt,
  });

  factory _$ActiveTripImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveTripImplFromJson(json);

  @override
  final String tripId;
  @override
  final String driverId;
  @override
  final String vehicleId;
  @override
  final String routeId;
  // Current location (updated every 10-15 seconds)
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double heading;
  @override
  final double? speed;
  // Capacity
  @override
  @JsonKey()
  final int capacity;
  @override
  @JsonKey()
  final int currentPassengers;
  // ETA to next stop
  @override
  final String? nextStopId;
  @override
  final int? etaMinutes;
  // Timestamps
  @override
  final DateTime startedAt;
  @override
  final DateTime lastUpdatedAt;

  @override
  String toString() {
    return 'ActiveTrip(tripId: $tripId, driverId: $driverId, vehicleId: $vehicleId, routeId: $routeId, latitude: $latitude, longitude: $longitude, heading: $heading, speed: $speed, capacity: $capacity, currentPassengers: $currentPassengers, nextStopId: $nextStopId, etaMinutes: $etaMinutes, startedAt: $startedAt, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveTripImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.currentPassengers, currentPassengers) ||
                other.currentPassengers == currentPassengers) &&
            (identical(other.nextStopId, nextStopId) ||
                other.nextStopId == nextStopId) &&
            (identical(other.etaMinutes, etaMinutes) ||
                other.etaMinutes == etaMinutes) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tripId,
    driverId,
    vehicleId,
    routeId,
    latitude,
    longitude,
    heading,
    speed,
    capacity,
    currentPassengers,
    nextStopId,
    etaMinutes,
    startedAt,
    lastUpdatedAt,
  );

  /// Create a copy of ActiveTrip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveTripImplCopyWith<_$ActiveTripImpl> get copyWith =>
      __$$ActiveTripImplCopyWithImpl<_$ActiveTripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveTripImplToJson(this);
  }
}

abstract class _ActiveTrip implements ActiveTrip {
  const factory _ActiveTrip({
    required final String tripId,
    required final String driverId,
    required final String vehicleId,
    required final String routeId,
    required final double latitude,
    required final double longitude,
    required final double heading,
    final double? speed,
    final int capacity,
    final int currentPassengers,
    final String? nextStopId,
    final int? etaMinutes,
    required final DateTime startedAt,
    required final DateTime lastUpdatedAt,
  }) = _$ActiveTripImpl;

  factory _ActiveTrip.fromJson(Map<String, dynamic> json) =
      _$ActiveTripImpl.fromJson;

  @override
  String get tripId;
  @override
  String get driverId;
  @override
  String get vehicleId;
  @override
  String get routeId; // Current location (updated every 10-15 seconds)
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get heading;
  @override
  double? get speed; // Capacity
  @override
  int get capacity;
  @override
  int get currentPassengers; // ETA to next stop
  @override
  String? get nextStopId;
  @override
  int? get etaMinutes; // Timestamps
  @override
  DateTime get startedAt;
  @override
  DateTime get lastUpdatedAt;

  /// Create a copy of ActiveTrip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveTripImplCopyWith<_$ActiveTripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
