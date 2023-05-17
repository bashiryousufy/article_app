class Keyword {
  Keyword({
    required this.name,
    required this.value,
    required this.rank,
    required this.major,
  });

  final String? name;
  final String? value;
  final int? rank;
  final String? major;

  Keyword copyWith({
    String? name,
    String? value,
    int? rank,
    String? major,
  }) {
    return Keyword(
      name: name ?? this.name,
      value: value ?? this.value,
      rank: rank ?? this.rank,
      major: major ?? this.major,
    );
  }

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      name: json["name"],
      value: json["value"],
      rank: json["rank"],
      major: json["major"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "rank": rank,
        "major": major,
      };
}
