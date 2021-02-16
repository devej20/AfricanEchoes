part of 'download_task_bloc.dart';

abstract class DownloadTaskEvent extends Equatable {
  DownloadTaskEvent();
}

class LoadDownloads extends DownloadTaskEvent {
  @override
  List<Object> get props => [];
}

class AddDownload extends DownloadTaskEvent {
  final Book book;

  AddDownload({@required this.book});

  @override
  List<Object> get props => [book];
}

class UpdateDonwload extends DownloadTaskEvent {
  final DownloadTaskInfo updateBook;

  UpdateDonwload(this.updateBook);
  @override
  List<Object> get props => [updateBook];
}

class RemoveDownload extends DownloadTaskEvent {
  final DownloadTaskInfo removeBook;

  RemoveDownload({@required this.removeBook});

  @override
  List<Object> get props => [removeBook];
}
