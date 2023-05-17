import 'package:article_app/models/Legacy.dart';

class Multimedia {
  Multimedia({
    required this.rank,
    required this.subtype,
    required this.caption,
    required this.credit,
    required this.type,
    required this.url,
    required this.height,
    required this.width,
    required this.legacy,
    required this.subType,
    required this.cropName,
  });

  final int? rank;
  final String? subtype;
  final dynamic caption;
  final dynamic credit;
  final String? type;
  final String? url;
  final int? height;
  final int? width;
  final Legacy? legacy;
  final String? subType;
  final String? cropName;

  Multimedia copyWith({
    int? rank,
    String? subtype,
    dynamic? caption,
    dynamic? credit,
    String? type,
    String? url,
    int? height,
    int? width,
    Legacy? legacy,
    String? subType,
    String? cropName,
  }) {
    return Multimedia(
      rank: rank ?? this.rank,
      subtype: subtype ?? this.subtype,
      caption: caption ?? this.caption,
      credit: credit ?? this.credit,
      type: type ?? this.type,
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
      legacy: legacy ?? this.legacy,
      subType: subType ?? this.subType,
      cropName: cropName ?? this.cropName,
    );
  }

  factory Multimedia.fromJson(Map<String, dynamic> json) {
    return Multimedia(
      rank: json["rank"],
      subtype: json["subtype"],
      caption: json["caption"],
      credit: json["credit"],
      type: json["type"],
      url: json["url"],
      height: json["height"],
      width: json["width"],
      legacy: json["legacy"] == null ? null : Legacy.fromJson(json["legacy"]),
      subType: json["subType"],
      cropName: json["crop_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "subtype": subtype,
        "caption": caption,
        "credit": credit,
        "type": type,
        "url": url,
        "height": height,
        "width": width,
        "legacy": legacy?.toJson(),
        "subType": subType,
        "crop_name": cropName,
      };
}
