import 'package:african_echoes/pages/download_page.dart';
import 'package:african_echoes/widget/feature_list.dart';
import 'package:african_echoes/widget/featured_see_all.dart';
import 'package:african_echoes/widget/new_book_see_all.dart';
import 'package:african_echoes/widget/new_list.dart';
import 'package:african_echoes/widget/see_all_categories.dart';
import 'package:african_echoes/widget/top_chart_list.dart';
import 'package:african_echoes/widget/topchart_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../bloc/bloc.dart';
import '../model/book.dart';
import '../model/language.dart';
import '../repositories/repositories.dart';
import '../widget/book_list.dart';
import '../widget/category_list.dart';
import 'book_search_page.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List<Book> books = BooksRepository.loadProducts();
  final userRepository =
      UserRepository(userApiClient: UserApiClient(httpClient: http.Client()));
  // ignore: unused_field
  List<Book> _books = [];

  List<Language> lngs = [
    Language(
      id: 1,
      name: "English",
    ),
    Language(
      id: 2,
      name: "English",
    ),
    Language(
      id: 3,
      name: "English",
    ),
    Language(
      id: 4,
      name: "English",
    ),
    Language(
      id: 6,
      name: "English",
    ),
    Language(
      id: 7,
      name: "English",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey[800],
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset("assets/images/african_echoes_logo.jpeg"),
        ),
        title: Text(
          "afrikan echoes publishers",
          style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
        ),
        actions: <Widget>[
          IconButton(
              iconSize: 25,
              constraints: BoxConstraints.tight(Size.fromWidth(30)),
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                BlocProvider.of<BookBloc>(context).add(FetchBooks());
                showSearch(context: context, delegate: BookSearchPage());
              }),
          IconButton(
              iconSize: 25,
              constraints: BoxConstraints.tight(Size.fromWidth(40)),
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext cotext) => DownloadPage()));
              })
        ],
      ),
      body: Container(
        child: BlocProvider(
          create: (BuildContext context) {
            return BookBloc(
                booksRepository: BooksRepository(
                    bookApiClient: BookApiClient(httpClient: http.Client())));
          },
          child: ListView(children: <Widget>[
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Featured",
                    style: GoogleFonts.alegreyaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Text(
                          "See All",
                          style: GoogleFonts.alegreyaSans(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeaturedSeeAll()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FeatureList(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Browse Categories",
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeAllCategoryPage()));
                      },
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryList(),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Top Charts",
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopChartSeeAll()));
                      },
                    ),
                  ]),
            ),
            TopChartList(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "New",
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.alegreyaSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewBookSeeAll()));
                      },
                    ),
                  ]),
            ),
            NewList(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recommended For You",
                      style: GoogleFonts.alegreyaSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            BookList(),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Center(
                  child: Text('Powered by theSOFTtribe',
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey,
                        fontSize: 14,
                      ))),
            ),
            SizedBox(
              height: 8,
            ),
          ]),
        ),
      ),
    );
  }

  // void choiceMade(String value) {
  //   print(value);
  // }
}
