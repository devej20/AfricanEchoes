import 'package:african_echoes/database/database.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // Future<User> insert(User user) async {
  //   final db = await dbProvider.database;
  //   user.id = await db.insert(tableUser, user.toMap());
  //   return user;
  // }

  // Future<User> getUser(int id) async {
  //   final db = await dbProvider.database;
  //   List<Map> maps =
  //       await db.query(tableUser, where: '$columnId = ?', whereArgs: [id]);
  //   if (maps.length > 0) {
  //     return User.fromMap(maps.first);
  //   }
  //   return null;
  // }

  // Future<List<User>> getUsers() async {
  //   final db = await dbProvider.database;
  //   var res = await db.query(tableUser);
  //   List<User> list =
  //       res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];
  //   return list;
  // }

  // Future<int> delete(int id) async {
  //   final db = await dbProvider.database;
  //   return await db.delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> update(User user) async {
  //   final db = await dbProvider.database;
  //   return await db.update(tableUser, user.toMap(),
  //       where: '$columnId = ?', whereArgs: [user.id]);
  // }

  // deleteAll() async {
  //   final db = await dbProvider.database;
  //   db.rawDelete("Delete * from $tableUser");
  // }
}
