import 'package:article_app/models/Headline.dart';

class Article {
  Article({
    this.headline,
    this.pubDate,
    this.title,
  });

  final DateTime? pubDate;
  final String? title;
  final Headline? headline;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      headline:
          json["headline"] == null ? null : Headline.fromJson(json["headline"]),
      pubDate: json["pub_date"] == null
          ? DateTime.parse(json["published_date"])
          : DateTime.parse(json["pub_date"]),
      title: json["title"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "headline": headline?.toJson(),
        "pub_date": pubDate,
      };
}
