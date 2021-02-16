import 'package:african_echoes/model/book.dart';
// import 'package:african_echoes/pages/book_details.dart';
import 'package:african_echoes/pages/library_books_details.dart';
import 'package:flutter/material.dart';

class NewCardListItem extends StatelessWidget {
  final Book book;
  NewCardListItem(this.book);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final id = book.id ?? 0;
    final image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    // final title = book.title ?? "";
    // final author = book.author ?? "";

    return Container(
      // width: 155,
      padding: EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => LibraryBookDetail(book: book)));
        },
        child: Stack(
          children: <Widget>[
            // ignore: missing_required_param
            Container(
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
                // image: DecorationImage(
                //   image: NetworkImage(
                //     image,
                //   ),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 9 / 5,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/blank.png",
                    image: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         title,
            //         softWrap: false,
            //         overflow: TextOverflow.ellipsis,
            //         maxLines: 1,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       _buildSpace4(),
            //       Text(
            //         'By: $author',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //         ),
            //         overflow: TextOverflow.ellipsis,
            //         maxLines: 1,
            //         textAlign: TextAlign.center,
            //       ),
            //     ],
            //   ),
            // )
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
