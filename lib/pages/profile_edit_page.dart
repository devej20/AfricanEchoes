import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              _formKey.currentState.save();

              if (!_formKey.currentState.validate()) {
                return;
              } else {
                // loginBloc.dispatch(LoginButtonPressed(
                //     username: _usernameController.text,
                //     password: _passwordController.text));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            height: _height,
            child: ListView(
              children: <Widget>[
                ProfileEditForm(
                  formKey: _formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
