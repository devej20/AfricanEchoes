import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/bloc.dart';
import '../model/model.dart';
import '../repositories/repositories.dart';
import '../routes/routes.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  const LoginForm({
    Key key,
    @required this.userRepository,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextStyle style = TextStyle(fontSize: 16.0, color: Colors.white);

  bool _showPassword = true;

  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  User user = User();

  String dbPath = "";

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationAuthenticated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, homeRoute, (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                _buildPhoneNumberField(),
                SizedBox(
                  height: 20,
                ),
                _buildPasswordField(),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Color(0xFF4ecc8f),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 150,
                    child: RaisedButton(
                      color: Color(0xFF4ecc8f),
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          side: BorderSide(color: Color(0xFF4ecc8f))),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.ptSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        _formKey.currentState.save();

                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          onLoginButtonPressed();
                          // Navigator.pushReplacement(stext cotext) => HomePage()));
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        )
                      : null,
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 130,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                InkWell(
                  child: Text.rich(TextSpan(
                      text: 'Not a member?',
                      style:
                          GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ])),
                  onTap: () {
                    var repo = widget.userRepository;
                    if (repo != null) {
                      Navigator.pushReplacementNamed(
                          // replcet the curent layout unlike push that just creates new page
                          context,
                          registrationRoute,
                          arguments: repo);
                    }
                  },
                )
                // FlatButton(
                //   child: Text(
                //     'Not a member? Create Account',
                //     style:
                //         GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                //   ),
                //   onPressed: () {
                //     var repo = widget.userRepository;
                //     if (repo != null) {
                //       Navigator.pushReplacementNamed(
                //           // replcet the curent layout unlike push that just creates new page
                //           context,
                //           registrationRoute,
                //           arguments: repo);
                //     }
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  onLoginButtonPressed() {
    BlocProvider.of<LoginBloc>(context)
      ..add(
        LoginButtonPressed(
          phoneNumber: _phoneNumberController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _buildPhoneNumberField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: 280,
          child: TextFormField(
            // autovalidate: true,
            // ignore: missing_return
            validator: (String value) {
              if (value.trim().isEmpty || value.trim().length < 10) {
                return 'Please enter a valid Phone Number.';
              }
            },

            style: GoogleFonts.ptSans(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelStyle: TextStyle(color: Colors.grey),
              errorStyle: TextStyle(
                color: Colors.red,
              ),
              labelText: "Phone Number",
            ),
            controller: _phoneNumberController,
            focusNode: _phoneNumberFocusNode,
            onFieldSubmitted: (_) {
              _fieldFocusChange(
                  context, _phoneNumberFocusNode, _passwordFocusNode);
            },
          ),
        ),
      ),
    );
  }

  _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget _buildPasswordField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0, shadow
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: 280,
          child: TextFormField(
            obscureText: _showPassword,
            // initialValue: '', // used to set the initial value
            // ignore: missing_return
            validator: (String value) {
              if (value.trim().isEmpty) return 'Please enter Password.';
            },
            style: GoogleFonts.ptSans(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelStyle: TextStyle(color: Colors.grey),
              errorStyle: TextStyle(
                color: Colors.red,
              ),
              labelText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (_) {
              _passwordFocusNode.unfocus();
            },
          ),
        ),
      ),
    );
  }
}
