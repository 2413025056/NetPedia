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

  testWidgets('related terms open their detail and retain favorite actions', (
    WidgetTester tester,
  ) async {
    final term = terms.firstWhere((term) => term.name == 'IP Address');
    final relatedTerm = terms.firstWhere((term) => term.name == 'IPv4');
    final favorites = <String>{};

    for (final term in terms) {
      for (final relatedName in term.relatedTermNames) {
        expect(
          terms.any((candidate) => candidate.name == relatedName),
          isTrue,
          reason: '${term.name} references missing term $relatedName',
        );
      }
    }

    await tester.pumpWidget(
      MaterialApp(
        home: TermDetailPage(
          term: term,
          isFavorite: false,
          onFavorite: () {},
          favorites: favorites,
          onFavoriteByName: (name) {
            if (!favorites.add(name)) favorites.remove(name);
          },
        ),
      ),
    );

    expect(find.text('Tips Belajar'), findsOneWidget);

    final relatedChip = find.widgetWithText(ActionChip, 'IPv4');
    await tester.ensureVisible(relatedChip);
    await tester.tap(relatedChip);
    await tester.pumpAndSettle();

    expect(find.text(relatedTerm.definition), findsOneWidget);
    final favoriteButton = find.text('Simpan ke Favorit');
    await tester.ensureVisible(favoriteButton);
    await tester.tap(favoriteButton);
    await tester.pump();

    expect(favorites, contains('IPv4'));
  });
