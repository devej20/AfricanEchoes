import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class NewBookState extends Equatable {
  NewBookState();
}

class NewBookLoading extends NewBookState {
  @override
  List<Object> get props => [];
}

class NewBookLoaded extends NewBookState {
  final List<Book> books;

  NewBookLoaded({@required this.books});
  @override
  List<Object> get props => [books];
}

class NewBookError extends NewBookState {
  final String error;

  NewBookError({@required this.error});
  @override
  List<Object> get props => [error];
}
