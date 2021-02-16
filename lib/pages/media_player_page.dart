import 'package:flutter/material.dart';
import 'package:flutter_playout/audio.dart';
import 'package:flutter_playout/player_observer.dart';
import 'package:flutter_playout/player_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../model/audio_book.dart';

class MediaPlayerPage extends StatefulWidget {
  final AudioBook audioBook;

  final PlayerState desiredState = PlayerState.PLAYING;

  const MediaPlayerPage({
    Key key,
    @required this.audioBook,
  }) : super(key: key);

  @override
  _MediaPlayerPageState createState() => _MediaPlayerPageState();
}

class _MediaPlayerPageState extends State<MediaPlayerPage> with PlayerObserver {
  Audio _audioPlayer;
  PlayerState audioPlayerState = PlayerState.STOPPED;
  bool _loading = false;
  // ignore: unused_field
  bool _isLive = false;

  Duration duration = Duration(milliseconds: 1);
  Duration currentPlaybackPosition = Duration.zero;

  get isPlaying => audioPlayerState == PlayerState.PLAYING;
  get isPaused =>
      audioPlayerState == PlayerState.PAUSED ||
      audioPlayerState == PlayerState.STOPPED;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText => currentPlaybackPosition != null
      ? currentPlaybackPosition.toString().split('.').first
      : '';

  @override
  void initState() {
    super.initState();

    // Init audio player with a callback to handle events
    _audioPlayer = Audio.instance();

    // Listen for audio player events
    listenForAudioPlayerEvents();
  }

