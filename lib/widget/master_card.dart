import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MasterCard extends StatefulWidget {
  @override
  _MasterCardState createState() => _MasterCardState();
}

class _MasterCardState extends State<MasterCard> {
  final _formKey = GlobalKey<FormState>();

  // final _firstNameController = TextEditingController();
  // final _lastNameController = TextEditingController();
  // final _cardNumberController = TextEditingController();
  // final _cardExpiryDateController = TextEditingController();
  // final _cardVerificationValueController = TextEditingController();
  // final _streetAddressController = TextEditingController();
  // final _zipCodeController = TextEditingController();
  // final _phoneNumberController = TextEditingController();
  // final _emailController = TextEditingController();

  // final _firstNameFocusNode = FocusNode();
  // final _lastNameFocusNode = FocusNode();
  // final _cardNumberFocusNode = FocusNode();
  // final _cardExpiryDateFocusNode = FocusNode();
  // final _cardVerificationValueFocusNode = FocusNode();
  // final _streetAddressFocusNode = FocusNode();
  // final _zipCodeFocusNode = FocusNode();
  // final _phoneNumberFocusNode = FocusNode();
  // final _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        title: Text(
          'Master Card Option',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "First Name",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your First name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Surname",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your Surname name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Card Number",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a card number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "MM/YY",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "CCV",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Street Address",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "City",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Zip Code",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Phone Number",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 25.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field must not be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
