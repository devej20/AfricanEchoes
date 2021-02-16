import 'package:african_echoes/bloc/book/book.dart';
import 'package:african_echoes/bloc/book/book_bloc.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/widget/book_list_item.dart';
import 'package:african_echoes/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';

class BookSearchPage extends SearchDelegate<Book> {
  List<Book> books = [];

  // BookSearch({@required this.books}) : assert(books != null);

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
            color: Colors.black,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // BlocProvider.of<BookBloc>(context).add(FetchBooks());
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      if (state is BookLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      } else if (state is BookLoaded) {
        books = state.books;

        final result = state.books
            .where((b) =>
                b.title.toLowerCase().contains(query.toLowerCase()) ||
                b.author.toLowerCase().contains(query.toLowerCase()) ||
                b.narrator.toLowerCase().contains(query.toLowerCase()) ||
                b.publisher.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return _buildBookList(result);
      } else if (state is BookError) {
        return Center();
      } else {
        return Container();
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      if (state is BookLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      } else if (state is BookLoaded) {
        books = state.books;

        final result = state.books
            .where((b) =>
                b.title.toLowerCase().contains(query.toLowerCase()) ||
                b.author.toLowerCase().contains(query.toLowerCase()) ||
                b.narrator.toLowerCase().contains(query.toLowerCase()) ||
                b.publisher.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return _buildBookList(result);
      } else if (state is BookError) {
        return Center();
      } else {
        return Container();
      }
    });
  }
}
