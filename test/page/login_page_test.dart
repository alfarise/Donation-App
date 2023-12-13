import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/login_page.dart';

void main() {
  testWidgets('Login Page UI elements', (WidgetTester tester) async {
    // Build the Login Page widget
    await tester.pumpWidget(LoginPage());
    // Verify if the app title is displayed
    expect(find.text('Login'), findsAny);
    // Verify if the TextField is displayed
    expect(find.byType(TextField), findsAny);
    // Verify if the FloatingActionButton is displayed
    expect(find.byType(ElevatedButton), findsAny);
  });
  // testWidgets('Adding and removing todos', (WidgetTester tester) async {
  //   // Build the Login Page widget
  //   await tester.pumpWidget(LoginPage());
  //   // Add a login
  //   await tester.enterText(find.byType(TextField), 'admin@mail.com');
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pump();
  //   // Verify if the added login is displayed
  //   // expect(find.text('Test Login Page'), findsOneWidget);
  //   // Swipe to delete the login
  //   // await tester.drag(find.text('Test Login Page'), const Offset(500.0, 0.0));
  //   // await tester.pumpAndSettle();
  //   // Verify if the login is removed
  //   // expect(find.text('Test Login Page'), findsNothing);
  // });
}
