import 'package:african_echoes/pages/payment_page.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      child: Container(
        child: Column(
          children: <Widget>[
            _divider(),
            _profileInfoItem(
              icon: Icons.perm_identity,
              title: "Email",
              subtitle: "Email",
            ),
            _divider(),
            _profileInfoItem(
              icon: Icons.perm_identity,
              title: "Phone Number",
              subtitle: "Phone Number",
            ),
            _divider(),
            _profileInfoItem(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MakePayments()));
              },
              icon: Icons.payment,
              title: 'Payment Method',
              subtitle: "Tap to Make Payment",
            ),
            _divider(),
            _profileInfoItem(
              onTap: () {},
              icon: Icons.settings,
              title: "Settings",
              subtitle: "",
            ),
            _divider(),
            Container(
                height: 150,
                child: Image.asset('assets/images/african_echoes_logo.jpeg'))
          ],
        ),
      ),
    );
  }

  Widget _profileInfoItem(
      {@required IconData icon,
      String title,
      @required String subtitle,
      GestureTapCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title == null ? "" : title),
      subtitle: Text(subtitle == null ? "" : subtitle),
    );
  }
}

Widget _divider() {
  return Divider(
    height: 0.9,
    thickness: 1.5,
    color: Colors.grey,
  );
}
