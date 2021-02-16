import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bloc/bloc.dart';

import '../repositories/repositories.dart';
import '../routes/routes.dart';
import '../util/util.dart';

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;

  const RegisterForm({Key key, @required this.userRepository})
      : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextStyle style = TextStyle(fontSize: 16.0, color: Colors.black);

  // ignore: unused_field
  var _date;
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  final _dateOfBirthController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _dateOfBirthFocusNode = FocusNode();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _stateFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailuer) {
          FlushbarHelper.createError(
            title: "Error",
            message: state.error,
          )..show(context).then((result) {
              Navigator.pop(
                context,
              );
            });
        }
        if (state is RegisterSuccess) {
          FlushbarHelper.createSuccess(
            title: "Success",
            message: "Registration Successful",
          )..show(context).then((result) {
              Navigator.pushReplacementNamed(context, loginRoute,
                  arguments: widget.userRepository);
            });
        }
      },
      child:
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // _buildDateOfBirthField(),
              // _formSpace(),
              _buildFirstNameField(),
              _formSpace(),
              _buildLastNameField(),
              _formSpace(),
              _buildEmailField(),
              _formSpace(),
              _buildPhoneNumberField(),
              _formSpace(),
              // _buildAddressField(),
              // _formSpace(),
              // _buildCityField(),
              // _formSpace(),
              // _buildStateField(),
              // _formSpace(),
              _buildPasswordField(),
              _formSpace(),
              _buildComfirmPasswordField(),
              SizedBox(
                height: 25,
              ),
              Material(
                clipBehavior: Clip.antiAlias,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28.0)),
                    side: BorderSide(
                      color: Color(0xFF4ecc8f),
                    )),
                child: Container(
                  width: 272,
                  child: RaisedButton(
                    color: Color(0xFF4ecc8f),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        side: BorderSide(
                          color: Color(0xFF4ecc8f),
                        )),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    // color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    child: Text(
                      'Create Account',
                      style:
                          GoogleFonts.ptSans(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();

                      if (!_formKey.currentState.validate()) {
                        return;
                      } else {
                        onRegisterButtonPressed();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              InkWell(
                child: Text.rich(TextSpan(
                    text: 'Already a member?',
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log In',
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
                        loginRoute,
                        arguments: repo);
                  }
                },
              ),
              // FlatButton(
              //   child: Text(
              //     'Already a member? Log In',
              //     style: GoogleFonts.ptSans(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 15),
              //   ),
              //   onPressed: () {
              //     var repo = widget.userRepository;
              //     if (repo != null) {
              //       Navigator.pushReplacementNamed(
              //           // replcet the curent layout unlike push that just creates new page
              //           context,
              //           loginRoute,
              //           arguments: repo);
              //     }
              //   },
              // ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      }),
    );
  }

  onRegisterButtonPressed() {
    BlocProvider.of<RegisterBloc>(context)
      ..add(
        RegisterButtonPressed(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phoneNumber: _phoneNumberController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
  }

  _formSpace() {
    return SizedBox(
      height: 10,
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  datePicker() {
    var newDate = DateTime.now().subtract(new Duration(days: 7));
    return showDatePicker(
      context: context,
      initialDate: newDate,
      firstDate: DateTime(1800),
      lastDate: newDate,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((date) {
      setState(() {
        _date = date;
        var _dateFormatted = DateFormat.yMMMd('en_US').format(date);
        print("Debug, Register form date of birth: $date");
        _dateOfBirthController.text = _dateFormatted;
      });
    });
  }

  // ignore: unused_element
  Widget _buildDateOfBirthField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: TextFormField(
        // autovalidate: true,
        validator: (String value) {
          if (value.trim().isEmpty)
            return 'Please select Date Of Birth.';
          else
            return null;
        },

        style: GoogleFonts.alegreyaSans(color: Colors.grey, fontSize: 17),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.datetime,
        decoration: textDecoration("Date Of Birth"),
        controller: _dateOfBirthController,
        onTap: datePicker,
        focusNode: _dateOfBirthFocusNode,
        onFieldSubmitted: (_) {
          _fieldFocusChange(
              context, _dateOfBirthFocusNode, _firstNameFocusNode);
        },
      ),
    );
  }

  Widget _buildFirstNameField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          // autovalidate: true,
          validator: (String value) {
            if (value.trim().isEmpty)
              return 'Please enter First Name.';
            else
              return null;
          },

          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          decoration: textDecoration("First Name"),
          controller: _firstNameController,
          focusNode: _firstNameFocusNode,
          onFieldSubmitted: (_) {
            _fieldFocusChange(context, _firstNameFocusNode, _lastNameFocusNode);
          },
        ),
      ),
    );
  }

  Widget _buildLastNameField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          // autovalidate: true,
          validator: (String value) {
            if (value.trim().isEmpty)
              return 'Please enter Last Name.';
            else
              return null;
          },

          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.name,
          decoration: textDecoration("Last Name"),
          controller: _lastNameController,
          focusNode: _lastNameFocusNode,
          onFieldSubmitted: (_) {
            _fieldFocusChange(context, _lastNameFocusNode, _emailFocusNode);
          },
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          // autovalidate: true,
          validator: (String value) {
            if (value.trim().isEmpty || !isEmail(value))
              return 'Please enter a valid Email.';
            else
              return null;
          },

          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: TextInputType.emailAddress,
          decoration: textDecoration('Email Address'),
          controller: _emailController,
          focusNode: _emailFocusNode,
          onFieldSubmitted: (_) {
            _fieldFocusChange(context, _emailFocusNode, _phoneNumberFocusNode);
          },
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          // autovalidate: true,
          validator: (String value) {
            if (value.trim().isEmpty || value.trim().length < 10)
              return 'Please enter a valid Phone Number.';
            else
              return null;
          },

          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          decoration: textDecoration('Phone Number'),
          controller: _phoneNumberController,
          focusNode: _phoneNumberFocusNode,
          onFieldSubmitted: (_) {
            _fieldFocusChange(
                context, _phoneNumberFocusNode, _addressFocusNode);
          },
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildAddressField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: TextFormField(
        // autovalidate: true,
        // ignore: missing_return
        validator: (String value) {
          if (value.trim().isEmpty) {
            return 'Please enter a Address.';
          }
        },

        style: GoogleFonts.alegreyaSans(color: Colors.grey, fontSize: 17),
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.streetAddress,
        decoration: textDecoration('Address'),
        controller: _addressController,
        focusNode: _addressFocusNode,
        onFieldSubmitted: (_) {
          _fieldFocusChange(context, _addressFocusNode, _cityFocusNode);
        },
      ),
    );
  }

  // ignore: unused_element
  Widget _buildCityField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: TextFormField(
        // autovalidate: true,
        validator: (String value) {
          if (value.trim().isEmpty)
            return 'Please enter a City.';
          else
            return null;
        },

        style: GoogleFonts.alegreyaSans(color: Colors.grey, fontSize: 17),
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        decoration: textDecoration('City'),
        controller: _cityController,
        focusNode: _cityFocusNode,
        onFieldSubmitted: (_) {
          _fieldFocusChange(context, _cityFocusNode, _stateFocusNode);
        },
      ),
    );
  }

  // ignore: unused_element
  Widget _buildStateField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: TextFormField(
        // autovalidate: true,
        validator: (String value) {
          if (value.trim().isEmpty)
            return 'Please enter a State/Region.';
          else
            return null;
        },

        style: GoogleFonts.alegreyaSans(color: Colors.grey, fontSize: 17),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: textDecoration('State/Region'),
        textCapitalization: TextCapitalization.sentences,
        controller: _stateController,
        focusNode: _stateFocusNode,
        onFieldSubmitted: (_) {
          _fieldFocusChange(context, _stateFocusNode, _passwordFocusNode);
        },
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
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          obscureText: _showPassword,
          validator: (String value) {
            if (value.trim().isEmpty)
              return 'Please enter Password.';
            else
              return null;
          },
          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
          textInputAction: TextInputAction.next,
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
              icon:
                  Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: _togglePasswordVisibility,
            ),
          ),
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          onFieldSubmitted: (_) {
            _fieldFocusChange(
                context, _passwordFocusNode, _confirmPasswordFocusNode);
          },
        ),
      ),
    );
  }

  _toggleConfirmPasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget _buildComfirmPasswordField() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      // elevation: 18.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Container(
        width: 280,
        child: TextFormField(
          obscureText: _showConfirmPassword,
          validator: (String value) {
            if (value.trim().isEmpty)
              return 'Please enter Password.';
            else if (value != _passwordController.text)
              return 'Passwords do not match.';
            else
              return null;
          },
          style: GoogleFonts.ptSans(color: Colors.grey, fontSize: 17),
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
            labelText: "Confirm Password",
            suffixIcon: IconButton(
              icon: Icon(_showConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: _toggleConfirmPasswordVisibility,
            ),
          ),
          controller: _confirmPasswordController,
          focusNode: _confirmPasswordFocusNode,
          onFieldSubmitted: (_) {
            _confirmPasswordFocusNode.unfocus();
          },
        ),
      ),
    );
  }
}
