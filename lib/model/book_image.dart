class BookImage {
  final int id;
  final String image;
  final String name;
  final String bookTitle;
  final String bookSubtitle;

  BookImage({
    this.id,
    this.image,
    this.name,
    this.bookTitle,
    this.bookSubtitle,
  });

  factory BookImage.fromJson(Map<String, dynamic> json) {
    return BookImage(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      bookTitle: json["bookTitle"],
      bookSubtitle: json["bookSubTitle"],
    );
  }
}
