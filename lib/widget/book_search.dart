import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';

class BookSearch extends SearchDelegate<Book> {
  final List<Book> books;
  BookSearch(this.books);

  Widget _buildBookItems(BuildContext context, int position, Book book) {
    return BookListItem(book: book);
  }

  Widget _buildBookList(List<Book> books) {
    Widget bookCard;
    if (books.length > 0) {
      bookCard = SafeArea(
        child: ListView.separated(
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
        ),
      );
    } else {
      bookCard = Center(child: Text(''));
    }
    return bookCard;
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
        .where((b) => b.title.toLowerCase().contains(query.toLowerCase()))
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
