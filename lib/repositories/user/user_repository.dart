import 'package:african_echoes/dao/dao.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserApiClient userApiClient;
  final userDao = UserDao();
  final storage = new FlutterSecureStorage();
  final String tokenKey = "cghMOrBKfN97FbG8661ztXwvaS46gnjz_EAl5vYdzyA=";

  UserRepository({@required this.userApiClient})
      : assert(userApiClient != null);

  Future<String> authenticate({
    @required String phoneNumber,
    @required String password,
  }) async {
    User user =
        await userApiClient.login(phoneNumber: phoneNumber, password: password);
    // await saveData(user);
    return user.token;
  }

  Future<void> register({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String password,
  }) async {
    userApiClient.register(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        password: password);
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await storage.delete(key: tokenKey);
    return;
  }

  // Future<void> saveData(User user) async {
  //   await saveUserData(user);
  // }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await storage.write(key: tokenKey, value: token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    String value = await storage.read(key: tokenKey);
    if (value != null) {
      return true;
    }

    return false;
  }

  // Future getAllUsers() => userDao.getUsers();

  // Future insertUser(User user) => userDao.insert(user);

  // Future updateUser(User user) => userDao.update(user);

  // Future deleteUserById(int id) => userDao.delete(id);

  // //We are not going to use this in the demo
  // Future deleteAllUsers() => userDao.deleteAll();
}
