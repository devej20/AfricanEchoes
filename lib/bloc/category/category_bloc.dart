import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './category.dart';
import '../../repositories/repositories.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategorysRepository categorysRepository;

  CategoryBloc({@required this.categorysRepository}) : super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is FetchCategory) {
      yield CategoryLoading();

      try {
        final categories = await categorysRepository.getCategory();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        yield CategoryErorr(error: e.toString());
      }
    }
  }
}
