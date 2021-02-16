import 'package:african_echoes/model/category.dart';
import 'package:african_echoes/pages/category_books_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllCategoryListItem extends StatelessWidget {
  final Category category;
  SeeAllCategoryListItem({@required this.category});

  @override
  Widget build(BuildContext context) {
    final name = category.name ?? "";

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CategoryBooksPage(
                      category: category,
                    )));
      },
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              name,
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
            trailing: Wrap(
              spacing: 12, // space between two icons
              children: <Widget>[
                // Image.network(src), add symbol image here
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
