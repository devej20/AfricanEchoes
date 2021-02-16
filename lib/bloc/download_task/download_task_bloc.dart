import 'dart:async';

import 'package:african_echoes/model/donwload_task_info.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/download_task/download_task_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'download_task_event.dart';

part 'download_task_state.dart';

class DownloadTaskBloc extends Bloc<DownloadTaskEvent, DownloadTaskState> {
  final DownloadTaskRepository downloadRepository;

  DownloadTaskBloc({@required this.downloadRepository})
      : super(DownloadTaskInitial());

  @override
  Stream<DownloadTaskState> mapEventToState(
    DownloadTaskEvent event,
  ) async* {
    if (event is LoadDownloads) {
      yield DownloadsLoading();

      try {
        await downloadRepository.getDownloads();
        final books = downloadRepository.getDownload;
        yield DownloadsLoaded(downloads: books);
      } catch (error) {
        yield DownloadsError();
      }
    } else if (event is AddDownload) {
      await downloadRepository.addDownload(event.book);
      await downloadRepository.getDownloads();
      final books = downloadRepository.getDownload;
      yield DownloadsLoaded(downloads: books);
    } else if (event is RemoveDownload) {
      // await Future.delayed(Duration(seconds: 2));
      await downloadRepository.removeDownload(event.removeBook);
      await downloadRepository.getDownloads();
      final books = downloadRepository.getDownload;
      yield DownloadsLoaded(downloads: books);
    }
  }
}
