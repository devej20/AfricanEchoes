import 'package:african_echoes/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookImageListItem extends StatelessWidget {
  final BookImage bookImage;

  const BookImageListItem({Key key, @required this.bookImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String image = bookImage.image ?? "";
    final String name = bookImage.name ?? "";
    final String bookTitle = bookImage.bookTitle ?? "";
    return ListTile(
      leading: Container(
        width: 60,
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
      title: _buildItem(
        ctx: context,
        title: "Name",
        subtitle: name,
      ),
      subtitle: _buildItem(
        ctx: context,
        title: "Book: ",
        subtitle: bookTitle,
      ),
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
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        children: <TextSpan>[
          TextSpan(
            text: "$title: ",
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextSpan(
            text: subtitle,
            style: GoogleFonts.ubuntu(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
}
