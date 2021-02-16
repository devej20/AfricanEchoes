import 'package:flutter/material.dart';
import 'page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentBackPressTime;
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    DiscoveryPage(),
    // BookImagePage(),
    // AudioBookPage(),
    // DownloadPage(),
    SettingPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> onWillPop({BuildContext ctx}) {
    // DateTime now = DateTime.now();
    // if (currentBackPressTime == null ||
    //     now.difference(currentBackPressTime) > Duration(seconds: 3)) {
    //   currentBackPressTime = now;
    //   FlushbarHelper.createInformation(
    //     message: "Press back again to exit",
    //     duration: Duration(seconds: 2),
    //   )..show(context);
    //   return Future.value(false);
    // }
    // return Future.value(true);

    return showDialog<bool>(
      context: ctx,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to exit?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(ctx: context),
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/african_echoes_logo.png"),
          //     colorFilter: ColorFilter.mode(
          //       Colors.grey.withOpacity(0.1),
          //       BlendMode.dstATop,
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Image.asset(
            //     "assets/images/library.jpeg",
            //     height: 30,
            //     width: 40,
            //   ),
            //   label: 'Library',
            // ),
            // BottomNavigationBarItem(
            //   icon: Image.asset(
            //     "assets/images/explore.jpeg",
            //     height: 20,
            //     width: 20,
            //   ),
            //   label: 'Explore',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storage),
              label: 'Library',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  AppBar buildAppBar({List<Widget> actions}) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Image.asset("assets/images/african_echoes_logo.jpeg"),
      ),
      title: Text(
        "Afrikan Echoes",
      ),
      actions: actions,
    );
  }
}
