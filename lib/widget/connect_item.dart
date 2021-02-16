import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  const ConnectItem(
      {Key key, @required this.icon, @required this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
    );
  }
}
