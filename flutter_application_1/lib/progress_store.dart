import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalProgressData {
  final Set<String> favoriteTerms;
  final Set<String> studiedTerms;
  final int bestQuizScore;
  final int totalQuiz;

  const LocalProgressData({
    required this.favoriteTerms,
    required this.studiedTerms,
    required this.bestQuizScore,
    required this.totalQuiz,
  });

  factory LocalProgressData.empty() => LocalProgressData(
    favoriteTerms: {},
    studiedTerms: {},
    bestQuizScore: 0,
    totalQuiz: 0,
  );

  Map<String, Object> toJson() => {
    'version': 1,
    'favoriteTerms': favoriteTerms.toList(),
    'studiedTerms': studiedTerms.toList(),
    'bestQuizScore': bestQuizScore,
    'totalQuiz': totalQuiz,
  };

  factory LocalProgressData.fromJson(Map<String, dynamic> json) {
    if (json['version'] != 1 ||
        json['favoriteTerms'] is! List ||
        json['studiedTerms'] is! List ||
        json['bestQuizScore'] is! int ||
        json['totalQuiz'] is! int) {
      throw const FormatException('Format progress lokal tidak valid.');
    }

    final favoriteTerms = (json['favoriteTerms'] as List).cast<String>();
    final studiedTerms = (json['studiedTerms'] as List).cast<String>();
    final bestQuizScore = json['bestQuizScore'] as int;
    final totalQuiz = json['totalQuiz'] as int;

    if (bestQuizScore < 0 ||
        bestQuizScore > 100 ||
        totalQuiz < 0 ||
        favoriteTerms.toSet().length != favoriteTerms.length ||
        studiedTerms.toSet().length != studiedTerms.length) {
      throw const FormatException('Nilai progress lokal tidak valid.');
    }

    return LocalProgressData(
      favoriteTerms: favoriteTerms.toSet(),
      studiedTerms: studiedTerms.toSet(),
      bestQuizScore: bestQuizScore,
      totalQuiz: totalQuiz,
    );
  }
}

class LocalProgressStore {
  static const _storageKey = 'netpedia.progress.v1';

  final SharedPreferencesAsync _preferences;

  LocalProgressStore({SharedPreferencesAsync? preferences})
    : _preferences = preferences ?? SharedPreferencesAsync();

  Future<LocalProgressData> load() async {
    final encoded = await _preferences.getString(_storageKey);
    if (encoded == null) return LocalProgressData.empty();

    final decoded = jsonDecode(encoded);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Format progress lokal tidak valid.');
    }
    return LocalProgressData.fromJson(decoded);
  }

  Future<void> save(LocalProgressData data) async {
    await _preferences.setString(_storageKey, jsonEncode(data.toJson()));
  }
}
