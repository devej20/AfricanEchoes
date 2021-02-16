import 'package:african_echoes/pages/page.dart';

import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileEditPage()));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          ProfileHeader(),
          ProfileInfo(),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _divider() {
    return Divider(
      height: 2,
      thickness: 1.5,
      color: Colors.black,
    );
  }

  // ignore: unused_element
  Widget _buildListItem({@required String title, @required String subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.ubuntu(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.ubuntu(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
