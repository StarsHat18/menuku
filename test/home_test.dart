import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    testWidgets('Should Have Title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: const Text('Food Recipes'),
          ),
        )),
      );
      expect(find.text('Food Recipes'), findsOneWidget);
    });
}
