import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/pages/about_us_page.dart';
import 'package:african_echoes/pages/profile_page.dart';
import 'package:african_echoes/pages/terms_and_policies.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:african_echoes/routes/routes.dart';
import 'package:african_echoes/widget/audio_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final userRepository =
      UserRepository(userApiClient: UserApiClient(httpClient: http.Client()));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset("assets/images/african_echoes_logo.jpeg"),
            ),
            title: Text(
              "My Library",
              style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 25),
            ),
            actions: <Widget>[
              PopupMenuButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                itemBuilder: (content) => [
                  PopupMenuItem(
                    child: Text(
                      'Profile',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 17),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'About Us',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 17),
                    ),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Terms And Policies',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 17),
                    ),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Sign Out',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 17),
                    ),
                    value: 4,
                  )
                ],
                onSelected: (int menu) {
                  if (menu == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ProfilePage()));
                  } else if (menu == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AboutUsPage()));
                  } else if (menu == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TermsAndPoliciesPage()));
                  } else if (menu == 4) {
                    return showDialog<bool>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Are you sure you want to sign out?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(LoggedOut());
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    landingRoute,
                                    (Route<dynamic> route) => false,
                                    arguments: userRepository);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'CONTINUE',
                    style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'ALL',
                    style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'SAVED',
                    style: GoogleFonts.mukta(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AudioBookList(),
              AudioBookList(),
              AudioBookList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildItem({GestureTapCallback onTap, IconData icon, String title}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
