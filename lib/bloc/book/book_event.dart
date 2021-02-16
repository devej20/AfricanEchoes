import 'package:meta/meta.dart';

abstract class BookEvent {
  BookEvent();
}

class FetchBooks extends BookEvent {
  @override
  String toString() {
    return "FetchBooks";
  }
}

class FetchBooksByCategory extends BookEvent {
  final int categoryId;

  FetchBooksByCategory({@required this.categoryId});

  @override
  String toString() {
    return "FetchBooksByCategory";
  }
}

class FetchBooksByLanguage extends BookEvent {
  final int languageId;

  FetchBooksByLanguage({@required this.languageId});

  @override
  String toString() {
    return "FetchBooksByLanguage";
  }
}
