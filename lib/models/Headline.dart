class Headline {
  Headline({
    required this.main,
    required this.kicker,
    required this.contentKicker,
    required this.printHeadline,
    required this.name,
    required this.seo,
    required this.sub,
  });

  final String? main;
  final String? kicker;
  final dynamic contentKicker;
  final dynamic printHeadline;
  final dynamic name;
  final dynamic seo;
  final dynamic sub;

  Headline copyWith({
    String? main,
    String? kicker,
    dynamic? contentKicker,
    dynamic? printHeadline,
    dynamic? name,
    dynamic? seo,
    dynamic? sub,
  }) {
    return Headline(
      main: main ?? this.main,
      kicker: kicker ?? this.kicker,
      contentKicker: contentKicker ?? this.contentKicker,
      printHeadline: printHeadline ?? this.printHeadline,
      name: name ?? this.name,
      seo: seo ?? this.seo,
      sub: sub ?? this.sub,
    );
  }

  factory Headline.fromJson(Map<String, dynamic> json) {
    return Headline(
      main: json["main"],
      kicker: json["kicker"],
      contentKicker: json["content_kicker"],
      printHeadline: json["print_headline"],
      name: json["name"],
      seo: json["seo"],
      sub: json["sub"],
    );
  }

  Map<String, dynamic> toJson() => {
        "main": main,
        "kicker": kicker,
        "content_kicker": contentKicker,
        "print_headline": printHeadline,
        "name": name,
        "seo": seo,
        "sub": sub,
      };
}
