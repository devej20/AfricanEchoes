import 'package:african_echoes/bloc/book/featured/featured_bloc.dart';
import 'package:african_echoes/bloc/book/featured/featured_event.dart';
import 'package:african_echoes/bloc/book/featured/featured_state.dart';
import 'package:african_echoes/widget/feature_card_list_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';
import '../repositories/repositories.dart';

class FeatureList extends StatefulWidget {
  @override
  _FeatureListState createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  List<Book> books = BooksRepository.loadProducts();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FeaturedBloc>(context).add(FetchBooksByFeatured());
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return BlocBuilder<FeaturedBloc, FeaturedState>(builder: (context, state) {
      if (state is FeaturedLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      }

      if (state is FeaturedLoaded) {
        final books = state.books;

        return _buildFeatureList(books);
      }

      if (state is FeaturedError) {
        return Center();
      }
    });
  }

  Widget _buildFeatureItems(int position, Book book) {
    return FeatureCardListItem(book);
  }

  Widget _buildFeatureList(List<Book> books) {
    Widget bookCard;
    if (books.length > 0) {
      bookCard = Container(
        width: double.infinity,
        height: 200,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) => _buildFeatureItems(
            index,
            books[index],
          ),
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 5 / 10,
          ),
        ),
      );
    } else {
      bookCard = Center(child: Text("No available features"));
    }
    return bookCard;
  }
}
