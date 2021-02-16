import 'package:african_echoes/bloc/book/new_books/new_book_bloc.dart';
import 'package:african_echoes/bloc/book/new_books/new_book_event.dart';
import 'package:african_echoes/bloc/book/new_books/new_book_state.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';
import '../repositories/repositories.dart';
import 'new_card_list_item.dart';

class NewBookList extends StatefulWidget {
  @override
  _NewBookListState createState() => _NewBookListState();
}

class _NewBookListState extends State<NewBookList> {
  List<Book> books = BooksRepository.loadProducts();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<NewBookBloc>(context).add(FetchBooksByNewBook());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return BlocBuilder<NewBookBloc, NewBookState>(builder: (context, state) {
      if (state is NewBookLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      }

      if (state is NewBookLoaded) {
        final books = state.books;

        return _buildNewBookList(books);
      }

      if (state is NewBookError) {
        return Center();
      }
    });
  }

  Widget _buildNewBookItems(int position, Book book) {
    return NewCardListItem(book);
  }

  Widget _buildNewBookList(List<Book> books) {
    Widget bookCard;
    if (books.length > 0) {
      bookCard = Container(
        height: 170,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => _buildNewBookItems(
            index,
            books[index],
          ),
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 0.6,
            childAspectRatio: 77 / 50,
          ),
        ),
      );
    } else {
      bookCard = Center(child: Text("No available features"));
    }
    return bookCard;
  }
}
