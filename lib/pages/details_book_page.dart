import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[topContent(), bottomContent],
      ),
    );
  }

  Widget topLeft() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: "Tag",
            child: Material(
              elevation: 15.0,
              child: Image(
                image: AssetImage("assets/images/african_echoes_logo.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          "1hr 30min",
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }

  Widget topRight() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text("book.title",
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 18.0)),
      ),
      SizedBox(
        height: 5.0,
      ),
      RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 14),
          children: <TextSpan>[
            TextSpan(
              text: 'By: ',
            ),
            TextSpan(text: "book.author"),
          ],
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 14),
          children: <TextSpan>[
            TextSpan(
              text: 'Narated by: ',
            ),
            TextSpan(text: 'John Doe'),
          ],
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      Row(
        children: <Widget>[],
      ),
      SizedBox(height: 32.0),
      Container(
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              side: BorderSide(color: Colors.deepOrange)),
          padding: EdgeInsets.symmetric(vertical: 5.0),
          onPressed: () {},
          color: Colors.blue,
          child:
              Text('Play', style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      )
    ]);
  }

  Widget topContent() {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft()),
          Flexible(flex: 3, child: topRight()),
        ],
      ),
    );
  }

  ///scrolling text description
  Widget bottomContent = Container(
    height: 220.0,
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "book.description",
        style: TextStyle(fontSize: 13.0, height: 1.5),
      ),
    ),
  );
}
