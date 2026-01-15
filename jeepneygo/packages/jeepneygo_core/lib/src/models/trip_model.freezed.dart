// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError; // Timing
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError; // Status
  TripStatus get status =>
      throw _privateConstructorUsedError; // Stats (calculated at end)
  double? get distanceKm => throw _privateConstructorUsedError;
  int? get durationMinutes =>
      throw _privateConstructorUsedError; // Route tracking (list of lat/lng points)
  List<Map<String, double>> get trackPoints =>
      throw _privateConstructorUsedError;

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call({
    String id,
    String driverId,
    String vehicleId,
    String routeId,
    DateTime startedAt,
    DateTime? endedAt,
    TripStatus status,
    double? distanceKm,
    int? durationMinutes,
    List<Map<String, double>> trackPoints,
  });
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? vehicleId = null,
    Object? routeId = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? status = null,
    Object? distanceKm = freezed,
    Object? durationMinutes = freezed,
    Object? trackPoints = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endedAt: freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TripStatus,
            distanceKm: freezed == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double?,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            trackPoints: null == trackPoints
                ? _value.trackPoints
                : trackPoints // ignore: cast_nullable_to_non_nullable
                      as List<Map<String, double>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
    _$TripImpl value,
    $Res Function(_$TripImpl) then,
  ) = __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String driverId,
    String vehicleId,
    String routeId,
    DateTime startedAt,
    DateTime? endedAt,
    TripStatus status,
    double? distanceKm,
    int? durationMinutes,
    List<Map<String, double>> trackPoints,
  });
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
    : super(_value, _then);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? driverId = null,
    Object? vehicleId = null,
    Object? routeId = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? status = null,
    Object? distanceKm = freezed,
    Object? durationMinutes = freezed,
    Object? trackPoints = null,
  }) {
    return _then(
      _$TripImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
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
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endedAt: freezed == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TripStatus,
        distanceKm: freezed == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double?,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        trackPoints: null == trackPoints
            ? _value._trackPoints
            : trackPoints // ignore: cast_nullable_to_non_nullable
                  as List<Map<String, double>>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  const _$TripImpl({
    required this.id,
    required this.driverId,
    required this.vehicleId,
    required this.routeId,
    required this.startedAt,
    this.endedAt,
    this.status = TripStatus.active,
    this.distanceKm,
    this.durationMinutes,
    final List<Map<String, double>> trackPoints = const [],
  }) : _trackPoints = trackPoints;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  final String driverId;
  @override
  final String vehicleId;
  @override
  final String routeId;
  // Timing
  @override
  final DateTime startedAt;
  @override
  final DateTime? endedAt;
  // Status
  @override
  @JsonKey()
  final TripStatus status;
  // Stats (calculated at end)
  @override
  final double? distanceKm;
  @override
  final int? durationMinutes;
  // Route tracking (list of lat/lng points)
  final List<Map<String, double>> _trackPoints;
  // Route tracking (list of lat/lng points)
  @override
  @JsonKey()
  List<Map<String, double>> get trackPoints {
    if (_trackPoints is EqualUnmodifiableListView) return _trackPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackPoints);
  }

  @override
  String toString() {
    return 'Trip(id: $id, driverId: $driverId, vehicleId: $vehicleId, routeId: $routeId, startedAt: $startedAt, endedAt: $endedAt, status: $status, distanceKm: $distanceKm, durationMinutes: $durationMinutes, trackPoints: $trackPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality().equals(
              other._trackPoints,
              _trackPoints,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    driverId,
    vehicleId,
    routeId,
    startedAt,
    endedAt,
    status,
    distanceKm,
    durationMinutes,
    const DeepCollectionEquality().hash(_trackPoints),
  );

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(this);
  }
}

abstract class _Trip implements Trip {
  const factory _Trip({
    required final String id,
    required final String driverId,
    required final String vehicleId,
    required final String routeId,
    required final DateTime startedAt,
    final DateTime? endedAt,
    final TripStatus status,
    final double? distanceKm,
    final int? durationMinutes,
    final List<Map<String, double>> trackPoints,
  }) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  String get driverId;
  @override
  String get vehicleId;
  @override
  String get routeId; // Timing
  @override
  DateTime get startedAt;
  @override
  DateTime? get endedAt; // Status
  @override
  TripStatus get status; // Stats (calculated at end)
  @override
  double? get distanceKm;
  @override
  int? get durationMinutes; // Route tracking (list of lat/lng points)
  @override
  List<Map<String, double>> get trackPoints;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
