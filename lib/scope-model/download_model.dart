import 'package:african_echoes/model/model.dart';
// ignore: unused_import
import 'package:african_echoes/repositories/download_task/download_task_repository.dart';
import 'package:scoped_model/scoped_model.dart';

class DownloadsModel extends Model {
  List<DownloadTaskInfo> _donwloadTasks = [];
  DownloadTaskInfo downloadTaskInfo;

  // final DownloadTaskRepository downloadRepository = DownloadTaskRepository();

  List<DownloadTaskInfo> get getDownload {
    return List.from(_donwloadTasks);
  }

  // Future getDownloads() async {
  //   _donwloadTasks = await downloadRepository.getAllDownloadTasks();
  // }

  // Future addDonwload(Book book) async {
  //   // downloadTaskInfo = DownloadTaskInfo.fromBook(book);
  //   await downloadRepository.insertDownloadTask(downloadTaskInfo);
  //   notifyListeners();
  // }

  // void updateDonwload(DownloadTaskInfo book) {
  //   _donwloadTasks.add(book);
  //   notifyListeners();
  // }

  // Future removeDonwload(DownloadTaskInfo book) async {
  //   // _donwloadTasks.removeWhere((download) => download.id == book.id);
  //   await downloadRepository.deleteDownloadTaskById(book.id);
  //   notifyListeners();
  // }

  void clearDonwload() {
    _donwloadTasks.clear();
    notifyListeners();
  }
}
