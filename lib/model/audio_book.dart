import 'package:african_echoes/model/model.dart';

final String tableAudioBook = 'audio_book';
final String columnAudioBookId = '_id';
final String columnAudioBookBookId = 'book_id';
final String columnAudioBookBookCoverImage = 'book_cover_image';
final String columnAudioBookBookTitle = 'book_title';
final String columnAudioBookBookSubtitle = 'book_subtitle';
final String columnAudioBookBookAuthor = 'book_author';
final String columnAudioBookBookNarrator = 'book_narrator';
final String columnAudioBookBookCategory = 'book_category';
final String columnAudioBookBookPublisher = 'book_publisher';
final String columnAudioBookBookLanguage = 'book_language';
final String columnAudioBookBookReleaseDate = 'book_release_date';
final String columnAudioBookBookEdition = 'book_edition';
final String columnAudioBookAudioDuration = 'audio_duration';
final String columnAudioBookAudioName = 'audio_name';
final String columnAudioBookAudioFileName = 'audio_file_name';
final String columnAudioBookAudioPath = 'audio_path';

class AudioBook {
  final String id;
  final int bookId;
  final String bookCoverImage;
  final String bookTitle;
  final String bookSubtitle;
  final String bookAuthor;
  final String bookNarrator;
  final String bookCategory;
  final String bookPublisher;
  final String bookLanguage;
  final String bookReleaseDate;
  final String bookEdition;
  final String audioPath;
  final Duration audioDuration;
  final String audioName;
  final double audioFileSize;

  AudioBook({
    this.bookNarrator,
    this.bookCategory,
    this.bookLanguage,
    this.audioName,
    this.audioFileSize,
    this.id,
    this.bookId,
    this.bookCoverImage,
    this.bookTitle,
    this.bookSubtitle,
    this.bookAuthor,
    this.bookPublisher,
    this.bookReleaseDate,
    this.bookEdition,
    this.audioDuration,
    this.audioPath,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnAudioBookId: id,
      columnAudioBookBookId: bookId,
      columnAudioBookBookCoverImage: bookCoverImage,
      columnAudioBookBookTitle: bookTitle,
      columnAudioBookBookSubtitle: bookSubtitle,
      columnAudioBookBookAuthor: bookAuthor,
      columnAudioBookBookNarrator: bookNarrator,
      columnAudioBookBookCategory: bookCategory,
      columnAudioBookBookLanguage: bookLanguage,
      columnAudioBookBookPublisher: bookPublisher,
      columnAudioBookBookReleaseDate: bookReleaseDate,
      columnAudioBookBookEdition: bookEdition,
      columnAudioBookAudioDuration: audioDuration,
      columnAudioBookAudioName: audioName,
      columnAudioBookAudioPath: audioPath
    };
    return map;
  }

  factory AudioBook.fromMap(Map<String, dynamic> map) {
    return AudioBook(
      id: map[columnAudioBookId],
      bookId: map[columnAudioBookBookId],
      bookCoverImage: map[columnAudioBookBookCoverImage],
      bookTitle: map[columnAudioBookBookTitle],
      bookSubtitle: map[columnAudioBookBookSubtitle],
      bookAuthor: map[columnAudioBookBookAuthor],
      bookNarrator: map[columnAudioBookBookNarrator],
      bookCategory: map[columnAudioBookBookCategory],
      bookLanguage: map[columnAudioBookBookLanguage],
      bookPublisher: map[columnAudioBookBookPublisher],
      bookReleaseDate: map[columnAudioBookBookReleaseDate],
      bookEdition: map[columnAudioBookBookEdition],
      audioDuration: map[columnAudioBookAudioDuration],
      audioName: map[columnAudioBookAudioName],
      audioPath: map[columnAudioBookAudioPath],
    );
  }

  factory AudioBook.fromTask(
    DownloadTaskInfo task,
    String uuid,
    String path,
  ) {
    return AudioBook(
      id: uuid,
      bookId: task.bookId,
      bookCoverImage: task.bookImage,
      bookTitle: task.bookTitle,
      bookSubtitle: task.bookSubtitle,
      bookAuthor: task.bookAuthor,
      bookNarrator: task.bookNarrator,
      bookCategory: task.bookCategory,
      bookLanguage: task.bookLanguage,
      bookPublisher: task.bookPublisher,
      bookReleaseDate: task.bookReleaseDate,
      bookEdition: task.bookEdition,
      audioDuration: task.audioDuration,
      audioName: task.audioName,
      audioPath: path,
    );
  }
  factory AudioBook.fromBook(
    Book book,
    String uuid,
  ) {
    return AudioBook(
      id: uuid,
      bookId: book.id,
      bookCoverImage: book.coverImage,
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
      audioPath: book.audioUrl,
    );
  }
}
