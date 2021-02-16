import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() {
    return "AppStarted";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() {
    return "LoggedIn";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() {
    return "LoggedOut";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
