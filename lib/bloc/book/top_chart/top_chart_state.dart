import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TopChartState extends Equatable {
  TopChartState();
}

class TopChartLoading extends TopChartState {
  @override
  List<Object> get props => [];
}

class TopChartLoaded extends TopChartState {
  final List<Book> books;

  TopChartLoaded({@required this.books});
  @override
  List<Object> get props => [books];
}

class TopChartError extends TopChartState {
  final String error;

  TopChartError({@required this.error});
  @override
  List<Object> get props => [error];
}
