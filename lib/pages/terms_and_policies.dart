import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndPoliciesPage extends StatefulWidget {
  @override
  _TermsAndPoliciesPageState createState() => _TermsAndPoliciesPageState();
}

class _TermsAndPoliciesPageState extends State<TermsAndPoliciesPage> {
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Terms And Policies",
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Text(
          'Terms And Policies will appear here',
          style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
