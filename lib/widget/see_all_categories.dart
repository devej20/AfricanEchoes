import 'dart:async';
import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/model/category.dart';
import 'package:african_echoes/widget/see_all_categories_item.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

class SeeAllCategoryPage extends StatefulWidget {
  @override
  _SeeAllCategoryPageState createState() => _SeeAllCategoryPageState();
}

class _SeeAllCategoryPageState extends State<SeeAllCategoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyDelivery =
      new GlobalKey<RefreshIndicatorState>();

  Completer<void> _refreshCompleter;

  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();

    _refreshCompleter = Completer<void>();

    _getCategories();
  }

  void _getCategories() {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory());
  }

  Future _refresh() async {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory());
    return _refreshCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Categories",
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child:
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(
              child: LoadingIndicator(),
            );
          } else if (state is CategoryLoaded) {
            _categories = state.categories;

            _refreshCompleter?.complete();
            _refreshCompleter = Completer();

            return _buildCategoryList(_categories);
          } else if (state is CategoryErorr) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Something went wrong!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorPrimary,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.replay,
                    color: colorSecondary,
                  ),
                  onPressed: _getCategories,
                )
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _buildCategoryItems(int position, Category category) {
    return SeeAllCategoryListItem(category: category);
  }

  Widget _buildCategoryList(List<Category> categories) {
    return RefreshIndicator(
      key: _refreshIndicatorKeyDelivery,
      onRefresh: _refresh,
      child: categories.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No category Available",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: colorPrimary),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: colorAccent,
                    ),
                    tooltip: 'Refresh',
                    onPressed: _getCategories,
                  ),
                ],
              ),
            )
          : ListView.separated(
              // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              itemBuilder: (BuildContext context, int index) =>
                  _buildCategoryItems(index, categories[index]),
              itemCount: categories.length,
              separatorBuilder: (BuildContext context, int index) {
                return HorizontalDivider();
              },
            ),
    );
  }
}
