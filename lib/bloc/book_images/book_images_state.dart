part of 'book_images_bloc.dart';

abstract class BookImagesState extends Equatable {
  BookImagesState();
}

class BookImagesInitial extends BookImagesState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "BookImagesInitial";
  }
}

class BookImagesLoading extends BookImagesState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "BookImagesLoading";
  }
}

class BookImagesLoaded extends BookImagesState {
  final List<BookImage> images;

  BookImagesLoaded({@required this.images});
  @override
  List<Object> get props => [images];

  @override
  String toString() {
    return "BookImagesLoaded";
  }
}

class BookImagesError extends BookImagesState {
  final String error;

  BookImagesError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "BookImagesError";
  }
}
