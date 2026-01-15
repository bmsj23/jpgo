import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User roles in the JeepneyGo system
enum UserRole {
  @JsonValue('driver')
  driver,
  @JsonValue('commuter')
  commuter,
  @JsonValue('admin')
  admin,
}

/// Driver account status
enum DriverStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected,
  @JsonValue('suspended')
  suspended,
}

/// User model representing both drivers and commuters
@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String phoneNumber,
    required UserRole role,
    String? displayName,
    String? email,
    String? profilePhotoUrl,
    
    // Driver-specific fields
    String? licensePhotoUrl,
    DriverStatus? driverStatus,
    String? assignedVehicleId,
    String? assignedRouteId,
    DateTime? approvedAt,
    String? approvedBy,
    String? rejectionReason,
    
    // Metadata
    required DateTime createdAt,
    DateTime? lastLoginAt,
    @Default(true) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
