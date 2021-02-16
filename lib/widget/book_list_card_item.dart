import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';

class BookListCardItem extends StatelessWidget {
  final Book book;
  BookListCardItem(this.book);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final id = book.id ?? 0;
    final image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    // final title = book.title ?? "";
    // final author = book.author ?? "";

    return Container(
      width: 190,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => BookDetailPage(book: book)));
        },
        child: Stack(
          children: <Widget>[
            // ignore: missing_required_param
            Container(
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/blank.png",
                    image: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
