import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super();
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginSuccess extends LoginState {
  @override
  String toString() => 'LoginSuccess';

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error}) : super([error]);
  @override
  String toString() => 'LoginFailure { error: $error }';

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
