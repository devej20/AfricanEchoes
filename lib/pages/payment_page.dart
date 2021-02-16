import 'package:african_echoes/widget/master_card.dart';
import 'package:african_echoes/widget/mobile_money_option.dart';
import 'package:african_echoes/widget/visa_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:registrationapp/pages/mobile_money_top_up.dart';
// import 'package:registrationapp/pages/visa_top_page.dart';

class MakePayments extends StatelessWidget {
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
        title: Text(
          'Payment Option',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => VisaCard()));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Image.asset('assets/images/visa_card.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Visa',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MasterCard()));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/master.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Master',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MobileMoneyOption()));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/mtn.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mobile Money Option',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Container(
            //           height: 100,
            //           width: 100,
            //           child: Image.asset('assets/images/vodafone.jpg'),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Vodafone cash',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Container(
            //           height: 100,
            //           width: 100,
            //           child: Image.asset('assets/images/airtel_tigo.png'),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Airtel Tigo Money',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            //row icons
            /* Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // paybills
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisaTopUp()),
                          );
                        },
                        child: Icon(
                          Icons.credit_card,
                          size: 38.0,
                          color: Colors.green,
                        ),
                      ),
                      Text("Visa / Master",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500)),
                      Text("(Top Up)", style: TextStyle(fontSize: 15.0))
                    ],
                  ),

                  // topUp
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileMoneyTopUp()),
                          );
                        },
                        child: Icon(
                          Icons.monetization_on,
                          size: 38.0,
                          color: Colors.green,
                        ),
                      ),
                      Text("Mobile Money",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500)),
                      Text("(Top Up)", style: TextStyle(fontSize: 15.0))
                    ],
                  ),
                ],
              ),
            ), //row icons*/
          ],
        ),
      ),
    );
  }
}
