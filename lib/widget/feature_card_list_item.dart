import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';

class FeatureCardListItem extends StatelessWidget {
  final Book book;

  FeatureCardListItem(this.book);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final id = book.id ?? 0;
    final image = book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    final title = book.title ?? "";
    final author = book.author ?? "";
    final subTitle = book.subTitle ?? "";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 3))
          ],
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
        width: double.infinity,
        padding: EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 4),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext cotext) => BookDetailPage(book: book)));
          },
          child: Row(
            children: <Widget>[
              Container(
                height: 170,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.network(
                    image,
                    height: 150,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // reduce container width here
              Container(
                constraints: BoxConstraints.tight(Size.fromWidth(220)),
                width: 350,
                child: Container(
                    height: 140,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 240,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                author,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                subTitle,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: <Widget>[
                                    Text('Read More',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
