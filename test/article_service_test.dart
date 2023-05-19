import 'dart:convert';

import 'package:article_app/models/Article.dart';
import 'package:article_app/services/cache_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:article_app/services/article_service.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('ArticleService', () {
    late MockSharedPreferences mockSharedPreferences;
    late ArticleService articleService;
    late CacheService articleCache;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      articleCache = CacheService(mockSharedPreferences);
      articleService = ArticleService();
    });

    group('getMostViewedArticles', () {
      test('should return cached articles if available', () async {
        final result = await articleService.getMostViewedArticles();

        final cachedArticles = await articleCache.getCachedArticles();

        expect(result, equals(cachedArticles));
      });

      test('should fetch articles from the API if not cached', () async {
        SharedPreferences.setMockInitialValues({});

        final result = await articleService.getMostViewedArticles();

        expect(result.length, greaterThan(0));
      });
    });

    group('queryArticles', () {
      test('should fetch articles based on the query', () async {
        const String query = "foods";

        List<Article> articles = await articleService.queryArticles(query);

        expect(articles.length, greaterThanOrEqualTo(0));
      });

      test('should return an empty list if query is empty', () async {
        const String query = "";

        List<Article> articles = await articleService.queryArticles(query);

        expect(articles.length, equals(0));
      });
    });
  });
}
