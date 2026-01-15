import 'package:flutter_test/flutter_test.dart';

import 'package:jeepneygo_core/jeepneygo_core.dart';

void main() {
  group('JeepneyGo Core Tests', () {
    test('AppConstants should have valid values', () {
      expect(AppConstants.baseFare, greaterThan(0));
      expect(AppConstants.farePerKm, greaterThan(0));
      expect(AppConstants.locationUpdateIntervalSeconds, greaterThan(0));
    });

    test('FirestorePaths should return valid paths', () {
      expect(FirestorePaths.users, equals('users'));
      expect(FirestorePaths.vehicles, equals('vehicles'));
      expect(FirestorePaths.routes, equals('routes'));
    });
  });
}
