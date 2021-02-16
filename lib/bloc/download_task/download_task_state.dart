part of 'download_task_bloc.dart';

abstract class DownloadTaskState extends Equatable {
  DownloadTaskState();
}

class DownloadTaskInitial extends DownloadTaskState {
  @override
  List<Object> get props => [];
}

class DownloadsLoading extends DownloadTaskState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "DownloadsLoading";
  }
}

class DownloadsLoaded extends DownloadTaskState {
  final List<DownloadTaskInfo> downloads;

  DownloadsLoaded({@required this.downloads});

  @override
  List<Object> get props => [downloads];

  @override
  String toString() {
    return "DownloadsLoaded";
  }
}

class DownloadsError extends DownloadTaskState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "DownloadsError";
  }
}