  @override
  void didUpdateWidget(MediaPlayerPage oldWidget) {
    if (oldWidget.desiredState != widget.desiredState) {
      _onDesiredStateChanged(oldWidget);
    } else if (oldWidget.audioBook.audioPath != widget.audioBook.audioPath) {
      _play();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// The [desiredState] flag has changed so need to update playback to
  /// reflect the new state.
  void _onDesiredStateChanged(MediaPlayerPage oldWidget) async {
    switch (widget.desiredState) {
      case PlayerState.PLAYING:
        _play();
        break;
      case PlayerState.PAUSED:
        _pause();
        break;
      case PlayerState.STOPPED:
        _stop();
        break;
    }
  }

  @override
  void onPlay() {
    setState(() {
      audioPlayerState = PlayerState.PLAYING;
      _loading = false;
    });
  }

  @override
  void onPause() {
    setState(() {
      audioPlayerState = PlayerState.PAUSED;
    });
  }

  @override
  void onComplete() {
    setState(() {
      audioPlayerState = PlayerState.PAUSED;
      currentPlaybackPosition = Duration.zero;
    });
  }

  @override
  void onTime(int position) {
    setState(() {
      currentPlaybackPosition = Duration(seconds: position);
    });
  }

  @override
  void onSeek(int position, double offset) {
    super.onSeek(position, offset);
  }

  @override
  void onDuration(int duration) {
    if (duration <= 0) {
      setState(() {
        _isLive = true;
      });
    } else {
      setState(() {
        _isLive = false;
        this.duration = Duration(milliseconds: duration);
      });
    }
  }

  @override
  void onError(String error) {
    super.onError(error);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final String title = widget.audioBook.bookTitle ?? "";
    // final String author = widget.audioBook.bookAuthor ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.ubuntu(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        // color: colorSecondary.withOpacity(0.8),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildCoverImage(width),
            // _buildCoverText(title, author),
            _playbackPosition(context),
            _buildPlayerControls(),
            _buildSaveOptions(),
          ],
        ),
      ),
    );
  }

  _buildCoverImage(double width) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: width - width * 0.35,
        child: Image.network(
          widget.audioBook.bookCoverImage,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  // _buildCoverText(String title, String author) {
  //   return Expanded(
  //     child: Center(
  //       child: Container(
  //         // color: Colors.red,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Padding(
  //               padding:
  //                   const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
  //               child: new Text(
  //                 title,
  //                 style: new TextStyle(
  //                   color: colorControls,
  //                   fontSize: 17.5,
  //                   fontWeight: FontWeight.w700,
  //                   letterSpacing: 3.0,
  //                   height: 1.5,
  //                 ),
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             GestureDetector(
  //               onTap: () {},
  //               child: new Text(
  //                 author,
  //                 style: new TextStyle(
  //                   color: colorControls,
  //                   fontSize: 14.0,
  //                   letterSpacing: 1.8,
  //                   height: 1.5,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  _playbackPosition(BuildContext context) {
    return Column(
      children: <Widget>[
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
            activeColor: Colors.white,
            value: currentPlaybackPosition?.inMilliseconds?.toDouble() ?? 0.0,
            onChanged: (double value) {
              seekTo(value);
            },
            min: 0.0,
            max: duration.inMilliseconds.toDouble(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              positionText,
              style: TextStyle(
                  fontSize: 13.0, color: colorControls, letterSpacing: 1.0),
            ),
            Text(
              durationText,
              style: TextStyle(
                  fontSize: 13.0, color: colorControls, letterSpacing: 1.0),
            ),
          ],
        ),
      ],
    );
  }

  _buildPlayerControls() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.skip_previous,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () => _replay30(),
            ),
            IconButton(
              icon: Icon(
                Icons.replay_30,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () => _replay30(),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    splashColor: Colors.transparent,
                    icon: Icon(
                      isPlaying ? Icons.pause_circle_filled : Icons.play_arrow,
                      color: Colors.black,
                      size: 47,
                    ),
                    onPressed: () {
                      isPlaying ? _pause() : _play();
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
                Icons.forward_30,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () => _forward30(),
            ),
            IconButton(
              icon: Icon(
                Icons.skip_next,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () => _replay30(),
            ),
          ],
        ));
  }

  _buildSaveOptions() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.toc,
                    size: 35,
                    color: Colors.black45,
                  ),
                  onPressed: () => _replay30(),
                ),
                Text(
                  'Chapters',
                  style:
                      GoogleFonts.ubuntu(fontSize: 15, color: Colors.black45),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.turned_in_not,
                    size: 35,
                    color: Colors.black45,
                  ),
                  onPressed: () => _replay30(),
                ),
                Text(
                  'Bookmark',
                  style:
                      GoogleFonts.ubuntu(fontSize: 15, color: Colors.black45),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.turned_in,
                    size: 35,
                    color: Colors.black45,
                  ),
                  onPressed: () => _forward30(),
                ),
                Text(
                  'Saved',
                  style:
                      GoogleFonts.ubuntu(fontSize: 15, color: Colors.black45),
                )
              ],
            ),
          ],
        ));
  }

  // Request audio play
  Future<void> _play() async {
    setState(() {
      _loading = true;
    });
    // here we send position in case user has scrubbed already before hitting
    // play in which case we want playback to start from where user has
    // requested
    _audioPlayer.play(widget.audioBook.audioPath,
        title: widget.audioBook.bookTitle,
        subtitle: widget.audioBook.bookAuthor,
        position: currentPlaybackPosition,
        isLiveStream: false);
  }

  // Request audio pause
  Future<void> _pause() async {
    _audioPlayer.pause();
    setState(() => audioPlayerState = PlayerState.PAUSED);
  }

  // Request audio stop. this will also clear lock screen controls
  Future<void> _stop() async {
    _audioPlayer.reset();

    setState(() {
      audioPlayerState = PlayerState.STOPPED;
      currentPlaybackPosition = Duration.zero;
    });
  }

  // Seek to a point in seconds
  Future<void> seekTo(double milliseconds) async {
    setState(() {
      currentPlaybackPosition = Duration(milliseconds: milliseconds.toInt());
    });
    _audioPlayer.seekTo(milliseconds / 1000);
  }

  Future<void> _forward30() async {
    final playPosition = (currentPlaybackPosition != null &&
            duration != null &&
            currentPlaybackPosition.inMilliseconds > 0 &&
            currentPlaybackPosition.inMilliseconds < duration.inMilliseconds)
        ? currentPlaybackPosition
        : null;

    final newPos = playPosition + Duration(seconds: 30);
    _audioPlayer.seekTo(newPos.inSeconds.toDouble());

    setState(() {
      currentPlaybackPosition = newPos;
    });
  }

  Future<void> _replay30() async {
    final playPosition = (currentPlaybackPosition != null &&
            duration != null &&
            currentPlaybackPosition.inMilliseconds > 0 &&
            currentPlaybackPosition.inMilliseconds < duration.inMilliseconds)
        ? currentPlaybackPosition
        : null;

    final newPos = playPosition - Duration(seconds: 30);
    // final seek
    _audioPlayer.seekTo(newPos.inSeconds.toDouble());

    setState(() {
      currentPlaybackPosition = newPos;
    });
  }

  // @override
  // void dispose() {
  //   if (mounted) {
  //     _audioPlayer.dispose();
  //   }
  //   super.dispose();
  // }
}
