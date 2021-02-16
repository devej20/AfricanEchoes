import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HorizontalDivider(),
        ListTile(
          title: Text(
            "Developers",
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
          ),
        )
      ],
    );
  }
}
