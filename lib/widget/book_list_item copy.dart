import 'package:african_echoes/colors.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  BookListItem({@required this.book});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final int id = book.id ?? 0;
    final String image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    final String title = book.title ?? "";
    // ignore: unused_local_variable
    final String subtitle = book.subTitle ?? "";
    final String author = book.author ?? "";
    final String narrator = book.narrator ?? "";

    // return ListTile();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext cotext) => BookDetailPage(book: book)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 110,
              height: 140,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/blank.png",
                image: image,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorSecondary,
                      ),
                    ),
                  ),
                  _buildSpace8(),
                  _buildItem(
                    ctx: context,
                    title: "By: ",
                    subtitle: author,
                  ),
                  _buildSpace4(),
                  _buildItem(
                    ctx: context,
                    title: "Narated by: ",
                    subtitle: narrator,
                  ),
                  _buildSpace4(),
                  _buildItem(
                    ctx: context,
                    title: "Lenght: ",
                    subtitle: "1hr",
                  ),
                  _buildSpace4(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  _buildSubtitle({
    @required BuildContext ctx,
    @required String date,
    @required String consumerName,
    @required String deliveryMethod,
    @required String paymentMethod,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSpace4(),
        _buildItem(
          ctx: ctx,
          title: "Date",
          subtitle: date,
        ),
        _buildSpace4(),
        _buildItem(
          ctx: ctx,
          title: "Consumer Name",
          subtitle: consumerName,
        ),
        _buildSpace4(),
        _buildItem(
          ctx: ctx,
          title: "Delivery Method",
          subtitle: deliveryMethod,
        ),
        _buildSpace4(),
        _buildItem(
          ctx: ctx,
          title: "Payment Method",
          subtitle: paymentMethod,
        ),
        SizedBox(height: 8.0),
      ],
    );
  }

  RichText _buildItem({
    @required BuildContext ctx,
    @required String title,
    @required String subtitle,
  }) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          fontSize: 12,
          color: colorSecondary,
        ),
        children: <TextSpan>[
          TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
            text: subtitle,
          ),
        ],
      ),
    );
  }

  SizedBox _buildSpace8() {
    return SizedBox(
      height: 8.0,
    );
  }

  SizedBox _buildSpace4() {
    return SizedBox(
      height: 4.0,
    );
  }
}
