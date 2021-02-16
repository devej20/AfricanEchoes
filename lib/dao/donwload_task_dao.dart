import 'package:african_echoes/database/database_provider.dart';
import 'package:african_echoes/model/donwload_task_info.dart';

class DownloadTaskDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> insertDownloadTask(DownloadTaskInfo downloadTask) async {
    final db = await dbProvider.database;
    var result = db.insert(tableDownloadTask, downloadTask.toMap());
    return result;
  }

  Future<List<DownloadTaskInfo>> getDownloadTasks() async {
    final db = await dbProvider.database;
    var result = await db.query(tableDownloadTask);
    List<DownloadTaskInfo> downloadTasks = result.isNotEmpty
        ? result.map((a) => DownloadTaskInfo.fromMap(a)).toList()
        : [];

    return downloadTasks;
  }

  Future<int> updateDownloadTask(DownloadTaskInfo downloadTask) async {
    final db = await dbProvider.database;
    var result = await db.update(tableDownloadTask, downloadTask.toMap(),
        where: "$columnDownloadTaskId = ?", whereArgs: [downloadTask.id]);
    return result;
  }

  Future<int> deleteDownloadTask(String id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(tableDownloadTask, where: '_id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllDownloadTasks() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableDownloadTask,
    );

    return result;
  }
}
