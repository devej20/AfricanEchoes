import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Version extends StatefulWidget {
  @override
  _VersionState createState() => _VersionState();
}

class _VersionState extends State<Version> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HorizontalDivider(),
        ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.black,
          ),
          title: RichText(
            text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: "Version: ",
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  TextSpan(
                    text: "1.0",
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ]),
          ),
        ),
        HorizontalDivider()
      ],
    );
  }
}
