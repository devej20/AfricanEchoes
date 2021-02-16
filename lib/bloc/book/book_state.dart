import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BookState extends Equatable {
  BookState();
}

class BookLoading extends BookState {
  @override
  List<Object> get props => [];
}

class BookLoaded extends BookState {
  final List<Book> books;

  BookLoaded({@required this.books});
  @override
  List<Object> get props => [books];
}

class BookError extends BookState {
  final String error;

  BookError({@required this.error});
  @override
  List<Object> get props => [error];
}

class BookTopChartLoading extends BookState {
  @override
  List<Object> get props => [];
}

class BookTopChartLoaded extends BookState {
  final List<Book> books;

  BookTopChartLoaded({@required this.books});
  @override
  List<Object> get props => [books];
}

class BookTopChartError extends BookState {
  final String error;

  BookTopChartError({@required this.error});
  @override
  List<Object> get props => [error];
}
