import 'dart:async';
import 'dart:math';
import 'package:african_echoes/colors.dart';
import 'package:african_echoes/model/audio_book.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

MediaControl playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl skipToNextControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_next',
  label: 'Next',
  action: MediaAction.skipToNext,
);
MediaControl skipToPreviousControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_previous',
  label: 'Previous',
  action: MediaAction.skipToPrevious,
);
MediaControl stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);

class AudioServicePage extends StatefulWidget {
  final AudioBook audioBook;

  const AudioServicePage({Key key, this.audioBook}) : super(key: key);
  @override
  _AudioServicePageState createState() => _AudioServicePageState(audioBook);
}

class _AudioServicePageState extends State<AudioServicePage> {
  bool _loading = false;

  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  _AudioServicePageState(AudioBook audioBook);

  @override
  void initState() {
    AudioService.start(
      backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
      androidNotificationChannelName: 'Afrikan Echoes',
      // Enable this if you want the Android service to exit the foreground state on pause.
      //androidStopForegroundOnPause: true,
      androidNotificationColor: 0xFF2196f3,
      androidNotificationIcon: 'mipmap/ic_launcher',
      androidEnableQueue: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // final String title = widget.audioBook.bookTitle ?? "";
    // final String author = widget.audioBook.bookAuthor ?? "";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Service Demo'),
      ),
      body: Center(
        child: StreamBuilder<ScreenState>(
          stream: _screenStateStream,
          builder: (context, snapshot) {
            final screenState = snapshot.data;
            // ignore: unused_local_variable
            final queue = screenState?.queue;
            final mediaItem = screenState?.mediaItem;
            final state = screenState?.playbackState;
            // ignore: unused_local_variable
            final processingState =
                state?.processingState ?? AudioProcessingState.none;
            final isPlaying = state?.playing ?? false;
            return Container(
              color: colorSecondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildCoverImage(width),
                  _buildCoverText("title", "author"),
                  positionIndicator(mediaItem, state),
                  _buildPlayerControls(isPlaying, mediaItem, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Encapsulate all the different data we're interested in into a single
  /// stream so we don't have to nest StreamBuilders.
  Stream<ScreenState> get _screenStateStream =>
      Rx.combineLatest3<List<MediaItem>, MediaItem, PlaybackState, ScreenState>(
          AudioService.queueStream,
          AudioService.currentMediaItemStream,
          AudioService.playbackStateStream,
          (queue, mediaItem, playbackState) =>
              ScreenState(queue, mediaItem, playbackState));

  _buildCoverImage(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        // width: width - 2 * width * 0.18,
        height: width - width * 0.3,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/african_echoes_logo.jpeg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }

  _buildCoverText(String title, String author) {
    return Expanded(
      child: Center(
        child: Container(
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                child: new Text(
                  title,
                  style: new TextStyle(
                    color: colorControls,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3.0,
                    height: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: new Text(
                  author,
                  style: new TextStyle(
                    color: colorControls,
                    fontSize: 14.0,
                    letterSpacing: 1.8,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 200)),
          (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position =
            snapshot.data ?? state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem?.duration?.inMilliseconds?.toDouble();

        // ignore: unused_local_variable
        String durationText = mediaItem != null
            ? mediaItem?.duration?.toString()?.split('.')?.first
            : '';

        // ignore: unused_local_variable
        String positionText = snapshot.data != null
            ? state.currentPosition.toString().split('.').first
            : '';

        return Column(
          children: [
            if (duration != null)
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: colorControls,
                    inactiveTrackColor: Colors.grey,
                    trackHeight: 3.0,
                    thumbColor: colorControls,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                    overlayColor: Colors.purple.withAlpha(30),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 14)),
                child: Slider(
                  min: 0.0,
                  max: duration,
                  value: seekPos ?? max(0.0, min(position, duration)),
                  onChanged: (value) {
                    _dragPositionSubject.add(value);
                  },
                  onChangeEnd: (value) {
                    AudioService.seekTo(Duration(milliseconds: value.toInt()));
                    // Due to a delay in platform channel communication, there is
                    // a brief moment after releasing the Slider thumb before the
                    // new position is broadcast from the platform side. This
                    // hack is to hold onto seekPos until the next state update
                    // comes through.
                    // ignore: todo
                    // TODO: Improve this code.
                    seekPos = value;
                    _dragPositionSubject.add(null);
                  },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${state.currentPosition.toString().split('.').first}",
                  style: TextStyle(
                      fontSize: 13.0, color: colorControls, letterSpacing: 1.0),
                ),
                Text(
                  "${mediaItem?.duration?.toString()?.split('.')?.first}",
                  style: TextStyle(
                      fontSize: 13.0, color: colorControls, letterSpacing: 1.0),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _buildPlayerControls(bool playing, MediaItem mediaItem, PlaybackState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.repeat_one,
              size: 25,
              color: colorControls,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.replay_10,
              size: 35,
              color: colorControls,
            ),
            onPressed: () => {
              _replay30(mediaItem, state),
            },
          ),
          Container(
            child: Stack(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  splashColor: Colors.transparent,
                  icon: Icon(
                    playing
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 47,
                  ),
                  onPressed: () {
                    playing ? _pause() : _play();
                  },
                ),
                _loading
                    ? Positioned.fill(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.forward_10,
              size: 35,
              color: colorControls,
            ),
            onPressed: () => {
              _forward30(mediaItem, state),
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              size: 25,
              color: colorControls,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  // Request audio play
  _play() {
    // setState(() {
    //   _loading = true;
    // });
    AudioService.play();
  }

  // Request audio pause
  _pause() {
    AudioService.pause();
  }

  // Request audio stop. this will also clear lock screen controls
  // ignore: unused_element
  _stop() {
    AudioService.stop();
  }

  Future<void> _forward30(MediaItem mediaItem, PlaybackState state) async {
    AudioService.fastForward();
    // final playPosition = (currentPlaybackPosition != null &&
    //         duration != null &&
    //         currentPlaybackPosition.inMilliseconds > 0 &&
    //         currentPlaybackPosition.inMilliseconds < duration.inMilliseconds)
    //     ? currentPlaybackPosition
    //     : null;

    // final newPos = playPosition + Duration(seconds: 30);
    // AudioService.seekTo(newPos.inSeconds.toDouble());

    // setState(() {
    //   currentPlaybackPosition = newPos;
    // });
  }

  Future<void> _replay30(MediaItem mediaItem, PlaybackState state) async {
    AudioService.rewind();
    // final playPosition = (currentPlaybackPosition != null &&
    //         duration != null &&
    //         currentPlaybackPosition.inMilliseconds > 0 &&
    //         currentPlaybackPosition.inMilliseconds < duration.inMilliseconds)
    //     ? currentPlaybackPosition
    //     : null;

    // final newPos = playPosition - Duration(seconds: 30);
    // // final seek
    // AudioService.seekTo(newPos.inSeconds.toDouble());

    // setState(() {
    //   currentPlaybackPosition = newPos;
    // });
  }
}

class ScreenState {
  final List<MediaItem> queue;
  final MediaItem mediaItem;
  final PlaybackState playbackState;

  ScreenState(this.queue, this.mediaItem, this.playbackState);
}

// NOTE: Your entrypoint MUST be a top-level function.
void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

// ignore: unused_element
Future<Duration> _audioPlayerDuration() async {
  final player = AudioPlayer();
  var duration = await player.setUrl(
      'http://173.248.135.167/africanechoes/uploads/audios/75d15e9e-49d9-42a6-b428-84b7344621f2_audio_sample_one.mp4');

  return duration;
}

class AudioPlayerTask extends BackgroundAudioTask {
  final Duration duration = Duration();
  final _queue = <MediaItem>[
    MediaItem(
      id: "http://173.248.135.167/africanechoes/uploads/audios/75d15e9e-49d9-42a6-b428-84b7344621f2_audio_sample_one.mp4",
      album: "Science Friday",
      title: "",
      artist: "Science Friday and WNYC Studios",
      // duration: _audioPlayerDuration().then((value) => null),
      artUri:
          "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png",
    ),
  ];
  int _queueIndex = -1;
  AudioPlayer _audioPlayer = new AudioPlayer();
  AudioProcessingState _skipState;
  bool _playing;
  bool _interrupted = false;

  bool get hasNext => _queueIndex + 1 < _queue.length;

  bool get hasPrevious => _queueIndex > 0;

  MediaItem get mediaItem => _queue[_queueIndex];

  StreamSubscription<AudioPlaybackState> _playerStateSubscription;
  StreamSubscription<AudioPlaybackEvent> _eventSubscription;

  @override
  void onStart(Map<String, dynamic> params) {
    _playerStateSubscription = _audioPlayer.playbackStateStream
        .where((state) => state == AudioPlaybackState.completed)
        .listen((state) {
      _handlePlaybackCompleted();
    });
    _eventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      final bufferingState =
          event.buffering ? AudioProcessingState.buffering : null;
      switch (event.state) {
        case AudioPlaybackState.paused:
          _setState(
            processingState: bufferingState ?? AudioProcessingState.ready,
            position: event.position,
          );
          break;
        case AudioPlaybackState.playing:
          _setState(
            processingState: bufferingState ?? AudioProcessingState.ready,
            position: event.position,
          );
          break;
        case AudioPlaybackState.connecting:
          _setState(
            processingState: _skipState ?? AudioProcessingState.connecting,
            position: event.position,
          );
          break;
        default:
          break;
      }
    });

    AudioServiceBackground.setQueue(_queue);
    onSkipToNext();
  }

  void _handlePlaybackCompleted() {
    if (hasNext) {
      onSkipToNext();
    } else {
      onStop();
    }
  }

  void playPause() {
    if (AudioServiceBackground.state.playing)
      onPause();
    else
      onPlay();
  }

  @override
  Future<void> onSkipToNext() => _skip(1);

  @override
  Future<void> onSkipToPrevious() => _skip(-1);

  Future<void> _skip(int offset) async {
    final newPos = _queueIndex + offset;
    if (!(newPos >= 0 && newPos < _queue.length)) return;
    if (_playing == null) {
      // First time, we want to start playing
      _playing = true;
    } else if (_playing) {
      // Stop current item
      await _audioPlayer.stop();
    }
    // Load next item
    _queueIndex = newPos;
    AudioServiceBackground.setMediaItem(mediaItem);
    _skipState = offset > 0
        ? AudioProcessingState.skippingToNext
        : AudioProcessingState.skippingToPrevious;
    await _audioPlayer.setUrl(mediaItem.id);
    _skipState = null;
    // Resume playback if we were playing
    if (_playing) {
      onPlay();
    } else {
      _setState(processingState: AudioProcessingState.ready);
    }
  }

  @override
  void onPlay() {
    if (_skipState == null) {
      _playing = true;
      _audioPlayer.play();
      AudioServiceBackground.sendCustomEvent('just played');
    }
  }

  @override
  void onPause() {
    if (_skipState == null) {
      _playing = false;
      _audioPlayer.pause();
      AudioServiceBackground.sendCustomEvent('just paused');
    }
  }

  @override
  void onSeekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void onClick(MediaButton button) {
    playPause();
  }

  @override
  Future<void> onFastForward() async {
    await _seekRelative(fastForwardInterval);
  }

  @override
  Future<void> onRewind() async {
    await _seekRelative(-rewindInterval);
  }

  Future<void> _seekRelative(Duration offset) async {
    var newPosition = _audioPlayer.playbackEvent.position + offset;
    if (newPosition < Duration.zero) newPosition = Duration.zero;
    if (newPosition > mediaItem.duration) newPosition = mediaItem.duration;
    await _audioPlayer.seek(newPosition);
  }

  @override
  Future<void> onStop() async {
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
    _playing = false;
    _playerStateSubscription.cancel();
    _eventSubscription.cancel();
    await _setState(processingState: AudioProcessingState.stopped);
    // Shut down this task
    await super.onStop();
  }

  /* Handling Audio Focus */
  @override
  void onAudioFocusLost(AudioInterruption interruption) {
    if (_playing) _interrupted = true;
    switch (interruption) {
      case AudioInterruption.pause:
      case AudioInterruption.temporaryPause:
      case AudioInterruption.unknownPause:
        onPause();
        break;
      case AudioInterruption.temporaryDuck:
        _audioPlayer.setVolume(0.5);
        break;
    }
  }

  @override
  void onAudioFocusGained(AudioInterruption interruption) {
    switch (interruption) {
      case AudioInterruption.temporaryPause:
        if (!_playing && _interrupted) onPlay();
        break;
      case AudioInterruption.temporaryDuck:
        _audioPlayer.setVolume(1.0);
        break;
      default:
        break;
    }
    _interrupted = false;
  }

  @override
  void onAudioBecomingNoisy() {
    onPause();
  }

  Future<void> _setState({
    AudioProcessingState processingState,
    Duration position,
    Duration bufferedPosition,
  }) async {
    if (position == null) {
      position = _audioPlayer.playbackEvent.position;
    }
    await AudioServiceBackground.setState(
      controls: getControls(),
      systemActions: [MediaAction.seekTo],
      processingState:
          processingState ?? AudioServiceBackground.state.processingState,
      playing: _playing,
      position: position,
      bufferedPosition: bufferedPosition ?? position,
      speed: _audioPlayer.speed,
    );
  }

  List<MediaControl> getControls() {
    if (_playing) {
      return [
        skipToPreviousControl,
        pauseControl,
        stopControl,
        skipToNextControl
      ];
    } else {
      return [
        skipToPreviousControl,
        playControl,
        stopControl,
        skipToNextControl
      ];
    }
  }
}

/// An object that performs interruptable sleep.
class Sleeper {
  Completer _blockingCompleter;

  /// Sleep for a duration. If sleep is interrupted, a
  /// [SleeperInterruptedException] will be thrown.
  Future<void> sleep([Duration duration]) async {
    _blockingCompleter = Completer();
    if (duration != null) {
      await Future.any([Future.delayed(duration), _blockingCompleter.future]);
    } else {
      await _blockingCompleter.future;
    }
    final interrupted = _blockingCompleter.isCompleted;
    _blockingCompleter = null;
    if (interrupted) {
      throw SleeperInterruptedException();
    }
  }

  /// Interrupt any sleep that's underway.
  void interrupt() {
    if (_blockingCompleter?.isCompleted == false) {
      _blockingCompleter.complete();
    }
  }
}

class SleeperInterruptedException {}
