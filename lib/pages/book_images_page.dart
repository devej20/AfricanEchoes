import 'dart:async';
import 'package:african_echoes/bloc/book_images/book_images_bloc.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colors.dart';

class BookImagePage extends StatefulWidget {
  @override
  _BookImagePageState createState() => _BookImagePageState();
}

class _BookImagePageState extends State<BookImagePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyDelivery =
      new GlobalKey<RefreshIndicatorState>();

  Completer<void> _refreshCompleter;

  List<BookImage> _images = [];

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();

    _getBookImages();
  }

  void _getBookImages() {
    BlocProvider.of<BookImagesBloc>(context).add(FetchBookImages());
  }

  Future _refresh() async {
    BlocProvider.of<BookImagesBloc>(context).add(FetchBookImages());
    return _refreshCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset("assets/images/african_echoes_logo.jpeg"),
        ),
        title: Text(
          "afrikan echoes publishers",
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: BookImagesSearch(
                      images: _images,
                    ));
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/african_echoes_logo.jpeg"),
            colorFilter: ColorFilter.mode(
              Colors.grey.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<BookImagesBloc, BookImagesState>(
            builder: (context, state) {
          if (state is BookImagesLoading) {
            return Center(child: LoadingIndicator());
          } else if (state is BookImagesLoaded) {
            _images = state.images;

            _refreshCompleter?.complete();
            _refreshCompleter = Completer();

            return _buildBookImageList(_images);
          } else if (state is BookImagesError) {
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
                    icon: Icon(Icons.replay, color: colorPrimary),
                    onPressed: _getBookImages,
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _buildBookImageItems(
      BuildContext context, int position, BookImage bookImage) {
    return BookImageListItem(bookImage: bookImage);
  }

  Widget _buildBookImageList(List<BookImage> bookImages) {
    return RefreshIndicator(
      key: _refreshIndicatorKeyDelivery,
      onRefresh: _refresh,
      child: bookImages.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No Images Available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorSecondary,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: colorPrimary,
                    ),
                    tooltip: 'Refresh',
                    onPressed: _getBookImages,
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                  _buildBookImageItems(
                context,
                index,
                bookImages[index],
              ),
              itemCount: bookImages.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 4,
                  thickness: 2,
                  color: colorSecondaryLight,
                );
              },
            ),
    );
  }
}

class BookImagesSearch extends SearchDelegate<Book> {
  final List<BookImage> images;
  BookImagesSearch({@required this.images}) : assert(images != null);

  Widget _buildBookItems(BuildContext context, int position, BookImage image) {
    return BookImageListItem(bookImage: image);
  }

  Widget _buildBookList(List<BookImage> images) {
    return images.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            itemBuilder: (BuildContext context, int index) => _buildBookItems(
              context,
              index,
              images[index],
            ),
            itemCount: images.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 4,
                thickness: 1.6,
                color: colorSecondaryLight,
              );
            },
          )
        : Center(child: Text('No Images Found'));
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
    final result = images
        .where((b) => b.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildBookList(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = images
        .where((b) => b.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildBookList(result);
  }
}
