class Legacy {
  Legacy({
    required this.xlarge,
    required this.xlargewidth,
    required this.xlargeheight,
    required this.thumbnail,
    required this.thumbnailwidth,
    required this.thumbnailheight,
    required this.widewidth,
    required this.wideheight,
    required this.wide,
  });

  final String? xlarge;
  final int? xlargewidth;
  final int? xlargeheight;
  final String? thumbnail;
  final int? thumbnailwidth;
  final int? thumbnailheight;
  final int? widewidth;
  final int? wideheight;
  final String? wide;

  Legacy copyWith({
    String? xlarge,
    int? xlargewidth,
    int? xlargeheight,
    String? thumbnail,
    int? thumbnailwidth,
    int? thumbnailheight,
    int? widewidth,
    int? wideheight,
    String? wide,
  }) {
    return Legacy(
      xlarge: xlarge ?? this.xlarge,
      xlargewidth: xlargewidth ?? this.xlargewidth,
      xlargeheight: xlargeheight ?? this.xlargeheight,
      thumbnail: thumbnail ?? this.thumbnail,
      thumbnailwidth: thumbnailwidth ?? this.thumbnailwidth,
      thumbnailheight: thumbnailheight ?? this.thumbnailheight,
      widewidth: widewidth ?? this.widewidth,
      wideheight: wideheight ?? this.wideheight,
      wide: wide ?? this.wide,
    );
  }

  factory Legacy.fromJson(Map<String, dynamic> json) {
    return Legacy(
      xlarge: json["xlarge"],
      xlargewidth: json["xlargewidth"],
      xlargeheight: json["xlargeheight"],
      thumbnail: json["thumbnail"],
      thumbnailwidth: json["thumbnailwidth"],
      thumbnailheight: json["thumbnailheight"],
      widewidth: json["widewidth"],
      wideheight: json["wideheight"],
      wide: json["wide"],
    );
  }

  Map<String, dynamic> toJson() => {
        "xlarge": xlarge,
        "xlargewidth": xlargewidth,
        "xlargeheight": xlargeheight,
        "thumbnail": thumbnail,
        "thumbnailwidth": thumbnailwidth,
        "thumbnailheight": thumbnailheight,
        "widewidth": widewidth,
        "wideheight": wideheight,
        "wide": wide,
      };
}
