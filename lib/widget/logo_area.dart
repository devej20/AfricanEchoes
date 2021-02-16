import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoArea extends StatelessWidget {
  const LogoArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(),
          Container(
            height: 100,
            width: 150,
            child: Image.asset(
              'assets/images/aep_logo.jpeg',
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'afrikan echoes publishers',
            style: GoogleFonts.ubuntu(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
