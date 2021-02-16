import 'dart:ui';

import 'package:african_echoes/bloc/audio_book/audio_book.dart';
import 'package:african_echoes/bloc/download_task/download_task_bloc.dart';
import 'package:african_echoes/colors.dart';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/util/encryption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:uuid/uuid.dart';

class DownloadTaskListItem extends StatefulWidget {
  final DownloadTaskInfo downloadTask;
  final String localPath;

  const DownloadTaskListItem(
      {@required this.downloadTask, @required this.localPath});

  @override
  _DownloadTaskListItemState createState() => _DownloadTaskListItemState();
}

class _DownloadTaskListItemState extends State<DownloadTaskListItem> {
  final AudioBloc audioBloc = AudioBloc();
  final Encryption encryption = Encryption();

  String image =
      "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
  String title = "title";
  String author = "author";

  String audioFilePath;

  bool startedDownloading = false;

  @override
  void initState() {
    super.initState();
    // if (!startedDownloading) {
    //   _requestDownload(widget.downloadTask);
    // }
  }

  @override
  Widget build(BuildContext context) {
    image = widget.downloadTask.bookImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    title = widget.downloadTask.bookTitle ?? "";
    author = widget.downloadTask.bookAuthor ?? "";
    return Container(
      child: Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Container(
                  width: 60,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/blank.png",
                    image: image,
                    fit: BoxFit.fill,
                  )),
              title: Text(title,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: colorSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              subtitle: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: colorSecondaryLight, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By: ',
                    ),
                    TextSpan(text: author),
                  ],
                ),
              ),
              trailing: Text("1hr 30mins",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 12)),
            ),
            _diveider(),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    widget.downloadTask.status == DownloadTaskStatus.running ||
                            widget.downloadTask.status ==
                                DownloadTaskStatus.paused
                        ? Text(
                            "Downloading File: ${widget.downloadTask.progress}%",
                            style: new TextStyle(
                                color: colorSecondaryLight, fontSize: 12),
                          )
                        // LinearProgressIndicator(
                        //     value: widget.book.progress / 100,
                        //   )
                        : new Container(),
                    _buildActionForTask(task: widget.downloadTask),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _diveider() {
    return Divider(
      height: 1,
      thickness: 2,
      color: colorSecondaryLight,
    );
  }

  Widget _buildActionForTask({@required DownloadTaskInfo task}) {
    if (task.status == DownloadTaskStatus.undefined) {
      return new IconButton(
        padding: EdgeInsets.all(4),
        onPressed: () {
          _requestDownload(task);
        },
        icon: new Icon(
          Icons.file_download,
          color: colorSecondary,
          size: 25,
        ),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return new IconButton(
        padding: EdgeInsets.all(4),
        onPressed: () {
          _pauseDownload(task);
        },
        icon: new Icon(
          Icons.pause,
          color: Colors.deepOrange,
          size: 25,
        ),
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return new IconButton(
        padding: EdgeInsets.all(4),
        onPressed: () {
          _resumeDownload(task);
        },
        icon: new Icon(
          Icons.play_arrow,
          color: Colors.green,
          size: 25,
        ),
      );
    } else if (task.status == DownloadTaskStatus.complete) {
      saveAudioFile();
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new Text(
            'Ready',
            style: new TextStyle(color: Colors.green, fontSize: 12),
          ),
          IconButton(
            padding: EdgeInsets.all(4),
            onPressed: () {
              _delete(task);
            },
            icon: Icon(
              Icons.done,
              color: Colors.green,
              size: 25,
            ),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return new Text('Canceled', style: new TextStyle(color: Colors.red));
    } else if (task.status == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new Text('Failed', style: new TextStyle(color: Colors.red)),
          IconButton(
            padding: EdgeInsets.all(4),
            onPressed: () {
              _retryDownload(task);
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.green,
              size: 25,
            ),
          )
        ],
      );
    } else {
      return null;
    }
  }

  void saveAudioFile() {
    audioFilePath =
        "${widget.localPath}" + "${widget.downloadTask.audioFileName}";

    var uuid = Uuid().v1();

    audioBloc
        .addAudio(AudioBook.fromTask(widget.downloadTask, uuid, audioFilePath));
    print("file path: $audioFilePath");

    BlocProvider.of<DownloadTaskBloc>(context)
        .add(RemoveDownload(removeBook: widget.downloadTask));
  }

  void _requestDownload(DownloadTaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
      url: widget.downloadTask.audioUrl,
      headers: {"auth": "test_for_sql_encoding"},
      savedDir: widget.localPath,
      showNotification: true,
    );
    setState(() {
      startedDownloading = true;
    });
  }

  // ignore: unused_element
  void _cancelDownload(DownloadTaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId);
  }

  void _pauseDownload(DownloadTaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId);
  }

  void _resumeDownload(DownloadTaskInfo task) async {
    String newTaskId = await FlutterDownloader.resume(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  void _retryDownload(DownloadTaskInfo task) async {
    String newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  // ignore: unused_element
  Future<bool> _openDownloadedFile(DownloadTaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }

  void _delete(DownloadTaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId, shouldDeleteContent: true);
    // await _prepare();
    setState(() {});
  }
}
