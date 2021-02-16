import 'package:african_echoes/model/audio_book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AudioState extends Equatable {
  AudioState([List props = const []]) : super();
}

class AudioLoading extends AudioState {
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return "AudioLoading";
  }
}

class AudioLoaded extends AudioState {
  final List<AudioBook> books;

  AudioLoaded([this.books = const []]);

  @override
  List<Object> get props => [books];

  @override
  String toString() {
    return "AudioLoaded";
  }
}

class AudioError extends AudioState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "AudioError";
  }
}
