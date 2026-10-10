import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('NetPedia welcome screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const NetPediaApp());

    expect(find.text('NetPedia'), findsOneWidget);
    expect(find.text('MULAI BELAJAR'), findsOneWidget);
  });

  testWidgets('categories show data-based descriptions and counts', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(400, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: CategoriesPage(
          favorites: {},
          onFavorite: (_) {},
          onStudied: (_) {},
        ),
      ),
    );

    for (final category in categories) {
      final count = terms
          .where((term) => term.category == category.name)
          .length;
      expect(find.text(category.description), findsOneWidget);
      expect(find.text('$count materi istilah'), findsOneWidget);
    }

    await tester.tap(find.text(categories.first.name).first);
    await tester.pumpAndSettle();
    expect(find.text('Materi ${categories.first.name}'), findsOneWidget);
    expect(
      find.text(
        '${terms.where((term) => term.category == categories.first.name).length} istilah tersedia untuk dipelajari.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('search matches normalized term fields and shows empty state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SearchPage(
          favorites: {},
          onFavorite: (_) {},
          onStudied: (_) {},
        ),
      ),
    );

    final searchField = find.byType(TextField);

    await tester.enterText(searchField, '  rOuTeR  ');
    await tester.pump();
    expect(find.text('Router'), findsOneWidget);

    await tester.enterText(searchField, '  iP   aDdReSs  ');
    await tester.pump();
    expect(find.text('IP Address'), findsOneWidget);

    await tester.enterText(searchField, '  dYnAmIc   hOsT configuration protocol ');
    await tester.pump();
    expect(find.text('DHCP'), findsOneWidget);

    await tester.enterText(
      searchField,
      'PERANGKAT   JARINGAN YANG MENGHUBUNGKAN JARINGAN YANG BERBEDA',
    );
    await tester.pump();
    expect(find.text('Router'), findsOneWidget);

    await tester.enterText(searchField, 'pemecahan   masalah jaringan');
    await tester.pump();
    expect(find.text('Ping'), findsOneWidget);

    await tester.enterText(searchField, '  Keamanan   JARINGAN ');
    await tester.pump();
    expect(find.text('Firewall'), findsOneWidget);

    await tester.enterText(searchField, 'kata kunci yang tidak tersedia');
    await tester.pump();
    expect(find.text('Istilah tidak ditemukan'), findsOneWidget);
    expect(find.text('Coba gunakan kata kunci lain.'), findsOneWidget);
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
    expect(
      find.text('Contoh perangkat router yang meneruskan paket data antarjaringan.'),
      findsOneWidget,
    );
  });

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

  testWidgets('all term images stay contained in the mobile detail frame', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    for (final term in terms) {
      await tester.pumpWidget(
        MaterialApp(
          home: TermDetailPage(
            term: term,
            isFavorite: false,
            onFavorite: () {},
          ),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull, reason: term.name);

      final frame = find.byType(ClipRRect).first;
      final frameSize = tester.getSize(frame);
      expect(frameSize.width, 280, reason: term.name);
      expect(frameSize.height, 190, reason: term.name);

      final images = find.byType(Image);
      if (images.evaluate().isNotEmpty) {
        expect(tester.widget<Image>(images.first).fit, BoxFit.contain);
      }
    }
  });
