import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  test('quiz questions are unique and have valid answers and explanations', () {
    final questionTexts = quizQuestions.map((question) => question.question);

    expect(questionTexts.toSet(), hasLength(quizQuestions.length));
    for (final question in quizQuestions) {
      expect(question.options, hasLength(4), reason: question.question);
      expect(
        question.options.toSet(),
        hasLength(question.options.length),
        reason: question.question,
      );
      expect(
        question.correctAnswer,
        inInclusiveRange(0, question.options.length - 1),
        reason: question.question,
      );
      expect(
        question.explanation.trim(),
        isNotEmpty,
        reason: question.question,
      );
    }

    expect(quizQuestions.length, greaterThan(8));
    expect(
      quizQuestions.any((question) => question.question.contains('Kabel STP')),
      isTrue,
    );
    expect(
      quizQuestions.any((question) => question.question.contains('IPv4')),
      isTrue,
    );
    expect(
      quizQuestions.any((question) => question.question.contains('ping')),
      isTrue,
    );
  });

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
        home: SearchPage(favorites: {}, onFavorite: (_) {}, onStudied: (_) {}),
      ),
    );

    final searchField = find.byType(TextField);

    await tester.enterText(searchField, '  rOuTeR  ');
    await tester.pump();
    expect(find.text('Router'), findsOneWidget);

    await tester.enterText(searchField, '  iP   aDdReSs  ');
    await tester.pump();
    expect(find.text('IP Address'), findsOneWidget);

    await tester.enterText(
      searchField,
      '  dYnAmIc   hOsT configuration protocol ',
    );
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
      find.text(
        'Contoh perangkat router yang meneruskan paket data antarjaringan.',
      ),
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

    await tester.scrollUntilVisible(find.text('Tips Belajar'), 250);
    expect(find.text('Tips Belajar'), findsOneWidget);

    final relatedChip = find.widgetWithText(ActionChip, 'IPv4');
    await tester.ensureVisible(relatedChip);
    await tester.tap(relatedChip);
    await tester.pumpAndSettle();

    expect(find.text(relatedTerm.definition), findsOneWidget);
    final favoriteButton = find.text('Simpan ke Favorit');
    await tester.scrollUntilVisible(favoriteButton, 250);
    await tester.tap(favoriteButton);
    await tester.pump();

    expect(favorites, contains('IPv4'));
  });

  testWidgets('missing related terms do not show a broken section', (
    WidgetTester tester,
  ) async {
    final sourceTerm = terms.first;
    final termWithMissingRelations = Term(
      name: 'Istilah Uji',
      abbreviation: '',
      category: sourceTerm.category,
      definition: 'Definisi untuk pengujian.',
      explanation: 'Penjelasan untuk pengujian.',
      example: 'Contoh untuk pengujian.',
      icon: Icons.device_unknown,
      relatedTermNames: ['Tidak Ada', 'Tidak Ada', 'Istilah Uji'],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: TermDetailPage(
          term: termWithMissingRelations,
          isFavorite: false,
          onFavorite: () {},
        ),
      ),
    );

    expect(find.text('Istilah Terkait'), findsNothing);
    expect(find.byType(ActionChip), findsNothing);
  });

  testWidgets('category list and detail share favorite state', (
    WidgetTester tester,
  ) async {
    final term = terms.first;
    final favorites = <String>{};

    await tester.pumpWidget(
      MaterialApp(
        home: CategoryTermsPage(
          category: term.category,
          favorites: favorites,
          onFavorite: (name) {
            if (!favorites.add(name)) favorites.remove(name);
          },
          onStudied: (_) {},
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.bookmark_border_rounded).first);
    await tester.pump();

    expect(favorites, contains(term.name));
    expect(find.byIcon(Icons.bookmark_rounded), findsOneWidget);

    await tester.tap(find.text(term.name).first);
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Hapus dari Favorit'), 250);
    expect(find.text('Hapus dari Favorit'), findsOneWidget);
    await tester.tap(find.text('Hapus dari Favorit'));
    await tester.pump();
    expect(favorites, isNot(contains(term.name)));

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(TermTile).first,
        matching: find.byIcon(Icons.bookmark_border_rounded),
      ),
      findsOneWidget,
    );
  });

  testWidgets('detail favorite action updates its icon and label', (
    WidgetTester tester,
  ) async {
    final term = terms.first;
    final favorites = <String>{};

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

    await tester.tap(find.byIcon(Icons.bookmark_border_rounded).first);
    await tester.pump();

    expect(favorites, contains(term.name));
    await tester.scrollUntilVisible(find.text('Hapus dari Favorit'), 250);
    expect(find.text('Hapus dari Favorit'), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_rounded), findsOneWidget);

    await tester.tap(find.text('Hapus dari Favorit'));
    await tester.pump();

    expect(favorites, isNot(contains(term.name)));
    expect(find.text('Simpan ke Favorit'), findsOneWidget);
    expect(find.byIcon(Icons.bookmark_border_rounded), findsOneWidget);
  });

  testWidgets('progress shows counts and percentage from current state', (
    WidgetTester tester,
  ) async {
    final studiedTerms = <String>{terms.first.name, terms.last.name};

    await tester.pumpWidget(
      MaterialApp(
        home: ProgressPage(
          studiedTerms: studiedTerms,
          favoriteCount: 3,
          bestQuizScore: 85,
          totalQuiz: 2,
        ),
      ),
    );

    final percentage = (studiedTerms.length / terms.length * 100).round();
    expect(
      find.text(
        '${studiedTerms.length} dari ${terms.length} istilah telah dipelajari',
      ),
      findsOneWidget,
    );
    expect(find.text('$percentage%'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('85%'), 250);
    expect(find.text('85%'), findsOneWidget);
    expect(find.text('Belum ada percobaan kuis.'), findsNothing);

    await tester.scrollUntilVisible(find.text('Kategori yang Tersedia'), 250);
    final category = categories.first;
    final studiedInCategory = terms
        .where(
          (term) =>
              term.category == category.name &&
              studiedTerms.contains(term.name),
        )
        .length;
    final totalInCategory = terms
        .where((term) => term.category == category.name)
        .length;
    expect(
      find.text('$studiedInCategory dari $totalInCategory istilah'),
      findsOneWidget,
    );
  });

  testWidgets('progress does not show a fabricated quiz score before a try', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProgressPage(
          studiedTerms: const {},
          favoriteCount: 0,
          bestQuizScore: 0,
          totalQuiz: 0,
        ),
      ),
    );

    expect(
      find.text('0 dari ${terms.length} istilah telah dipelajari'),
      findsOneWidget,
    );
    expect(find.text('0%'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('—'), 250);
    expect(find.text('—'), findsOneWidget);
    expect(find.text('Belum ada percobaan kuis.'), findsOneWidget);
  });

  testWidgets('retry quiz keeps the result callback connected', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    void onFinished(int _) {}

    await tester.pumpWidget(
      MaterialApp(
        home: QuizResultPage(
          score: 80,
          correct: 4,
          total: 5,
          onFinished: onFinished,
          questions: quizQuestions,
        ),
      ),
    );

    await tester.tap(find.text('Coba Latihan Lagi'));
    await tester.pumpAndSettle();

    expect(
      tester.widget<QuizPage>(find.byType(QuizPage)).onFinished,
      same(onFinished),
    );
  });

  testWidgets('quiz result exposes explanations for the questions', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: QuizResultPage(
          score: 80,
          correct: 4,
          total: 5,
          onFinished: (_) {},
          questions: quizQuestions,
        ),
      ),
    );

    await tester.tap(find.text('Lihat Pembahasan'));
    await tester.pumpAndSettle();

    expect(find.text('Pembahasan Soal'), findsOneWidget);
    expect(find.text(quizQuestions.first.explanation), findsOneWidget);
    expect(
      find.text(
        'Jawaban: ${quizQuestions.first.options[quizQuestions.first.correctAnswer]}',
      ),
      findsOneWidget,
    );
  });

  testWidgets('quiz requires answers and preserves them when navigating', (
    WidgetTester tester,
  ) async {
    final scores = <int>[];
    final firstQuestion = quizQuestions.first;
    final firstChoice =
        (firstQuestion.correctAnswer + 1) % firstQuestion.options.length;
    final previousButton = find.ancestor(
      of: find.byIcon(Icons.arrow_back_rounded),
      matching: find.byType(IconButton),
    );
    Future<void> scrollToTop() async {
      await tester.drag(find.byType(ListView), const Offset(0, 2000));
      await tester.pumpAndSettle();
    }

    await tester.pumpWidget(
      MaterialApp(home: QuizPage(onFinished: scores.add)),
    );

    expect(find.text('1/${quizQuestions.length}'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('SOAL BERIKUTNYA'), 250);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(tester.widget<IconButton>(previousButton.first).onPressed, isNull);

    await tester.ensureVisible(find.text(firstQuestion.options[firstChoice]));
    await tester.tap(find.text(firstQuestion.options[firstChoice]));
    await tester.pump();
    await tester.scrollUntilVisible(find.text('SOAL BERIKUTNYA'), 250);
    await tester.tap(find.text('SOAL BERIKUTNYA'));
    await tester.pumpAndSettle();
    await scrollToTop();

    expect(find.text('2/${quizQuestions.length}'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('SOAL BERIKUTNYA'), 250);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );

    await tester.tap(previousButton.first);
    await tester.pump();
    await scrollToTop();
    expect(find.text('1/${quizQuestions.length}'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    await tester.scrollUntilVisible(find.text('SOAL BERIKUTNYA'), 250);
    await tester.tap(find.text('SOAL BERIKUTNYA'));
    await tester.tap(find.text('SOAL BERIKUTNYA'));
    await scrollToTop();
    expect(find.text('2/${quizQuestions.length}'), findsOneWidget);

    for (
      var questionIndex = 1;
      questionIndex < quizQuestions.length;
      questionIndex++
    ) {
      final question = quizQuestions[questionIndex];
      await tester.ensureVisible(
        find.text(question.options[question.correctAnswer]),
      );
      await tester.tap(find.text(question.options[question.correctAnswer]));
      await tester.pump();

      final actionText = questionIndex == quizQuestions.length - 1
          ? 'SELESAI'
          : 'SOAL BERIKUTNYA';
      await tester.ensureVisible(find.text(actionText));
      await tester.tap(find.text(actionText));
      await tester.pumpAndSettle();
    }

    final expectedCorrect = quizQuestions.length - 1;
    final expectedScore = (expectedCorrect / quizQuestions.length * 100)
        .round();
    expect(scores, [expectedScore]);
    expect(find.text('Latihan Selesai!'), findsOneWidget);
    expect(find.text('$expectedCorrect'), findsOneWidget);
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
}
