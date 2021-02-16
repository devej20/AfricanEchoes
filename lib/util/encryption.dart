import 'package:encrypt/encrypt.dart';
import 'package:meta/meta.dart';

class Encryption {
  static final key = Key.fromLength(32);
  final iv = IV.fromLength(16);
  static final encrypter = Encrypter(AES(key));

  encryptFile({@required String audioFilePath}) {
    final encrypted = encrypter.encrypt(audioFilePath, iv: iv);
    return encrypted;
  }

  decryptFile({@required dynamic encryptedFile}) {
    encrypter.decrypt(encryptedFile, iv: iv);
  }
}
