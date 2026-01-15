// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String get plateNumber => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError; // Vehicle details
  String? get bodyNumber => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError; // Assignment
  String? get currentDriverId => throw _privateConstructorUsedError; // Status
  bool get isActive => throw _privateConstructorUsedError;
  bool get isOnTrip => throw _privateConstructorUsedError; // Metadata
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call({
    String id,
    String plateNumber,
    String routeId,
    String? bodyNumber,
    String? color,
    int capacity,
    String? currentDriverId,
    bool isActive,
    bool isOnTrip,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plateNumber = null,
    Object? routeId = null,
    Object? bodyNumber = freezed,
    Object? color = freezed,
    Object? capacity = null,
    Object? currentDriverId = freezed,
    Object? isActive = null,
    Object? isOnTrip = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            plateNumber: null == plateNumber
                ? _value.plateNumber
                : plateNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            routeId: null == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String,
            bodyNumber: freezed == bodyNumber
                ? _value.bodyNumber
                : bodyNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            capacity: null == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int,
            currentDriverId: freezed == currentDriverId
                ? _value.currentDriverId
                : currentDriverId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isOnTrip: null == isOnTrip
                ? _value.isOnTrip
                : isOnTrip // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
    _$VehicleImpl value,
    $Res Function(_$VehicleImpl) then,
  ) = __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String plateNumber,
    String routeId,
    String? bodyNumber,
    String? color,
    int capacity,
    String? currentDriverId,
    bool isActive,
    bool isOnTrip,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
    _$VehicleImpl _value,
    $Res Function(_$VehicleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plateNumber = null,
    Object? routeId = null,
    Object? bodyNumber = freezed,
    Object? color = freezed,
    Object? capacity = null,
    Object? currentDriverId = freezed,
    Object? isActive = null,
    Object? isOnTrip = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VehicleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        plateNumber: null == plateNumber
            ? _value.plateNumber
            : plateNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        routeId: null == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String,
        bodyNumber: freezed == bodyNumber
            ? _value.bodyNumber
            : bodyNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
        currentDriverId: freezed == currentDriverId
            ? _value.currentDriverId
            : currentDriverId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOnTrip: null == isOnTrip
            ? _value.isOnTrip
            : isOnTrip // ignore: cast_nullable_to_non_nullable
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
class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl({
    required this.id,
    required this.plateNumber,
    required this.routeId,
    this.bodyNumber,
    this.color,
    this.capacity = 20,
    this.currentDriverId,
    this.isActive = true,
    this.isOnTrip = false,
    required this.createdAt,
    this.updatedAt,
  });

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final String id;
  @override
  final String plateNumber;
  @override
  final String routeId;
  // Vehicle details
  @override
  final String? bodyNumber;
  @override
  final String? color;
  @override
  @JsonKey()
  final int capacity;
  // Assignment
  @override
  final String? currentDriverId;
  // Status
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isOnTrip;
  // Metadata
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Vehicle(id: $id, plateNumber: $plateNumber, routeId: $routeId, bodyNumber: $bodyNumber, color: $color, capacity: $capacity, currentDriverId: $currentDriverId, isActive: $isActive, isOnTrip: $isOnTrip, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.bodyNumber, bodyNumber) ||
                other.bodyNumber == bodyNumber) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.currentDriverId, currentDriverId) ||
                other.currentDriverId == currentDriverId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isOnTrip, isOnTrip) ||
                other.isOnTrip == isOnTrip) &&
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
    plateNumber,
    routeId,
    bodyNumber,
    color,
    capacity,
    currentDriverId,
    isActive,
    isOnTrip,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(this);
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle({
    required final String id,
    required final String plateNumber,
    required final String routeId,
    final String? bodyNumber,
    final String? color,
    final int capacity,
    final String? currentDriverId,
    final bool isActive,
    final bool isOnTrip,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  String get id;
  @override
  String get plateNumber;
  @override
  String get routeId; // Vehicle details
  @override
  String? get bodyNumber;
  @override
  String? get color;
  @override
  int get capacity; // Assignment
  @override
  String? get currentDriverId; // Status
  @override
  bool get isActive;
  @override
  bool get isOnTrip; // Metadata
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
