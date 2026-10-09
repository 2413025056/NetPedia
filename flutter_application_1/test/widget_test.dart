import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('NetPedia welcome screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const NetPediaApp());

    expect(find.text('NetPedia'), findsOneWidget);
    expect(find.text('MULAI BELAJAR'), findsOneWidget);
  });
}
