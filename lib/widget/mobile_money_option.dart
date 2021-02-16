import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileMoneyOption extends StatefulWidget {
  //convert stateless widget --> stateful widget here

  @override
  _MobileMoneyOptionState createState() => _MobileMoneyOptionState();
}

class _MobileMoneyOptionState extends State<MobileMoneyOption> {
//radio integer
  int group = 1;

  //dropdown
  /*List _meternumber = [
    "P1510735546",
    "P1510735548",
    "P1510735545",
    "P1510735530"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedMeterNumber;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_meternumber);
    _selectedMeterNumber = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(
      List meternumbers) {
    List<DropdownMenuItem<String>> items = List();
    for (String meternumber in meternumbers) {
      items.add(DropdownMenuItem(value: meternumber, child: Text(meternumber)));
    }
    return items;
  }

  void changedDropDownItem(String selectedMeterNumber) {
    setState(() {
      _selectedMeterNumber = selectedMeterNumber;
    });
  } */ //dropdown end

// form key
  final _formKey = GlobalKey<FormState>();
  //final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        title: Text(
          "Mobile Money Option",
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        //child: RaisedButton(
        //child: Text('Open route'),
        // onPressed: () {
        // Navigate to second route when tapped.
        //  },
        //),
        child: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(11.0), // spacing between text
                  child: Row(
                    children: <Widget>[
                      /* Text("Choose meter number:",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontFamily: 'times new roman')),*/
                    ],
                  ),
                ),

                //dropdown
                /* Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //Text("Please choose a fruit: ",
                      //style: TextStyle(
                      // fontWeight: FontWeight.bold, fontSize: 17.0)),
                      DropdownButton(
                        value: _selectedMeterNumber,
                        items: _dropDownMenuItems,
                        onChanged: changedDropDownItem,
                      )
                    ],
                  ),
                ),*/

                Padding(
                  padding: const EdgeInsets.all(11.0), // spacing between text
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Please select payment method:",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),

                // radio
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // render flex error fix
                        child: Container(
                          child: (RadioListTile(
                            //activeColor:Colors.deepOrange,
                            // controlAffinity: ListTileControlAffinity.trailing,
                            // radio
                            title: Text(
                              "MTN Mobile Money",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            value: 1,
                            groupValue: group,
                            onChanged: (T) {
                              // could be a string or variable. It makes the radio button selectable
                              print(T);

                              setState(() {
                                group = T;
                              });
                            },
                            activeColor: Colors.green,
                            //controlAffinity: ListTileControlAffinity.leading,
                            //checkColor: Colors.indigo,//checkbox color
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: (RadioListTile(
                            title: Text(
                              "Vodafone cash",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            value: 2,
                            groupValue: group,
                            onChanged: (T) {
                              // could be a string or variable. It makes the radio button selectable
                              print(T);

                              setState(() {
                                group = T;
                              });
                            },
                            activeColor: Colors.green,
                            //controlAffinity: ListTileControlAffinity.leading,
                            //checkColor: Colors.indigo,//checkbox color
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: (RadioListTile(
                            title: Text(
                              "AirtelTigo Money",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            value: 3,
                            groupValue: group,
                            onChanged: (T) {
                              // could be a string or variable. It makes the radio button selectable
                              print(T);

                              setState(() {
                                group = T;
                              });
                            },
                            activeColor: Colors.green,
                            //controlAffinity: ListTileControlAffinity.leading,
                            //checkColor: Colors.indigo,//checkbox color
                          )),
                        ),
                      ),
                    ],
                  ),
                ),

                //form
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, //alignment of form and button
                      children: <Widget>[
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          elevation: 18.0,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
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
                              labelText: "Enter Phone Number",
                            ),
                            // ignore: missing_return
                            validator: (String value) {
                              if (value.trim().isEmpty ||
                                  value.trim().length < 10) {
                                return 'Please enter a valid Phone Number.';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          elevation: 18.0,
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
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
                              labelText: "Enter Amount",
                            ),
                            // ignore: missing_return
                            validator: (String value) {
                              if (value.trim().isEmpty ||
                                  value.trim().length < 2) {
                                return 'Invalid Amount';
                              }
                            },
                          ),
                        ),

                        // submit and cancel button
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ButtonTheme(
                                  //changing size and height of raised button
                                  minWidth: 165.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //side:BorderSide(color: Colors.yellow)
                                    ),
                                    color: Colors.green,
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState.validate()) {
                                        // Process data.
                                      }
                                    },
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),

                                // cancel button
                                ButtonTheme(
                                  minWidth: 165.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: Colors.green)),
                                    color: Colors.white,
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState.validate()) {
                                        // Process data.
                                      }
                                    },
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
