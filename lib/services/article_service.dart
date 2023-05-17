import 'dart:convert';
import 'package:article_app/models/Article.dart';
import 'package:http/http.dart' as http;
import 'package:article_app/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService {
  static Future<List<Article>> getMostViewedArticles() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Check if articles are cached
      if (prefs.containsKey('articles')) {
        final String articlesString = prefs.getString('articles') ?? '';

        final List<dynamic> articles = jsonDecode(articlesString);

        return articles.map((article) => Article.fromJson(article)).toList();
      }

      List<Article> articles = [];

      final String url =
          '${Config.API_URL}?api-key=${Config.API_KEY}&offset=0&limit=20';

      http.Response response = await http
          .get(Uri.parse(url), headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<dynamic> articleList = data['response']['docs'];

        articles =
            articleList.map((article) => Article.fromJson(article)).toList();

        prefs.setString('articles', jsonEncode(articleList));
      }

      return articles;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
