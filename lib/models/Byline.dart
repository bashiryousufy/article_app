import 'Person.dart';

class Byline {
  Byline({
    required this.original,
    required this.person,
    required this.organization,
  });

  final String? original;
  final List<Person> person;
  final dynamic organization;

  Byline copyWith({
    String? original,
    List<Person>? person,
    dynamic? organization,
  }) {
    return Byline(
      original: original ?? this.original,
      person: person ?? this.person,
      organization: organization ?? this.organization,
    );
  }

  factory Byline.fromJson(Map<String, dynamic> json) {
    return Byline(
      original: json["original"],
      person: json["person"] == null
          ? []
          : List<Person>.from(json["person"]!.map((x) => Person.fromJson(x))),
      organization: json["organization"],
    );
  }

  Map<String, dynamic> toJson() => {
        "original": original,
        "person": person.map((x) => x?.toJson()).toList(),
        "organization": organization,
      };
}
