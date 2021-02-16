import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  String toString() {
    return "Register Loading";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegisterSuccess extends RegisterState {
  @override
  String toString() {
    return "RegisterSuccess";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegisterFailuer extends RegisterState {
  final String error;

  RegisterFailuer({@required this.error}) : super([error]);

  @override
  String toString() {
    return "Register Failure {error : $error}";
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
