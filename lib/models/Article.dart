import 'package:article_app/models/Byline.dart';
import 'package:article_app/models/Headline.dart';
import 'package:article_app/models/Keyword.dart';
import 'package:article_app/models/Multimedia.dart';

class Article {
  Article({
    required this.articleAbstract,
    required this.webUrl,
    required this.snippet,
    required this.leadParagraph,
    required this.source,
    required this.multimedia,
    required this.headline,
    required this.keywords,
    required this.pubDate,
    required this.documentType,
    required this.newsDesk,
    required this.sectionName,
    required this.subsectionName,
    required this.byline,
    required this.typeOfMaterial,
    required this.id,
    required this.wordCount,
    required this.uri,
  });

  final String? articleAbstract;
  final String? webUrl;
  final String? snippet;
  final String? leadParagraph;
  final String? source;
  final List<Multimedia> multimedia;
  final Headline? headline;
  final List<Keyword> keywords;
  final String? pubDate;
  final String? documentType;
  final String? newsDesk;
  final String? sectionName;
  final String? subsectionName;
  final Byline? byline;
  final String? typeOfMaterial;
  final String? id;
  final int? wordCount;
  final String? uri;

  Article copyWith({
    String? articleAbstract,
    String? webUrl,
    String? snippet,
    String? leadParagraph,
    String? source,
    List<Multimedia>? multimedia,
    Headline? headline,
    List<Keyword>? keywords,
    String? pubDate,
    String? documentType,
    String? newsDesk,
    String? sectionName,
    String? subsectionName,
    Byline? byline,
    String? typeOfMaterial,
    String? id,
    int? wordCount,
    String? uri,
  }) {
    return Article(
      articleAbstract: articleAbstract ?? this.articleAbstract,
      webUrl: webUrl ?? this.webUrl,
      snippet: snippet ?? this.snippet,
      leadParagraph: leadParagraph ?? this.leadParagraph,
      source: source ?? this.source,
      multimedia: multimedia ?? this.multimedia,
      headline: headline ?? this.headline,
      keywords: keywords ?? this.keywords,
      pubDate: pubDate ?? this.pubDate,
      documentType: documentType ?? this.documentType,
      newsDesk: newsDesk ?? this.newsDesk,
      sectionName: sectionName ?? this.sectionName,
      subsectionName: subsectionName ?? this.subsectionName,
      byline: byline ?? this.byline,
      typeOfMaterial: typeOfMaterial ?? this.typeOfMaterial,
      id: id ?? this.id,
      wordCount: wordCount ?? this.wordCount,
      uri: uri ?? this.uri,
    );
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleAbstract: json["abstract"],
      webUrl: json["web_url"],
      snippet: json["snippet"],
      leadParagraph: json["lead_paragraph"],
      source: json["source"],
      multimedia: json["multimedia"] == null
          ? []
          : List<Multimedia>.from(
              json["multimedia"]!.map((x) => Multimedia.fromJson(x))),
      headline:
          json["headline"] == null ? null : Headline.fromJson(json["headline"]),
      keywords: json["keywords"] == null
          ? []
          : List<Keyword>.from(
              json["keywords"]!.map((x) => Keyword.fromJson(x))),
      pubDate: json["pub_date"],
      documentType: json["document_type"],
      newsDesk: json["news_desk"],
      sectionName: json["section_name"],
      subsectionName: json["subsection_name"],
      byline: json["byline"] == null ? null : Byline.fromJson(json["byline"]),
      typeOfMaterial: json["type_of_material"],
      id: json["_id"],
      wordCount: json["word_count"],
      uri: json["uri"],
    );
  }

  Map<String, dynamic> toJson() => {
        "abstract": articleAbstract,
        "web_url": webUrl,
        "snippet": snippet,
        "lead_paragraph": leadParagraph,
        "source": source,
        "multimedia": multimedia.map((x) => x?.toJson()).toList(),
        "headline": headline?.toJson(),
        "keywords": keywords.map((x) => x?.toJson()).toList(),
        "pub_date": pubDate,
        "document_type": documentType,
        "news_desk": newsDesk,
        "section_name": sectionName,
        "subsection_name": subsectionName,
        "byline": byline?.toJson(),
        "type_of_material": typeOfMaterial,
        "_id": id,
        "word_count": wordCount,
        "uri": uri,
      };
}
