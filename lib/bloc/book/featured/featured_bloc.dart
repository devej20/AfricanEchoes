import 'dart:async';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'featured_event.dart';
import 'featured_state.dart';

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  final BooksRepository booksRepository;

  FeaturedBloc({@required this.booksRepository}) : super(FeaturedLoading());

  @override
  Stream<FeaturedState> mapEventToState(
    FeaturedEvent event,
  ) async* {
    if (event is FetchBooksByFeatured) {
      yield FeaturedLoading();

      try {
        final books = await booksRepository.getBookByFeatured();

        yield FeaturedLoaded(books: books);
      } catch (e) {
        yield FeaturedError(error: e.toString());
      }
    }
  }
}
