import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String coverImage;
  final String title;
  final String subTitle;
  final String author;
  final String narrator;
  final String category;
  final String publisher;
  final String language;
  final DateTime releaseDate;
  final String edition;
  final String audioName;
  final String audioFileName;
  final double audioFileSize;
  final String audioUrl;
  final Duration audioDuration;

  Book(
      {this.narrator,
      this.category,
      this.language,
      this.audioName,
      this.audioFileName,
      this.audioFileSize,
      this.id,
      this.audioUrl,
      this.coverImage,
      this.title,
      this.subTitle,
      this.author,
      this.publisher,
      this.releaseDate,
      this.edition,
      this.audioDuration});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      coverImage: json["coverImage"],
      title: json["title"],
      subTitle: json["subTitle"],
      author: json["author"],
      narrator: json["narrator"],
      category: json["category"],
      publisher: json["publisher"],
      language: json["language"],
      audioName: json["audioName"],
      audioFileName: json["audioFileName"],
      audioFileSize: json["audioSize"],
      audioUrl: json["audioUrl"],
      audioDuration: json["audioDuration"],
    );
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
