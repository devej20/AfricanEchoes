import 'package:flutter/material.dart';

InputDecoration textDecoration(String label, {String hint}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    // hintText: 'Enter your product title',
    labelStyle: TextStyle(color: Colors.grey),
    errorStyle: TextStyle(
      color: Colors.red,
    ),
    labelText: label,
    hintText: hint,
  );
}

bool isEmail(String em) {
  String partten = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  RegExp regExp = new RegExp(partten);

  return regExp.hasMatch(em);
}
