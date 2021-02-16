import 'package:african_echoes/bloc/book/featured/featured_bloc.dart';
import 'package:african_echoes/bloc/book/featured/featured_event.dart';
import 'package:african_echoes/bloc/book/featured/featured_state.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/widget/feature_card_list_item.dart';
import 'package:african_echoes/widget/featured_see_all_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class FeaturedSeeAll extends StatefulWidget {
  @override
  _FeaturedSeeAllState createState() => _FeaturedSeeAllState();
}

class _FeaturedSeeAllState extends State<FeaturedSeeAll> {
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FeaturedBloc>(context).add(FetchBooksByFeatured());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'All Featured Books',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: FeaturedSearch(
                      books: _books,
                    ));
              })
        ],
      ),
      body: BlocBuilder<FeaturedBloc, FeaturedState>(builder: (context, state) {
        if (state is FeaturedLoading) {
          return Center(
            child: LoadingIndicator(),
          );
        } else if (state is FeaturedLoaded) {
          _books = state.books;

          return _buildFeatureList(_books);
        } else if (state is FeaturedError) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Something went wrong!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorSecondary,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _buildFeatureItems(Book book) {
    return FeaturedSeeAllItem(book: book);
  }

  Widget _buildFeatureList(List<Book> books) {
    Widget productCard;
    if (books.length > 0) {
      productCard = Container(
        height: double.infinity,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) =>
              _buildFeatureItems(books[index]),
          scrollDirection: Axis.vertical,
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 0.5,
            childAspectRatio: 2 / 3.5,
          ),
        ),
      );
    } else {
      productCard = Center(child: Text('No available books'));
    }
    return productCard;
  }
}

class FeaturedSearch extends SearchDelegate<Book> {
  final List<Book> books;

  FeaturedSearch({@required this.books}) : assert(books != null);

  Widget _buildFeatureItems(BuildContext context, int position, Book book) {
    return FeatureCardListItem(book);
  }

  Widget _buildFeatureList(List<Book> books) {
    return books.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            itemBuilder: (BuildContext context, int index) =>
                _buildFeatureItems(
              context,
              index,
              books[index],
            ),
            itemCount: books.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 4,
                thickness: 1.6,
                color: colorSecondaryLight,
              );
            },
          )
        : Center(child: Text('No Books Found'));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = books
        .where((b) =>
            b.title.toLowerCase().contains(query.toLowerCase()) ||
            b.author.toLowerCase().contains(query.toLowerCase()) ||
            b.narrator.toLowerCase().contains(query.toLowerCase()) ||
            b.publisher.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildFeatureList(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = books
        .where((b) => b.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildFeatureList(result);
  }
}
