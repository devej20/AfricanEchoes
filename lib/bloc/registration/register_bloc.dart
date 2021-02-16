import 'dart:async';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './registration.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({@required this.userRepository}) : super(InitialRegisterState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        await userRepository.register(
          firstName: event.firstName,
          lastName: event.lastName,
          phoneNumber: event.phoneNumber,
          password: event.password,
        );
        yield RegisterSuccess();
      } catch (e) {
        RegisterFailuer(error: e.toString());
      }
    }
  }
}
