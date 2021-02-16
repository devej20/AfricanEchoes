import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FavoritebooksBloc extends Bloc<FavoritebooksEvent, FavoritebooksState> {
  FavoritebooksBloc(FavoritebooksState initialState) : super(initialState);

  FavoritebooksState get initialState => InitialFavoritebooksState();

  @override
  Stream<FavoritebooksState> mapEventToState(
    FavoritebooksEvent event,
  ) async* {
    // ignore: todo
    // TODO: Add Logic
  }
}
