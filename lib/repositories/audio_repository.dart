import 'package:african_echoes/dao/dao.dart';
import 'package:african_echoes/model/audio_book.dart';

class AudioRepository {
  final audioDao = AudioBookDao();

  List<AudioBook> _audioBooks = [];

  Future<List<AudioBook>> getAllAudios() => audioDao.getAudioBooks();

  audioBookExist(String title) async {
    _audioBooks = await getAllAudios();
    bool isDoesExist = _audioBooks.any((x) => x.bookTitle == title);
    return isDoesExist;
  }

  Future insertAudio(AudioBook audio) async {
    _audioBooks = await getAllAudios();
    // bool isDoesExist = _audioBooks.any((x) => x.audioPath == audio.audioPath);
    // if (!isDoesExist) {
      return audioDao.insertAudioBook(audio);
    // }
  }

  Future updateAudio(AudioBook audio) => audioDao.updateAudio(audio);

  Future deleteAudioById(int id) => audioDao.deleteAudio(id);

  //We are not going to use this in the demo
  Future deleteAllAudios() => audioDao.deleteAllAudios();
}
