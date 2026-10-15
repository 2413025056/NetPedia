import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  group('NetPedia data integrity', () {
    test('term names are unique identifiers', () {
      final termNames = terms.map((term) => term.name).toList();

      expect(termNames.toSet(), hasLength(termNames.length));
    });

    test('category names are unique and required fields are not empty', () {
      final categoryNames = categories
          .map((category) => category.name)
          .toList();

      expect(categoryNames.toSet(), hasLength(categoryNames.length));
      for (final category in categories) {
        expect(category.name.trim(), isNotEmpty);
        expect(category.description.trim(), isNotEmpty, reason: category.name);
      }
    });

    test('required term fields are not empty', () {
      for (final term in terms) {
        expect(term.name.trim(), isNotEmpty, reason: 'term name');
        expect(term.category.trim(), isNotEmpty, reason: term.name);
        expect(term.definition.trim(), isNotEmpty, reason: term.name);
        expect(term.explanation.trim(), isNotEmpty, reason: term.name);
        expect(term.example.trim(), isNotEmpty, reason: term.name);
      }
    });

    test('every term references a declared category', () {
      final categoryNames = categories.map((category) => category.name).toSet();

      for (final term in terms) {
        expect(categoryNames, contains(term.category), reason: term.name);
      }
    });

    test('every image mapping references a declared term', () {
      final termNames = terms.map((term) => term.name).toSet();

      expect(termPhotoTermNames, isNotEmpty);
      expect(termNames, containsAll(termPhotoTermNames));
    });
  });
}
