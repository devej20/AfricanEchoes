import 'dart:async';

import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/book_image/book_image.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'book_images_event.dart';
part 'book_images_state.dart';

class BookImagesBloc extends Bloc<BookImagesEvent, BookImagesState> {
  final BookImageRepository bookImageRepository;

  BookImagesBloc({@required this.bookImageRepository})
      : assert(bookImageRepository != null),
        super(BookImagesInitial());

  @override
  Stream<BookImagesState> mapEventToState(
    BookImagesEvent event,
  ) async* {
    if (event is FetchBookImages) {
      yield BookImagesLoading();
      try {
        final images = await bookImageRepository.getBookImages();
        yield BookImagesLoaded(images: images);
      } catch (e) {
        yield BookImagesError(error: e.toString());
      }
    }
  }
}
