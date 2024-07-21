import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mutation_test_example/my_app.dart';

void main() {
  testWidgets('When screen shown then initial value is 0',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('When button click then counter incremented',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('When clicking 1 time then "Odd" message is displayed properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that messages are properly displayed
    expect(find.text('Number is Even'), findsNothing);
    expect(find.text('Number is Odd'), findsOneWidget);
  });

  testWidgets('When clicking 2 times then "Even" message is displayed properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that messages are properly displayed
    expect(find.text('Number is Odd'), findsNothing);
    expect(find.text('Number is Even'), findsOneWidget);
  });
}
