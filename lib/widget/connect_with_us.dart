import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConnectItem(
          icon: FontAwesomeIcons.globe,
          title: "Visit our website",
          onTap: () {},
        ),
        HorizontalDivider(),
        ConnectItem(
          icon: FontAwesomeIcons.facebook,
          title: "Like us on Facebook",
          onTap: () {},
        ),
        HorizontalDivider(),
        ConnectItem(
          icon: FontAwesomeIcons.twitter,
          title: "Follow us on Twitter",
          onTap: () {},
        ),
        HorizontalDivider(),
        ConnectItem(
          icon: FontAwesomeIcons.youtube,
          title: "Watch us on Youtube",
          onTap: () {},
        ),
      ],
    ));
  }
}
