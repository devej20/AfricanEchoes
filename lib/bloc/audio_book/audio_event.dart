import 'package:african_echoes/model/audio_book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AudioEvent extends Equatable {
  AudioEvent([List props = const []]) : super();
}

class LoadAudios extends AudioEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "LoadAudios";
  }
}

class AddAudio extends AudioEvent {
  final AudioBook book;

  AddAudio(this.book) : super([book]);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "AddAudio";
  }
}

class UpdateAudio extends AudioEvent {
  final AudioBook updateAudio;

  UpdateAudio(this.updateAudio) : super([updateAudio]);

  @override
  String toString() {
    return "UpdateAudio";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class DeleteAudio extends AudioEvent {
  final AudioBook book;

  DeleteAudio(this.book) : super([book]);

  @override
  String toString() {
    return "DeleteAudio";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
