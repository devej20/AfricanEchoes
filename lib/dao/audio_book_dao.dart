import 'package:african_echoes/database/database_provider.dart';
import 'package:african_echoes/model/audio_book.dart';

class AudioBookDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> insertAudioBook(AudioBook audio) async {
    final db = await dbProvider.database;
    var result = db.insert(tableAudioBook, audio.toMap());
    return result;
  }

  Future<List<AudioBook>> getAudioBooks() async {
    final db = await dbProvider.database;
    var result = await db.query(tableAudioBook);
    List<AudioBook> audios = result.isNotEmpty
        ? result.map((a) => AudioBook.fromMap(a)).toList()
        : [];

    return audios;
  }

  Future<int> updateAudio(AudioBook audio) async {
    final db = await dbProvider.database;
    var result = await db.update(tableAudioBook, audio.toMap(),
        where: "$columnAudioBookId = ?", whereArgs: [audio.id]);
    return result;
  }

  Future<int> deleteAudio(int id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(tableAudioBook, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllAudios() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableAudioBook,
    );

    return result;
  }
}
