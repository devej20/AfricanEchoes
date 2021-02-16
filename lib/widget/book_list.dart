import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../model/book.dart';
import '../repositories/repositories.dart';
import 'book_list_card_item.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<Book> books = BooksRepository.loadProducts();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<BookBloc>(context).add(FetchBooks());
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

  Widget _buildBookItems(int position, Book book) {
    return BookListCardItem(book);
  }

  Widget _buildBookList(List<Book> books) {
    Widget bookCard;
    if (books.length > 0) {
      bookCard = Container(
        height: 170,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => _buildBookItems(
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
      bookCard = Center(child: Text("No available books"));
    }
    return bookCard;
  }
}
