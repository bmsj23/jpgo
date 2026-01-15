import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:driver_app/main.dart';

void main() {
  testWidgets('Driver app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: DriverApp(),
      ),
    );

    // verify app renders
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
