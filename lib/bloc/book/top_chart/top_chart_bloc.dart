import 'dart:async';
import 'package:african_echoes/bloc/book/top_chart/top_chart_event.dart';
import 'package:african_echoes/bloc/book/top_chart/top_chart_state.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class TopChartBloc extends Bloc<TopChartEvent, TopChartState> {
  final BooksRepository booksRepository;

  TopChartBloc({@required this.booksRepository}) : super(TopChartLoading());

  @override
  Stream<TopChartState> mapEventToState(
    TopChartEvent event,
  ) async* {
    if (event is FetchBooksByTopChart) {
      yield TopChartLoading();

      try {
        final books = await booksRepository.getBookByTopChart();

        yield TopChartLoaded(books: books);
      } catch (e) {
        yield TopChartError(error: e.toString());
      }
    }
  }
}
