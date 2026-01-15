import 'package:flutter/material.dart';

/// JeepneyGo color palette
/// Based on the design system in docs/08-wireframe-specifications.md
class AppColors {
  AppColors._();

  // ============ PRIMARY COLORS ============
  /// Jeepney Yellow - Primary brand color
  static const Color primary = Color(0xFFFFB800);
  static const Color primaryLight = Color(0xFFFFD54F);
  static const Color primaryDark = Color(0xFFC79100);

  // ============ SECONDARY COLORS ============
  /// Manila Blue - Secondary accent
  static const Color secondary = Color(0xFF0066CC);
  static const Color secondaryLight = Color(0xFF4D94FF);
  static const Color secondaryDark = Color(0xFF004C99);

  // ============ SEMANTIC COLORS ============
  /// Active/Online status
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFE8F5E9);

  /// Warning/Caution
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFF3E0);

  /// Error/Offline
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFFEBEE);

  /// Informational
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFE3F2FD);

  // ============ NEUTRAL COLORS ============
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F0F0);

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFF212121); // Dark text on yellow
  static const Color textOnSecondary = Color(0xFFFFFFFF); // White text on blue

  static const Color divider = Color(0xFFE0E0E0);
  static const Color disabled = Color(0xFFBDBDBD);

  // ============ MAP COLORS ============
  /// Jeepney marker color (matches route)
  static const Color mapMarkerDefault = primary;

  /// Route polyline color
  static const Color mapRouteDefault = secondary;

  /// User location marker
  static const Color mapUserLocation = Color(0xFF4285F4);

  // ============ STATUS INDICATOR COLORS ============
  /// Driver is on trip (broadcasting location)
  static const Color statusOnTrip = success;

  /// Driver is online but not on trip
  static const Color statusOnline = primary;

  /// Driver is offline
  static const Color statusOffline = Color(0xFF9E9E9E);

  // ============ CAPACITY COLORS ============
  /// Low capacity (0-50%)
  static const Color capacityLow = success;

  /// Medium capacity (51-80%)
  static const Color capacityMedium = warning;

  /// High capacity (81-100%)
  static const Color capacityHigh = error;

  // ============ GRADIENT ============
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryLight],
  );
}
