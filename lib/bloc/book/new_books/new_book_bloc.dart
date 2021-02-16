import 'dart:async';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'new_book_event.dart';
import 'new_book_state.dart';

class NewBookBloc extends Bloc<NewBookEvent, NewBookState> {
  final BooksRepository booksRepository;

  NewBookBloc({@required this.booksRepository}) : super(NewBookLoading());

  @override
  Stream<NewBookState> mapEventToState(
    NewBookEvent event,
  ) async* {
    if (event is FetchBooksByNewBook) {
      yield NewBookLoading();

      try {
        final books = await booksRepository.getBookByNew();

        yield NewBookLoaded(books: books);
      } catch (e) {
        yield NewBookError(error: e.toString());
      }
    }
  }
}
