import 'dart:convert';
import 'package:article_app/models/Article.dart';
import 'package:article_app/services/cache_service.dart';
import 'package:http/http.dart' as http;
import 'package:article_app/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService {
  String SEARCH_API_URL = '${Config.SEARCH_API_URL}?api-key=${Config.API_KEY}';
  String MOSTVIEWED_API_URL =
      '${Config.MOSTVIEWED_API_URL}?api-key=${Config.API_KEY}';

  Future<List<Article>> getMostViewedArticles() async {
    try {
      CacheService articleCache =
          CacheService(await SharedPreferences.getInstance());

      List<Article> articles = await articleCache.getCachedArticles();

      if (articles.isNotEmpty) return articles;

      http.Response response = await http.get(Uri.parse(MOSTVIEWED_API_URL),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body)['results'];

        articleCache.setCachedArticles(response.body);

        return parsed.map<Article>((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Article>> queryArticles(String query) async {
    try {
      if (query.isEmpty) return [];

      http.Response response = await http.get(
          Uri.parse('$SEARCH_API_URL&q=$query'),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body)['response']['docs']
            .cast<Map<String, dynamic>>();

        return parsed.map<Article>((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return [];
    }
  }
}
