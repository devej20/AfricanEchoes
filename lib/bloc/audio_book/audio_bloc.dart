import 'dart:async';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/repositories/audio_repository.dart';

class AudioBloc {
  final AudioRepository _audioRepository = AudioRepository();

  final StreamController<List<AudioBook>> _audioController =
      StreamController<List<AudioBook>>.broadcast();

  get audios => _audioController.stream;

  AudioBloc() {
    getAudios();
  }

  getAudios() async {
    _audioController.sink.add(await _audioRepository.getAllAudios());
  }

  addAudio(AudioBook audio) async {
    await _audioRepository.insertAudio(audio);
    getAudios();
  }

  updateAudio(AudioBook audio) async {
    await _audioRepository.updateAudio(audio);
    getAudios();
  }

  deleteAudioById(int id) async {
    _audioRepository.deleteAudioById(id);
    getAudios();
  }

  deleteAllAudio() async {
    _audioRepository.deleteAllAudios();
    getAudios();
  }

  dispose() {
    _audioController.close();
  }
}
