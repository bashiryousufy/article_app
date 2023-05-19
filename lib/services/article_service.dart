import 'dart:convert';
import 'package:article_app/models/Article.dart';
import 'package:article_app/services/article_cache.dart';
import 'package:http/http.dart' as http;
import 'package:article_app/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService {
  String API_URL = '${Config.API_URL}?api-key=${Config.API_KEY}';

  Future<List<Article>> getMostViewedArticles() async {
    try {
      ArticleCache articleCache =
          ArticleCache(await SharedPreferences.getInstance());

      List<Article> articles = await articleCache.getCachedArticles();

      if (articles.isNotEmpty) return articles;

      http.Response response = await http
          .get(Uri.parse(API_URL), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        final data = response.body;

        articleCache.setCachedArticles(data);

        return parseArticles(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Article>> queryArticles(String query) async {
    try {
      if (query.isEmpty) return [];

      http.Response response = await http.get(Uri.parse('$API_URL&q=$query'),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        return parseArticles(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      return [];
    }
  }

  static List<Article> parseArticles(String responseBody) {
    final parsed = jsonDecode(responseBody)['response']['docs']
        .cast<Map<String, dynamic>>();

    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }
}
