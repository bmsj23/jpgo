import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

/// Service for handling location operations
class LocationService {
  /// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  /// Check and request location permission
  Future<LocationPermission> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    
    return permission;
  }

  /// Get current position
  Future<Position> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    return Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: accuracy),
    );
  }

  /// Stream position updates
  Stream<Position> getPositionStream({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10, // meters
    Duration? interval,
  }) {
    late LocationSettings settings;
    
    // Use platform-specific settings for better battery performance
    settings = LocationSettings(
      accuracy: accuracy,
      distanceFilter: distanceFilter,
    );

    return Geolocator.getPositionStream(locationSettings: settings);
  }

  /// Calculate distance between two points in meters
  double calculateDistance({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }

  /// Calculate bearing between two points
  double calculateBearing({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    return Geolocator.bearingBetween(startLat, startLng, endLat, endLng);
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return Geolocator.openLocationSettings();
  }

  /// Open app settings
  Future<bool> openAppSettings() async {
    return Geolocator.openAppSettings();
  }
}

/// Provider for LocationService
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// Provider for current position (one-time)
final currentPositionProvider = FutureProvider<Position>((ref) async {
  final service = ref.read(locationServiceProvider);
  return service.getCurrentPosition();
});

/// Provider for position stream
final positionStreamProvider = StreamProvider<Position>((ref) {
  final service = ref.read(locationServiceProvider);
  return service.getPositionStream(
    distanceFilter: 10, // Update every 10 meters
  );
});
