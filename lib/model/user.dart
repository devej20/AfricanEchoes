final String tableUser = 'user';
final String columnId = '_id';
final String columnName = 'name';
final String columnEmail = 'email';
final String columnPhoneNumber = 'phone_number';
final String columnPassword = 'password';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String token;

  User();

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     columnId: id,
  //     columnName: name,
  //     columnEmail: email,
  //     columnPhoneNumber: phoneNumber,
  //     columnPassword: password
  //   };
  //   return map;
  // }

  // User.fromMap(Map<String, dynamic> map) {
  //   id = map[columnId];
  //   name = map[columnName];
  //   email = map[columnEmail];
  //   phoneNumber = map[columnPhoneNumber];
  //   password = map[columnPassword];
  // }

  User.fromJson(Map<String, dynamic> json) {
    
        id= json["id"];
        firstName= json["firstName"];
        lastName= json["lastName"];
        phoneNumber= json["phoneNumber"];
        token= json["token"];
  }
}
