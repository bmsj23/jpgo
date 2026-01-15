// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get profilePhotoUrl =>
      throw _privateConstructorUsedError; // Driver-specific fields
  String? get licensePhotoUrl => throw _privateConstructorUsedError;
  DriverStatus? get driverStatus => throw _privateConstructorUsedError;
  String? get assignedVehicleId => throw _privateConstructorUsedError;
  String? get assignedRouteId => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get approvedBy => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError; // Metadata
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String uid,
    String phoneNumber,
    UserRole role,
    String? displayName,
    String? email,
    String? profilePhotoUrl,
    String? licensePhotoUrl,
    DriverStatus? driverStatus,
    String? assignedVehicleId,
    String? assignedRouteId,
    DateTime? approvedAt,
    String? approvedBy,
    String? rejectionReason,
    DateTime createdAt,
    DateTime? lastLoginAt,
    bool isActive,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? profilePhotoUrl = freezed,
    Object? licensePhotoUrl = freezed,
    Object? driverStatus = freezed,
    Object? assignedVehicleId = freezed,
    Object? assignedRouteId = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as UserRole,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            profilePhotoUrl: freezed == profilePhotoUrl
                ? _value.profilePhotoUrl
                : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            licensePhotoUrl: freezed == licensePhotoUrl
                ? _value.licensePhotoUrl
                : licensePhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            driverStatus: freezed == driverStatus
                ? _value.driverStatus
                : driverStatus // ignore: cast_nullable_to_non_nullable
                      as DriverStatus?,
            assignedVehicleId: freezed == assignedVehicleId
                ? _value.assignedVehicleId
                : assignedVehicleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedRouteId: freezed == assignedRouteId
                ? _value.assignedRouteId
                : assignedRouteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            approvedBy: freezed == approvedBy
                ? _value.approvedBy
                : approvedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastLoginAt: freezed == lastLoginAt
                ? _value.lastLoginAt
                : lastLoginAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uid,
    String phoneNumber,
    UserRole role,
    String? displayName,
    String? email,
    String? profilePhotoUrl,
    String? licensePhotoUrl,
    DriverStatus? driverStatus,
    String? assignedVehicleId,
    String? assignedRouteId,
    DateTime? approvedAt,
    String? approvedBy,
    String? rejectionReason,
    DateTime createdAt,
    DateTime? lastLoginAt,
    bool isActive,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? profilePhotoUrl = freezed,
    Object? licensePhotoUrl = freezed,
    Object? driverStatus = freezed,
    Object? assignedVehicleId = freezed,
    Object? assignedRouteId = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$UserImpl(
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        profilePhotoUrl: freezed == profilePhotoUrl
            ? _value.profilePhotoUrl
            : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        licensePhotoUrl: freezed == licensePhotoUrl
            ? _value.licensePhotoUrl
            : licensePhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        driverStatus: freezed == driverStatus
            ? _value.driverStatus
            : driverStatus // ignore: cast_nullable_to_non_nullable
                  as DriverStatus?,
        assignedVehicleId: freezed == assignedVehicleId
            ? _value.assignedVehicleId
            : assignedVehicleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedRouteId: freezed == assignedRouteId
            ? _value.assignedRouteId
            : assignedRouteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        approvedBy: freezed == approvedBy
            ? _value.approvedBy
            : approvedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastLoginAt: freezed == lastLoginAt
            ? _value.lastLoginAt
            : lastLoginAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.uid,
    required this.phoneNumber,
    required this.role,
    this.displayName,
    this.email,
    this.profilePhotoUrl,
    this.licensePhotoUrl,
    this.driverStatus,
    this.assignedVehicleId,
    this.assignedRouteId,
    this.approvedAt,
    this.approvedBy,
    this.rejectionReason,
    required this.createdAt,
    this.lastLoginAt,
    this.isActive = true,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
  @override
  final String phoneNumber;
  @override
  final UserRole role;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? profilePhotoUrl;
  // Driver-specific fields
  @override
  final String? licensePhotoUrl;
  @override
  final DriverStatus? driverStatus;
  @override
  final String? assignedVehicleId;
  @override
  final String? assignedRouteId;
  @override
  final DateTime? approvedAt;
  @override
  final String? approvedBy;
  @override
  final String? rejectionReason;
  // Metadata
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'User(uid: $uid, phoneNumber: $phoneNumber, role: $role, displayName: $displayName, email: $email, profilePhotoUrl: $profilePhotoUrl, licensePhotoUrl: $licensePhotoUrl, driverStatus: $driverStatus, assignedVehicleId: $assignedVehicleId, assignedRouteId: $assignedRouteId, approvedAt: $approvedAt, approvedBy: $approvedBy, rejectionReason: $rejectionReason, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.licensePhotoUrl, licensePhotoUrl) ||
                other.licensePhotoUrl == licensePhotoUrl) &&
            (identical(other.driverStatus, driverStatus) ||
                other.driverStatus == driverStatus) &&
            (identical(other.assignedVehicleId, assignedVehicleId) ||
                other.assignedVehicleId == assignedVehicleId) &&
            (identical(other.assignedRouteId, assignedRouteId) ||
                other.assignedRouteId == assignedRouteId) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    uid,
    phoneNumber,
    role,
    displayName,
    email,
    profilePhotoUrl,
    licensePhotoUrl,
    driverStatus,
    assignedVehicleId,
    assignedRouteId,
    approvedAt,
    approvedBy,
    rejectionReason,
    createdAt,
    lastLoginAt,
    isActive,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String uid,
    required final String phoneNumber,
    required final UserRole role,
    final String? displayName,
    final String? email,
    final String? profilePhotoUrl,
    final String? licensePhotoUrl,
    final DriverStatus? driverStatus,
    final String? assignedVehicleId,
    final String? assignedRouteId,
    final DateTime? approvedAt,
    final String? approvedBy,
    final String? rejectionReason,
    required final DateTime createdAt,
    final DateTime? lastLoginAt,
    final bool isActive,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid;
  @override
  String get phoneNumber;
  @override
  UserRole get role;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  String? get profilePhotoUrl; // Driver-specific fields
  @override
  String? get licensePhotoUrl;
  @override
  DriverStatus? get driverStatus;
  @override
  String? get assignedVehicleId;
  @override
  String? get assignedRouteId;
  @override
  DateTime? get approvedAt;
  @override
  String? get approvedBy;
  @override
  String? get rejectionReason; // Metadata
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  bool get isActive;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
