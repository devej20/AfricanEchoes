import 'package:african_echoes/model/category.dart';
import 'package:african_echoes/pages/category_books_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  CategoryListItem({@required this.category});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/splash.jpeg"),
            //   fit: BoxFit.fill,
            // ),
            // border: Border.symmetric(
            //   vertical: BorderSide(
            //     color: Colors.grey,
            //     width: 2.0,
            //   ),
            // ),
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(const Radius.circular(24)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(1),
            //     spreadRadius: 2,
            //     blurRadius: 2,
            //     offset: Offset(5, 5),
            //   ),
            // ],
          ),
          child: Center(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
