import 'dart:async';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BooksRepository booksRepository;

  BookBloc({@required this.booksRepository}) : super(BookLoading());

  @override
  Stream<BookState> mapEventToState(
    BookEvent event,
  ) async* {
    if (event is FetchBooks) {
      yield BookLoading();

      try {
        final books = await booksRepository.getBook();
        yield BookLoaded(books: books);
      } catch (e) {
        yield BookError(error: e.toString());
      }
    }

    if (event is FetchBooksByCategory) {
      yield BookLoading();

      try {
        final books = await booksRepository.getBookByCategory(
            categoryId: event.categoryId);
        yield BookLoaded(books: books);
      } catch (e) {
        yield BookError(error: e.toString());
      }
    }

    if (event is FetchBooksByLanguage) {
      yield BookLoading();

      try {
        final books = await booksRepository.getBookByLanguage(
            languageId: event.languageId);
        yield BookLoaded(books: books);
      } catch (e) {
        yield BookError(error: e.toString());
      }
    }
  }
}
