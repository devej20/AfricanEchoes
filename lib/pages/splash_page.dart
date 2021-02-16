import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcdc08),
      body: Center(
        // child: Column(children: <Widget>[
        //   Container(
        //     height: 200,
        //   ),
        //   Center(
        //     child: Container(
        //       height: 100.0,
        //       width: 180,
        //       child: Image.asset('assets/images/aep_logo.jpeg'),
        //     ),
        //   ),
        //   Container(
        //     child: Text(
        //       'afrikan echoes publishers',
        //       style: GoogleFonts.ubuntu(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w400,
        //           fontSize: 22),
        //     ),
        //   )
        // ]),

        widthFactor: MediaQuery.of(context).size.width * 1.5,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              // height: 150,
              child: new Image.asset(
                'assets/images/splash4.png',
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
