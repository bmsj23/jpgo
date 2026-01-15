// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  uid: json['uid'] as String,
  phoneNumber: json['phoneNumber'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  displayName: json['displayName'] as String?,
  email: json['email'] as String?,
  profilePhotoUrl: json['profilePhotoUrl'] as String?,
  licensePhotoUrl: json['licensePhotoUrl'] as String?,
  driverStatus: $enumDecodeNullable(
    _$DriverStatusEnumMap,
    json['driverStatus'],
  ),
  assignedVehicleId: json['assignedVehicleId'] as String?,
  assignedRouteId: json['assignedRouteId'] as String?,
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  approvedBy: json['approvedBy'] as String?,
  rejectionReason: json['rejectionReason'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'role': _$UserRoleEnumMap[instance.role]!,
      'displayName': instance.displayName,
      'email': instance.email,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'licensePhotoUrl': instance.licensePhotoUrl,
      'driverStatus': _$DriverStatusEnumMap[instance.driverStatus],
      'assignedVehicleId': instance.assignedVehicleId,
      'assignedRouteId': instance.assignedRouteId,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'approvedBy': instance.approvedBy,
      'rejectionReason': instance.rejectionReason,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'isActive': instance.isActive,
    };

const _$UserRoleEnumMap = {
  UserRole.driver: 'driver',
  UserRole.commuter: 'commuter',
  UserRole.admin: 'admin',
};

const _$DriverStatusEnumMap = {
  DriverStatus.pending: 'pending',
  DriverStatus.approved: 'approved',
  DriverStatus.rejected: 'rejected',
  DriverStatus.suspended: 'suspended',
};
