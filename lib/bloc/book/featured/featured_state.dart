import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class FeaturedState extends Equatable {
  FeaturedState();
}

class FeaturedLoading extends FeaturedState {
  @override
  List<Object> get props => [];
}

class FeaturedLoaded extends FeaturedState {
  final List<Book> books;

  FeaturedLoaded({@required this.books});
  @override
  List<Object> get props => [books];
}

class FeaturedError extends FeaturedState {
  final String error;

  FeaturedError({@required this.error});
  @override
  List<Object> get props => [error];
}
