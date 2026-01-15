import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:jeepneygo_ui/jeepneygo_ui.dart';

void main() {
  group('JeepneyGo UI Tests', () {
    test('AppColors should have valid color values', () {
      expect(AppColors.primary, isA<Color>());
      expect(AppColors.secondary, isA<Color>());
      expect(AppColors.background, isA<Color>());
    });

    test('AppSpacing should have valid spacing values', () {
      expect(AppSpacing.xs, greaterThan(0));
      expect(AppSpacing.sm, greaterThan(AppSpacing.xs));
      expect(AppSpacing.md, greaterThan(AppSpacing.sm));
    });

    testWidgets('PrimaryButton renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              label: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });
  });
}
