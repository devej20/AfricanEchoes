import 'package:african_echoes/colors.dart';
import 'package:african_echoes/util/util.dart';
import 'package:flutter/material.dart';

class ProfileEditForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const ProfileEditForm({Key key, @required this.formKey}) : super(key: key);
  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _loginData = {'email': null, 'password': null};

  TextStyle style = TextStyle(fontSize: 18.0, color: colorSecondaryDark);

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          _buildImage(),
          SizedBox(
            height: 30,
          ),
          _buildNameField(),
          SizedBox(
            height: 20,
          ),
          _buildEmailField(),
          SizedBox(
            height: 20,
          ),
          _buildPhoneNumberField(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Container(
        width: 160,
        height: 160,
        child: CircleAvatar(
          backgroundColor: colorSecondaryLight,
          child: Icon(
            Icons.perm_identity,
            size: 100,
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      // autovalidate: true,
      // ignore: missing_return
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Please enter Full Name.';
        }
      },

      style: style,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: textDecoration('Name'),
      controller: _usernameController,
      onSaved: (String value) {
        _loginData['email'] = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      // autovalidate: true,
      // ignore: missing_return
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Please enter Email.';
        } else if (!isEmail(value)) {
          return 'Please enter a valid Email.';
        }
      },

      style: style,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: textDecoration('Email Address'),
      controller: _emailController,
      onSaved: (String value) {
        _loginData['email'] = value;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      // autovalidate: true,
      // ignore: missing_return
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Please enter Phone Number.';
        } else if (value.length < 10) {
          return 'Please enter a valid Phone Number.';
        }
      },

      style: style,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.phone,
      decoration: textDecoration('Phone Number'),
      controller: _phoneNumberController,
      onSaved: (String value) {
        _loginData['email'] = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      // initialValue: '', // used to set the initial value
      // ignore: missing_return
      validator: (String value) {
        if (value.trim().isEmpty) return 'Please enter Password.';
      },
      style: style,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      decoration: textDecoration('Password'),
      controller: _passwordController,
      onSaved: (String value) {
        _loginData['password'] = value;
      },
    );
  }
}
