class Language {
  final int id;
  final String name;

  Language({
    this.id,
    this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json["id"],
      name: json["name"],
    );
  }
}
