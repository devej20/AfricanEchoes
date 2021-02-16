part of 'book_images_bloc.dart';

abstract class BookImagesEvent extends Equatable {
  BookImagesEvent();
}

class FetchBookImages extends BookImagesEvent {
  @override
  String toString() {
    return "FetchBookImages";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
