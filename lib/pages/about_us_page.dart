import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "About Us",
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: _screenHeight / 3,
                  child: Image.asset(
                    'assets/images/african_echoes_logo.jpeg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  'Afrikan Echoes Publishers',
                  style: GoogleFonts.ubuntu(
                      color: Color(0xFFfbdc0b),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text(
              "At Afrikan Echoes in spite of one's background, a good story shared with our team turns you into an Author with a global reach. We also give new voices to old and conventional materials to refocus users, achieve notable levels of understanding and to create waves of excitement.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
          )),
          Version(),
          ConnectWithUs(),
          Developers()
        ],
      ),
    );
  }
}
