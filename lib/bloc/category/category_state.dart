import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CategoryState extends Equatable {
  CategoryState();
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "CategoryLoading";
  }
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({@required this.categories});
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "CategoryLoaded";
  }
}

class CategoryErorr extends CategoryState {
  final String error;

  CategoryErorr({@required this.error});
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "CategoryErorr";
  }
}
