import 'package:article_app/models/Article.dart';
import 'package:article_app/providers/location_provider.dart';
import 'package:article_app/services/article_service.dart';
import 'package:article_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  final String? query;

  const ArticleScreen({super.key, this.query});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  Future<List<Article>> getArticles() async {
    ArticleService articleService = ArticleService();

    if (widget.query != null && widget.query!.isNotEmpty) {
      return await articleService.queryArticles(widget.query!);
    } else {
      return await articleService.getMostViewedArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LocationAppBar(title: "Articles"),
      ),
      body: FutureBuilder(
        future: getArticles(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Article article = snapshot.data?[index];
                return ListTile(
                  title: Text(article.headline?.main ?? article.title!),
                  subtitle: Text(
                    article.pubDate?.toLocal().toString().substring(0, 19) ??
                        "",
                  ),
                  style: ListTileStyle.drawer,
                );
              },
            );
          }
        },
      ),
    );
  }
}
