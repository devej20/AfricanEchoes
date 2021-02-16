import 'package:african_echoes/bloc/book/new_books/new_book_bloc.dart';
import 'package:african_echoes/bloc/book/new_books/new_book_event.dart';
import 'package:african_echoes/bloc/book/new_books/new_book_state.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/widget/new_book_see_all_item.dart';
import 'package:african_echoes/widget/new_card_list_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class NewBookSeeAll extends StatefulWidget {
  @override
  _NewBookSeeAllState createState() => _NewBookSeeAllState();
}

class _NewBookSeeAllState extends State<NewBookSeeAll> {
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<NewBookBloc>(context).add(FetchBooksByNewBook());
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
          'All New Books',
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
                    delegate: NewBookSearch(
                      books: _books,
                    ));
              })
        ],
      ),
      body: BlocBuilder<NewBookBloc, NewBookState>(builder: (context, state) {
        if (state is NewBookLoading) {
          return Center(
            child: LoadingIndicator(),
          );
        } else if (state is NewBookLoaded) {
          _books = state.books;

          return _buildFeatureList(_books);
        } else if (state is NewBookError) {
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

  Widget _buildNewBookItems(Book book) {
    return NewBookSeeAllItem(book: book);
  }

  Widget _buildFeatureList(List<Book> books) {
    Widget productCard;
    if (books.length > 0) {
      productCard = Container(
        height: double.infinity,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) =>
              _buildNewBookItems(books[index]),
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

class NewBookSearch extends SearchDelegate<Book> {
  final List<Book> books;

  NewBookSearch({@required this.books}) : assert(books != null);

  Widget _buildNewBookItems(BuildContext context, int position, Book book) {
    return NewCardListItem(book);
  }

  Widget _buildNewBookList(List<Book> books) {
    return books.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            itemBuilder: (BuildContext context, int index) =>
                _buildNewBookItems(
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
    return _buildNewBookList(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = books
        .where((b) => b.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildNewBookList(result);
  }
}
