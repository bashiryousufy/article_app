class Person {
  Person({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.qualifier,
    required this.title,
    required this.role,
    required this.organization,
    required this.rank,
  });

  final String? firstname;
  final dynamic middlename;
  final String? lastname;
  final dynamic qualifier;
  final dynamic title;
  final String? role;
  final String? organization;
  final int? rank;

  Person copyWith({
    String? firstname,
    dynamic? middlename,
    String? lastname,
    dynamic? qualifier,
    dynamic? title,
    String? role,
    String? organization,
    int? rank,
  }) {
    return Person(
      firstname: firstname ?? this.firstname,
      middlename: middlename ?? this.middlename,
      lastname: lastname ?? this.lastname,
      qualifier: qualifier ?? this.qualifier,
      title: title ?? this.title,
      role: role ?? this.role,
      organization: organization ?? this.organization,
      rank: rank ?? this.rank,
    );
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstname: json["firstname"],
      middlename: json["middlename"],
      lastname: json["lastname"],
      qualifier: json["qualifier"],
      title: json["title"],
      role: json["role"],
      organization: json["organization"],
      rank: json["rank"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "qualifier": qualifier,
        "title": title,
        "role": role,
        "organization": organization,
        "rank": rank,
      };
}
