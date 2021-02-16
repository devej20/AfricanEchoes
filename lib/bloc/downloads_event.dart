import 'package:african_echoes/model/model.dart';
import 'package:equatable/equatable.dart';

abstract class DownloadsEvent extends Equatable {
  DownloadsEvent();
  @override
  List<Object> get props => [];
}

class LoadDwonloads extends DownloadsEvent {
  @override
  List<Object> get props => [];
}

class AddDownload extends DownloadsEvent {
  final Book book;

  AddDownload(this.book);

  @override
  List<Object> get props => [book];
}

class UpdateDonwload extends DownloadsEvent {
  final Book updateBook;

  UpdateDonwload(this.updateBook);
  @override
  List<Object> get props => [updateBook];
}

class RemoveDownload extends DownloadsEvent {
  final Book removeBook;

  RemoveDownload(this.removeBook);

  @override
  List<Object> get props => [removeBook];
}
