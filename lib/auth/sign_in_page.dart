import 'package:african_echoes/auth/sign_up_page.dart';
import 'package:african_echoes/pages/home_page.dart';
import 'package:african_echoes/util/util.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final Function _changePage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _loginData = {'email': null, 'password': null};

  TextStyle style = TextStyle(fontSize: 18.0, color: Colors.white);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.network(
                    'https://i0.wp.com/codecollege.co.za/wp-content/uploads/2016/12/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91.767530171531268819878.png?fit=550%2C424&ssl=1'),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'African Echoes',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              _buildLoginWidget(_formKey, context: context),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildLoginWidget(GlobalKey formkey, {context: BuildContext}) {
    Widget _buildEmailField() {
      return TextFormField(
        // autovalidate: true,
        // ignore: missing_return
        validator: (String value) {
          if (!isEmail(value) || value.trim().isEmpty)
            return 'Please enter a valid email.';
        },

        style: style,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        decoration: textDecoration('Email Address'),
        onSaved: (String value) {
          _loginData['email'] = value;
        },
      );
    }

    Widget _buildPasswordField() {
      return TextFormField(
        obscureText: true,
        initialValue: '', // used to set the initial value
        // ignore: missing_return
        validator: (String value) {
          if (value.trim().isEmpty) return 'Please enter your password.';
        },
        style: style,
        keyboardType: TextInputType.emailAddress,
        decoration: textDecoration('Password'),
        onSaved: (String value) {
          _loginData['password'] = value;
        },
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildEmailField(),
          SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          SizedBox(
            height: 15,
          ),

          GestureDetector(
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

          // SwitchListTile(
          //   title: Text('I accept the Terms & Conditions'),
          //   value: _acceptTerms,
          //   onChanged: (bool value) {
          //     setState(() {
          //       _acceptTerms = value;
          //     });
          //   },
          // ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(color: Colors.white)),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              // color: Theme.of(context).buttonColor,
              textColor: Colors.white,
              child: Text('Login', style: TextStyle(fontSize: 18)),
              onPressed: () {
                // Navigator.pushReplacement(   // replcet the curent layout unlike push that just creates new page
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext cotext) => HomePage()));

                // Using Routes

                _formKey.currentState.save();

                if (!_formKey.currentState.validate()) {
                  return;
                } else {
                  Navigator.pushReplacement(
                      // replcet the curent layout unlike push that just creates new page
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext cotext) => HomePage()));
                }
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FlatButton(
            child: Text(
              'Create an account, Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  // replcet the curent layout unlike push that just creates new page
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext cotext) => SignUp()));
            },
          ),
        ],
      ),
    );
  }
}
