import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/widget.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
          title: Text(
            "afrikan echoes publishers",
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Container(child: DownloadTaskList()));
  }
}
