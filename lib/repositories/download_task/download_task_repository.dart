import 'package:african_echoes/dao/donwload_task_dao.dart';
import 'package:african_echoes/model/model.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class DownloadTaskRepository {
  final DownloadTaskDao downloadTaskDao;

  List<DownloadTaskInfo> _downloads = [];
  DownloadTaskInfo downloadTaskInfo;

  DownloadTaskRepository({@required this.downloadTaskDao});

  List<DownloadTaskInfo> get getDownload {
    return List.from(_downloads);
  }

  Future getDownloads() async {
    _downloads = await downloadTaskDao.getDownloadTasks();
  }

  Future addDownload(Book book) async {
    var uuid = Uuid().v1();
    downloadTaskInfo = DownloadTaskInfo.fromBook(book, uuid);
    await downloadTaskDao.insertDownloadTask(downloadTaskInfo);
  }

  Future removeDownload(DownloadTaskInfo book) async {
    await downloadTaskDao.deleteDownloadTask(book.id);
  }

  void clearDownload() {
    downloadTaskDao.deleteAllDownloadTasks();
  }
}
