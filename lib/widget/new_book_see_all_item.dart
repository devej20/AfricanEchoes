import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBookSeeAllItem extends StatelessWidget {
  final Book book;
  NewBookSeeAllItem({@required this.book});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final int id = book.id ?? 0;
    final String image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    final String title = book.title ?? "";
    // ignore: unused_local_variable
    // final String subtitle = book.subTitle ?? "";
    final String author = book.author ?? "";
    // final String narrator = book.narrator ?? "";

    return Container(
      width: 100,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => BookDetailPage(book: book)));
        },
        child: Column(
          children: [
            Container(
              height: 230,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                author,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 17),
              ),
            ),
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
        style: GoogleFonts.ubuntu(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        children: <TextSpan>[
          TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
            text: subtitle,
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
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
