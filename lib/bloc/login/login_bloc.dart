import 'dart:async';
import 'package:african_echoes/bloc/authentication/authentication.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          phoneNumber: event.phoneNumber,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));

        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
