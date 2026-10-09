import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('NetPedia welcome screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const NetPediaApp());

    expect(find.text('NetPedia'), findsOneWidget);
    expect(find.text('MULAI BELAJAR'), findsOneWidget);
  });

  testWidgets('term section icon opens its detail popup', (
    WidgetTester tester,
  ) async {
    final term = terms.first;

    await tester.pumpWidget(
      MaterialApp(
        home: TermDetailPage(term: term, isFavorite: false, onFavorite: () {}),
      ),
    );

    final definitionButton = find.byTooltip('Tampilkan Pengertian');
    await tester.ensureVisible(definitionButton);
    await tester.tap(definitionButton);
    await tester.pumpAndSettle();

    final dialog = find.byType(AlertDialog);
    expect(
      find.descendant(of: dialog, matching: find.text('Pengertian')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: dialog, matching: find.text(term.definition)),
      findsOneWidget,
    );
  });
}
