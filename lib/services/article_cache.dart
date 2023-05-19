import 'dart:convert';

import 'package:article_app/models/Article.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleCache {
  late SharedPreferences? sharedPreferences;

  ArticleCache(this.sharedPreferences);

  Future<List<Article>> getCachedArticles() async {
    try {
      // Check if articles are cached
      if (sharedPreferences!.containsKey('articles')) {
        final String articlesString =
            sharedPreferences!.getString('articles') ?? '';

        final List<dynamic> articles = jsonDecode(articlesString);

        return articles.map((article) => Article.fromJson(article)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  void setCachedArticles(String articles) async {
    try {
      final parsed = jsonDecode(articles)['response']['docs'] as List<dynamic>;

      sharedPreferences!.setString('articles', jsonEncode(parsed));
    } catch (e) {
      print('Error setting cached articles: $e');
    }
  }

  void clearCacheArticles() async {
    try {
      sharedPreferences!.clear();
    } catch (e) {
      print('Error clearing cached articles: $e');
    }
  }
}
