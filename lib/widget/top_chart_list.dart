import 'package:african_echoes/bloc/book/top_chart/top_chart_bloc.dart';
import 'package:african_echoes/bloc/book/top_chart/top_chart_event.dart';
import 'package:african_echoes/bloc/book/top_chart/top_chart_state.dart';
import 'package:african_echoes/widget/top_chart_card_list_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/book.dart';
import '../repositories/repositories.dart';

class TopChartList extends StatefulWidget {
  @override
  _TopChartListState createState() => _TopChartListState();
}

class _TopChartListState extends State<TopChartList> {
  List<Book> books = BooksRepository.loadProducts();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<TopChartBloc>(context).add(FetchBooksByTopChart());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return BlocBuilder<TopChartBloc, TopChartState>(builder: (context, state) {
      if (state is TopChartLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      }

      if (state is TopChartLoaded) {
        final books = state.books;

        return _buildTopChartList(books);
      }

      if (state is TopChartError) {
        return Center();
      }
    });
  }

  Widget _buildTopChartItems(int index, Book book) {
    return TopChartCardListItem(book, index);
  }

  Widget _buildTopChartList(List<Book> books) {
    Widget bookCard;
    if (books.length > 0) {
      bookCard = Container(
        height: 170,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => _buildTopChartItems(
            index,
            books[index],
          ),
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 0.6,
            childAspectRatio: 77 / 100,
          ),
        ),
      );
    } else {
      bookCard = Center(child: Text("No available features"));
    }
    return bookCard;
  }
}
