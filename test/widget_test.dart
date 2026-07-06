// Basic smoke test for the application shell.

import 'package:flutter_test/flutter_test.dart';

import 'package:palette_swap/app/app.dart';

void main() {
  testWidgets('App renders the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PaletteSwapApp());
    await tester.pumpAndSettle();

    expect(find.text('Palette Swap'), findsWidgets);
  });
}
