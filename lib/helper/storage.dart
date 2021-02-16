import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  // final String tag;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // ignore: unused_element
  Future<File> _localAudioFile(
      {@required String fileName, @required String fileType}) async {
    final path = await _localPath;
    return File('$path/$fileName.$fileType');
  }

  Future<String> localFileDir(
      {@required String fileName, @required String fileType}) async {
    final path = await _localPath;
    return '$path/$fileName.$fileType';
  }

  Future<String> readFile(
      {@required String fileName, @required String fileType}) async {
    final path = await _localPath;
    return "$path/$fileName.$fileType";
  }

  Future<String> writeAudioFile(
      {@required String fileName, @required String fileType}) async {
    final path = await _localPath;
    return "$path/$fileName.$fileType";
  }
}
