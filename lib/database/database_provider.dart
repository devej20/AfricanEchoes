import 'dart:io';
import 'dart:async';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/model/donwload_task_info.dart';
import 'package:african_echoes/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "AfriacnEchoesDb.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  } //This is optional, and only used for changing DB schema migrations

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(
      """create table $tableAudioBook (
        $columnAudioBookId string primary key, 
        $columnAudioBookBookId integer, 
        $columnAudioBookBookCoverImage text, 
        $columnAudioBookBookTitle text, 
        $columnAudioBookBookSubtitle text, 
        $columnAudioBookBookAuthor text, 
        $columnAudioBookBookNarrator text, 
        $columnAudioBookBookCategory text, 
        $columnAudioBookBookPublisher text, 
        $columnAudioBookBookLanguage text, 
        $columnAudioBookBookReleaseDate text, 
        $columnAudioBookBookEdition text, 
        $columnAudioBookAudioDuration text, 
        $columnAudioBookAudioName text, 
        $columnAudioBookAudioFileName text, 
        $columnAudioBookAudioPath text)""",
    );

    await database.execute(
      """create table $tableDownloadTask (
        $columnDownloadTaskId string primary key, 
        $columnDownloadTaskBookId integer , 
        $columnDownloadTaskBookImage text, 
        $columnDownloadTaskBookTitle text, 
        $columnDownloadTaskBookSubtitle text, 
        $columnDownloadTaskBookAuthor text, 
        $columnDownloadTaskBookNarrator text, 
        $columnDownloadTaskBookCategory text, 
        $columnDownloadTaskBookPublisher text, 
        $columnDownloadTaskBookLanguage text, 
        $columnDownloadTaskBookReleaseDate text, 
        $columnDownloadTaskBookEdition text, 
        $columnDownloadTaskAudioLenght text, 
        $columnDownloadTaskAudioName text, 
        $columnDownloadTaskAudioFileName text, 
        $columnDownloadTaskAudioUrl text)""",
    );

    await database.execute('''
        create table $tableUser ( 
        $columnId integer primary key, 
        $columnName text ,
        $columnEmail text ,
        $columnPhoneNumber text ,
        $columnPassword text )
        ''');
  }

  // Future<String> get databasePath async {
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   String dbPath = join(dir.path, "database_audio.db");
  //   return dbPath;
  // }
}
