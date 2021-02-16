import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';

class TopChartCardListItem extends StatelessWidget {
  final Book book;
  final int index;
  TopChartCardListItem(this.book, this.index);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final id = book.id ?? 0;
    final image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    final imageNumber = "assets/images/${index + 1}.jpg";
    // final title = book.title ?? "";
    // final author = book.author ?? "";

    return Container(
      // width: 390,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => BookDetailPage(book: book)));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 176,
              width: 100,
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
                  child: Image.asset(
                    imageNumber,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: 176,
              width: 100,
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

    /*return Container(
      width: 155,
      padding: EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 10),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, "/bookDetails");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => BookDetailPage(book: book)));
        },
        child: GridTile(
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/african_echoes_logo.png",
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          footer: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: colorSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                _buildSpace4(),
                Text(
                  'By: $author',
                  style: TextStyle(
                    color: colorSecondary,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
  }

  // SizedBox _buildSpace4() {
  //   return SizedBox(
  //     height: 4.0,
  //   );
  // }
}
