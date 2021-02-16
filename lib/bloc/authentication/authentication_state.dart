import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUninitialized";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationAuthenticated";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationUnauthenticated";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() {
    return "AuthenticationLoading";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
