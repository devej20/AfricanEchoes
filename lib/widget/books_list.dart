import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksList extends StatefulWidget {
  final int categoryId;

  const BooksList({Key key, @required this.categoryId}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<BookBloc>(context)
        .add(FetchBooksByCategory(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      if (state is BookLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      }

      if (state is BookLoaded) {
        final books = state.books;

        return _buildBookList(books);
      }

      if (state is BookError) {
        return Center();
      }
    });
  }

  Widget _buildBookItems(BuildContext context, int position, Book book) {
    return BookListItem(book: book);
  }

  Widget _buildBookList(List<Book> books) {
    Widget productCard;
    if (books.length > 0) {
      productCard = ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        itemBuilder: (BuildContext context, int index) => _buildBookItems(
          context,
          index,
          books[index],
        ),
        itemCount: books.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
            thickness: 1.6,
          );
        },
      );
    } else {
      productCard = Center(child: Text('No available books'));
    }
    return productCard;
  }
}
