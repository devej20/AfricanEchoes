import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioBookPage extends StatefulWidget {
  @override
  _AudioBookPageState createState() => _AudioBookPageState();
}

class _AudioBookPageState extends State<AudioBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset("assets/images/african_echoes_logo.jpeg"),
          ),
          title: Text(
            "afrikan echoes publishers",
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/african_echoes_logo.jpeg"),
            //     colorFilter: ColorFilter.mode(
            //       Colors.grey.withOpacity(0.1),
            //       BlendMode.dstATop,
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: AudioBookList()));
  }
}
