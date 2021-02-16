import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/model/category.dart';
import 'package:african_echoes/widget/book_list_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class CategoryBooksPage extends StatefulWidget {
  final Category category;

  const CategoryBooksPage({Key key, @required this.category}) : super(key: key);

  @override
  _CategoryBooksPageState createState() => _CategoryBooksPageState();
}

class _CategoryBooksPageState extends State<CategoryBooksPage> {
  List<Book> _books = [];

  // static final int categoryId = widget.category.id;

  @override
  void initState() {
    super.initState();

    _getCategoryBooks();
  }

  void _getCategoryBooks() {
    BlocProvider.of<BookBloc>(context)
        .add(FetchBooksByCategory(categoryId: widget.category.id));
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.category.name ?? "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          title,
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
                    delegate: BookSearch(
                      books: _books,
                    ));
              })
        ],
      ),
      body: BlocBuilder<BookBloc, BookState>(builder: (context, state) {
        if (state is BookLoading) {
          return Center(
            child: LoadingIndicator(),
          );
        } else if (state is BookLoaded) {
          _books = state.books;

          return _buildBookList(_books);
        } else if (state is BookError) {
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
                IconButton(
                  icon: Icon(Icons.replay, color: Colors.black),
                  onPressed: _getCategoryBooks,
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Widget _buildBookItems(Book book) {
    return BookListItem(book: book);
  }

  Widget _buildBookList(List<Book> books) {
    Widget productCard;
    if (books.length > 0) {
      productCard = Container(
        height: double.infinity,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) =>
              _buildBookItems(books[index]),
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

class BookSearch extends SearchDelegate<Book> {
  final List<Book> books;

  BookSearch({@required this.books}) : assert(books != null);

  Widget _buildBookItems(BuildContext context, int position, Book book) {
    return BookListItem(book: book);
  }

  Widget _buildBookList(List<Book> books) {
    return books.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            itemBuilder: (BuildContext context, int index) => _buildBookItems(
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
      icon: Icon(Icons.keyboard_arrow_left),
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
    return _buildBookList(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = books
        .where((b) => b.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildBookList(result);
  }
}
