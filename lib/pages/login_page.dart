import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: Icon(
      //         Icons.keyboard_arrow_left,
      //         color: Colors.black,
      //       ),
      //       onPressed: () => Navigator.of(context).pop()),
      // ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: widget.userRepository,
          );
        },
        child: SingleChildScrollView(
          child: Container(
              color: Color(0xFFfcdc08),
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LogoArea(),
                  SizedBox(
                    height: 40,
                  ),
                  LoginForm(
                    userRepository: widget.userRepository,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
