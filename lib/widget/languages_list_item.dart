import 'package:african_echoes/model/language.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../colors.dart';

class LanguagesListItem extends StatelessWidget {
  final Language language;

  const LanguagesListItem({
    Key key,
    @required this.language,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final name = language.name ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: Container(
        alignment: Alignment.center,
        child: OutlineButton(
          borderSide: BorderSide(color: colorSecondary),
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: colorSecondary,
          onPressed: () {},
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
          ),
        ),
      ),
    );
  }
}
