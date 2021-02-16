import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  CategoryEvent();
}

class FetchCategory extends CategoryEvent {
  @override
  String toString() {
    return "FetchCategory";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
