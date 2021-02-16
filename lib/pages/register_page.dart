import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository userRepository;

  const RegisterPage({Key key, @required this.userRepository})
      : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: BlocProvider(
        create: (context) {
          return RegisterBloc(
            userRepository: widget.userRepository,
          );
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
              child: Container(
                  color: Color(0xFFfcdc08),
                  height: MediaQuery.of(context).size.height,
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  child: ListView(
                    children: <Widget>[
                      LogoArea(),
                      SizedBox(
                        height: 25,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      //   child: Material(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(22.0)),
                      //     elevation: 18.0,
                      //     clipBehavior: Clip.antiAlias,
                      //     color: Colors.white,
                      //     child: MaterialButton(
                      //       onPressed: () async {
                      //         await googleSignIn();
                      //       },
                      //       child:
                      //           Image.asset('assets/images/google_signin.png'),
                      //       minWidth: 200,
                      //       height: 25,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      //   child: Material(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(22.0)),
                      //       elevation: 18.0,
                      //       clipBehavior: Clip.antiAlias,
                      //       color: Colors.blue[900],
                      //       child: InkWell(
                      //         onTap: () async {
                      //           await signInFB();
                      //         }, // Handle your callback.
                      //         splashColor: Colors.brown.withOpacity(0.5),
                      //         child: Ink(
                      //           height: 70,
                      //           width: 100,
                      //           decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //               image: AssetImage(
                      //                   'assets/images/facebook_login.jpg'),
                      //               fit: BoxFit.fill,
                      //             ),
                      //           ),
                      //         ),
                      //       )),
                      // ),

                      RegisterForm(
                        userRepository: widget.userRepository,
                      ),
                      Container(
                        height: 100,
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
