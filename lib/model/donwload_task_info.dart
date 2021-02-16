import 'package:african_echoes/model/model.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

final String tableDownloadTask = 'download_task';
final String columnDownloadTaskId = '_id';
final String columnDownloadTaskBookId = 'book_id';
final String columnDownloadTaskBookImage = 'book_cover_image';
final String columnDownloadTaskBookTitle = 'book_title';
final String columnDownloadTaskBookSubtitle = 'book_subtitle';
final String columnDownloadTaskBookAuthor = 'book_author';
final String columnDownloadTaskBookNarrator = 'book_narrator';
final String columnDownloadTaskBookCategory = 'book_category';
final String columnDownloadTaskBookPublisher = 'book_publisher';
final String columnDownloadTaskBookLanguage = 'book_language';
final String columnDownloadTaskBookReleaseDate = 'book_release_date';
final String columnDownloadTaskBookEdition = 'book_edition';
final String columnDownloadTaskAudioName = 'book_audio_name';
final String columnDownloadTaskAudioFileName = 'audio_file_name';
final String columnDownloadTaskAudioFileSize = 'audio_file_size';
final String columnDownloadTaskAudioLenght = 'audio_duration';
final String columnDownloadTaskAudioUrl = 'audio_url';

class DownloadTaskInfo {
  final String id;
  final int bookId;
  final String bookImage;
  final String bookTitle;
  final String bookSubtitle;
  final String bookAuthor;
  final String bookNarrator;
  final String bookCategory;
  final String bookPublisher;
  final String bookLanguage;
  final String bookReleaseDate;
  final String bookEdition;
  final String audioName;
  final String audioFileName;
  final double audioFileSize;
  final String audioUrl;
  final Duration audioDuration;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  DownloadTaskInfo({
    this.bookId,
    this.bookImage,
    this.bookSubtitle,
    this.bookAuthor,
    this.bookNarrator,
    this.bookCategory,
    this.bookPublisher,
    this.bookLanguage,
    this.bookReleaseDate,
    this.bookEdition,
    this.audioName,
    this.audioFileName,
    this.audioFileSize,
    this.audioDuration,
    this.id,
    this.bookTitle,
    this.audioUrl,
  });

  factory DownloadTaskInfo.fromBook(
    Book book,
    String uuid,
  ) {
    return DownloadTaskInfo(
      id: uuid,
      bookId: book.id,
      bookImage: book.coverImage,
      bookTitle: book.title,
      bookSubtitle: book.subTitle,
      bookAuthor: book.author,
      bookNarrator: book.narrator,
      bookCategory: book.category,
      bookLanguage: book.language,
      bookPublisher: book.publisher,
      bookReleaseDate: book.releaseDate.toString(),
      bookEdition: book.edition,
      audioDuration: book.audioDuration,
      audioName: book.audioName,
      audioFileName: book.audioFileName,
      audioUrl: book.audioUrl,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnDownloadTaskId: id,
      columnDownloadTaskBookId: bookId,
      columnDownloadTaskBookImage: bookImage,
      columnDownloadTaskBookTitle: bookTitle,
      columnDownloadTaskBookSubtitle: bookSubtitle,
      columnDownloadTaskBookAuthor: bookAuthor,
      columnDownloadTaskBookNarrator: bookNarrator,
      columnDownloadTaskBookCategory: bookCategory,
      columnDownloadTaskBookLanguage: bookLanguage,
      columnDownloadTaskBookPublisher: bookPublisher,
      columnDownloadTaskBookReleaseDate: bookReleaseDate,
      columnDownloadTaskBookEdition: bookEdition,
      columnDownloadTaskAudioLenght: audioDuration,
      columnDownloadTaskAudioName: audioName,
      columnDownloadTaskAudioFileName: audioFileName,
      columnDownloadTaskAudioUrl: audioUrl
    };
    return map;
  }

  factory DownloadTaskInfo.fromMap(Map<String, dynamic> map) {
    return DownloadTaskInfo(
      id: map[columnDownloadTaskId],
      bookId: map[columnDownloadTaskBookId],
      bookImage: map[columnDownloadTaskBookImage],
      bookTitle: map[columnDownloadTaskBookTitle],
      bookSubtitle: map[columnDownloadTaskBookSubtitle],
      bookAuthor: map[columnDownloadTaskBookAuthor],
      bookNarrator: map[columnDownloadTaskBookNarrator],
      bookCategory: map[columnDownloadTaskBookCategory],
      bookLanguage: map[columnDownloadTaskBookLanguage],
      bookPublisher: map[columnDownloadTaskBookPublisher],
      bookReleaseDate: map[columnDownloadTaskBookReleaseDate],
      bookEdition: map[columnDownloadTaskBookEdition],
      audioDuration: map[columnDownloadTaskAudioLenght],
      audioName: map[columnDownloadTaskAudioName],
      audioFileName: map[columnDownloadTaskAudioFileName],
      audioUrl: map[columnDownloadTaskAudioUrl],
    );
  }
}
