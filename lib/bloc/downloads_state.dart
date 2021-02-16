import 'package:african_echoes/model/book.dart';
import 'package:equatable/equatable.dart';

abstract class DownloadsState extends Equatable {
  DownloadsState();

  @override
  List<Object> get props => [];
}

class DownloadsLoading extends DownloadsState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "DownloadsLoading";
  }
}

class DownloadsLoaded extends DownloadsState {
  final List<Book> downloads;

  DownloadsLoaded([this.downloads]);

  // DownloadsLoaded({this.downloads});

  @override
  List<Object> get props => [downloads];

  @override
  String toString() {
    return "DownloadsLoaded";
  }
}

class DownloadsError extends DownloadsState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "DownloadsError";
  }
}
