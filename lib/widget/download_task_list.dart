import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:african_echoes/bloc/download_task/download_task_bloc.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../colors.dart';

class DownloadTaskList extends StatefulWidget {
  @override
  _DownloadTaskListState createState() => _DownloadTaskListState();
}

class _DownloadTaskListState extends State<DownloadTaskList> {
  TargetPlatform platform;

  List<DownloadTaskInfo> _tasks = [];

  bool _isLoading;
  bool _permissionReady;
  String _localPath;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _isLoading = true;
    _permissionReady = false;
    _prepare();

    _getDownloadTasks();
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _getDownloadTasks() {
    BlocProvider.of<DownloadTaskBloc>(context).add(LoadDownloads());
    final state = BlocProvider.of<DownloadTaskBloc>(context).state;
    if (state is DownloadsLoaded) {
      final tks = state.downloads;
      _prepareList(tks);
    }
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      print('UI Isolate Callback: $data');
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      final task = _tasks?.firstWhere((task) => task.taskId == id);
      if (task != null) {
        setState(() {
          task.status = status;
          task.progress = progress;
        });
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return _isLoading
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : _permissionReady
            ? BlocBuilder<DownloadTaskBloc, DownloadTaskState>(
                builder: (context, state) {
                if (state is DownloadsLoading) {
                  return Center(child: LoadingIndicator());
                } else if (state is DownloadsLoaded) {
                  return _buildBookList(
                    _tasks,
                  );
                } else if (state is DownloadsLoaded) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Something went wrong!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorSecondary,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.replay, color: colorPrimary),
                          onPressed: _getDownloadTasks,
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              })
            : new Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Please grant accessing storage permission to continue',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      FlatButton(
                          onPressed: () {
                            _checkPermission().then((hasGranted) {
                              setState(() {
                                _permissionReady = hasGranted;
                              });
                            });
                          },
                          child: Text(
                            'Retry',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ))
                    ],
                  ),
                ),
              );
  }

  Widget _buildBookItems(
      BuildContext context, int position, DownloadTaskInfo book) {
    return DownloadTaskListItem(
      downloadTask: book,
      localPath: _localPath,
    );
  }

  Widget _buildBookList(
    List<DownloadTaskInfo> downloads,
  ) {
    Widget productCard;
    if (downloads.length > 0) {
      productCard = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        itemCount: downloads.length,
        itemBuilder: (BuildContext context, int index) => _buildBookItems(
          context,
          index,
          downloads[index],
        ),
      );
    } else {
      productCard = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.file_download),
            Text("Please Add Books To Cart  "),
          ],
        ),
      );
    }
    return productCard;
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      var status = PermissionStatus.granted;
      if (permission != status) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  // ignore: unused_element
  _showList(List<DownloadTaskInfo> downloadTasks) {
    _prepareList(downloadTasks);
    return _buildBookList(
      _tasks,
    );
  }

  Future _prepareList(List<DownloadTaskInfo> downloadTasks) async {
    final tasks = await FlutterDownloader.loadTasks();

    _tasks = [];

    for (var task in downloadTasks) {
      _tasks.add(task);
    }

    tasks?.forEach((task) {
      for (DownloadTaskInfo info in _tasks) {
        if (info.audioUrl == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });
  }

  Future<Null> _prepare() async {
    final List<DownloadTask> tasks = await FlutterDownloader.loadTasks();

    tasks?.forEach((task) {
      for (DownloadTaskInfo info in _tasks) {
        if (info.audioUrl == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });
    _permissionReady = await _checkPermission();

    _localPath = (await _findLocalPath()) + '/audios/';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<String> _findLocalPath() async {
    final directory = platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
