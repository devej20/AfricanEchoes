import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/pages/book_details.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final Book book;
  CartListItem(this.book);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext cotext) => BookDetailPage(book: book)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 110,
                height: 80,
                margin: EdgeInsets.only(right: 7.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(book.coverImage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(book.title,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    SizedBox(
                      height: 4.0,
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By: ',
                          ),
                          TextSpan(text: book.author),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Narated by: ',
                          ),
                          TextSpan(text: 'John Doe'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Lenght: ',
                          ),
                          TextSpan(text: '1hr'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Release date: ',
                          ),
                          TextSpan(text: '5/09/19'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
