import 'package:equatable/equatable.dart';

abstract class FavoritebooksState extends Equatable {
  FavoritebooksState();
}

class InitialFavoritebooksState extends FavoritebooksState {
  @override
  List<Object> get props => [];
}
