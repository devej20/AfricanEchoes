import 'dart:async';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadTaskRepository downloadRepository;

  DownloadsBloc({this.downloadRepository}) : super(null);

  DownloadsState get initialState => DownloadsLoading();

  @override
  Stream<DownloadsState> mapEventToState(DownloadsEvent event) async* {
    if (event is LoadDwonloads) {
      await Future.delayed(Duration(seconds: 5));
      yield* _mapLoadDownloadsToState();
    } else if (event is AddDownload) {
      // yield* _mapAddDownloadToState(event);
    }
    // else if (event is UpdateBook) {
    //   yield* _mapUpdateBookToState(event);
    // }
    else if (event is RemoveDownload) {
      // yield* _mapRemoveDownloadToState(event);
    }
  }

  Stream<DownloadsState> _mapLoadDownloadsToState() async* {
    yield DownloadsLoading();

    // try {
    //   final books = this.downloadRepository.getDownloads;
    //   yield DownloadsLoaded(books);
    // } catch (error) {
    //   yield DownloadsError();
  }
}

// Stream<DownloadsState> _mapAddDownloadToState(AddDownload event) async* {
//   // final currentState = state;
//   print("state1: ${currentState}");
//   // if (currentState is DownloadsLoaded) {
//   print("state2: $currentState");

//   List<Book> updatedDownloads =
//       List.from((currentState as DownloadsLoaded).downloads)..add(event.book);
//   yield DownloadsLoaded(updatedDownloads);
//   _saveBooks(event.book);

//   // }
// }

// Stream<DownloadsState> _mapUpdateBookToState(UpdateBook event) async* {
//   if (currentState is DownloadsLoaded) {
//     _saveBooks(updatedDownloads);
//     final books = this.downloadRepository.getDownloads;
//     yield DownloadsLoaded(books: books);
//   }
// }

// Stream<DownloadsState> _mapRemoveDownloadToState(
//     RemoveDownload event) async* {
//   if (currentState is DownloadsLoaded) {
//     _removeBooks(event.removeBook);
//     final books = this.downloadRepository.getDownloads;
//     yield DownloadsLoaded(books);
//   }
// }

// _saveBooks(Book book) {
//   return downloadRepository.addDonwload(book);
// }

// _removeBooks(Book book) {
//   return downloadRepository.removeDonwload(book);
// }
