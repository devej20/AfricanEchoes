import 'package:african_echoes/colors.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:african_echoes/routes/routes.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  final UserRepository userRepository;

  const LandingPage({Key key, @required this.userRepository}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFfcdc08),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LogoArea(),
                  SizedBox(
                    height: 45.0,
                  ),
                  Material(
                    color: Color(0xFF4ecc8f),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 240,
                      child: RaisedButton(
                        color: Color(0xFF4ecc8f),
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            side: BorderSide(color: Color(0xFF4ecc8f))),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Log In",
                          style: GoogleFonts.ptSans(
                              color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              // replcet the curent layout unlike push that just creates new page
                              context,
                              loginRoute,
                              arguments: widget.userRepository);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 240,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            side: BorderSide(color: colorSecondary)),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        color: Colors.white,
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.ptSans(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              // replcet the curent layout unlike push that just creates new page
                              context,
                              registrationRoute,
                              arguments: widget.userRepository);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    "By continuing, you agree to aep's Terms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
