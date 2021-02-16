import 'dart:convert';
import 'dart:io';
import 'package:african_echoes/model/book.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class Nano {
  MethodChannel platform = MethodChannel('android_app_retain');

  // used for app
  List _metaData = [];
  List _musicFiles = [];

  List get musicFiles => _musicFiles;

  // used for json file
  Map mapMetaData = Map();
  Uuid uuid = new Uuid();

  Future<String> getLocalPath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> getLocalFile() async {
    String path = await getLocalPath();
    return File('$path/filesmetadata.json');
  }

  Future<File> writeImage(var hash, List<int> image) async {
    String path = await getLocalPath();
    File imagefile = File('$path/$hash');
    return imagefile.writeAsBytes(image);
  }

  Future getSdCardPath() async {
    var value;
    try {
      value = await platform.invokeMethod("getSdCardPath");
    } catch (e) {}
    return value;
  }

  Future readStoredMetaData() async {
    File file = await getLocalFile();
    try {
      String rawMetadata = await file.readAsString();
      return jsonDecode(rawMetadata);
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<File> writeStoredMetaData(Map fileMetaData) async {
    File file = await getLocalFile();
    String jsonData = jsonEncode(fileMetaData);
    return file.writeAsString(jsonData);
  }

  readExtDir(Directory dir) async {
    Stream sdContents = dir.list(recursive: true);
    sdContents = sdContents.handleError((data) {});
    await for (var data in sdContents) {
      if (data.audioPath.endsWith(".mp3")) {
        _musicFiles.add(data.audioPath);
      }
    }
  }

  Future<void> getMusicFiles() async {
    Directory ext = await getExternalStorageDirectory();
    await readExtDir(ext);
    String sdPath = await getSdCardPath();
    if (sdPath == null) {
      print("NO SDCARD ON THIS DEVICE");
    } else {
      print(sdPath);
      String sdCardDir = Directory(sdPath).parent.parent.parent.parent.path;
      await readExtDir(Directory(sdCardDir));
    }
  }

  Future getAllMetaData() async {
    for (var track in _musicFiles) {
      var data = await getFileMetaData(track);
      // updateLoadingTrack(track, _musicFiles.indexOf(track), _musicFiles.length);
      // print(track);
      if (data[2] != null) {
        if (data[2] is List<int>) {
          var digest = sha1.convert(data[2]).toString();
          writeImage(digest, data[2]);
          data[2] = digest;
          _metaData.add(data);
        } else {
          _metaData.add(data);
        }
      } else {
        _metaData.add(data);
      }
    }
  }

  Future getFileMetaData(audio) async {
    var value;
    try {
      if (mapMetaData[audio] == null) {
        value = await platform
            .invokeMethod("getMetaData", <String, dynamic>{'filepath': audio});
      } else {
        value = mapMetaData[audio];
      }
    } catch (e) {}
    return value;
  }

  void cleanMetadata() {
    for (var i = 0; i < _musicFiles.length; i++) {
      if (_metaData[i][0] == null) {
        String s = _musicFiles[i];
        for (var n = s.length; n > 0; n--) {
          if (s.substring(n - 2, n - 1) == "/") {
            _metaData[i][0] = s.substring(n - 1, s.length - 4);
            break;
          }
        }
        if (_metaData[i][1] == null) {
          _metaData[i][1] = "Unknown Artist";
        }
        if (_metaData[i][3] == null) {
          _metaData[i][3] = "Unknown Album";
        }
      }
      if (_metaData[i][4] != null) {
        Iterable<Match> matches =
            RegExp(r"^([^\/]+)").allMatches(_metaData[i][4]);
        for (Match match in matches) {
          _metaData[i][4] = match.group(0);
        }
      } else {
        _metaData[i][4] = "0";
      }
      if (_metaData[i][5] == null) {
        _metaData[i][5] = 0;
      }
    }
  }

  getImage(appPath, imageHash) {
    if (imageHash != null) {
      return appPath + "/" + imageHash;
    }
    return null;
  }

  Future<Book> fetchSongs() async {
    // ignore: unused_local_variable
    String appPath = await getLocalPath();
    await getMusicFiles();
    await getAllMetaData();
    cleanMetadata();
    // for (var i = 0; i < _musicFiles.length; i++) {
    // var albumArt = getImage(appPath, _metaData[i][2]);
    Book book = Book(
        //     uuid.v1(),
        //     _metaData[i][0],
        //     _metaData[i][1],
        //     _metaData[i][3],
        //     int.parse(_metaData[i][5]),
        //     _musicFiles[i],
        // albumArt, []
        );
    // }

    return book;
  }
}
