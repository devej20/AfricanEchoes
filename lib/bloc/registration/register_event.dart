import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super();
}

class RegisterButtonPressed extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  RegisterButtonPressed(
      {@required this.firstName,
      @required this.lastName,
      @required this.phoneNumber,
      @required this.password})
      : super([firstName, lastName, phoneNumber, password]);

  @override
  String toString() {
    return """Register Button Pressed :
   """;
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
