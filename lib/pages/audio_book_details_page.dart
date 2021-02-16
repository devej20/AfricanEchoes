import 'package:african_echoes/pages/media_player_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../colors.dart';
import '../model/audio_book.dart';

class AudioBookDetailsPage extends StatefulWidget {
  final AudioBook audio;

  const AudioBookDetailsPage({Key key, @required this.audio}) : super(key: key);

  @override
  _AudioBookDetailsPageState createState() => _AudioBookDetailsPageState();
}

class _AudioBookDetailsPageState extends State<AudioBookDetailsPage> {
  String image;
  String title;
  String subtitle;
  String author;
  String narrator;

  @override
  Widget build(BuildContext context) {
    image = widget.audio.bookCoverImage ?? "";
    title = widget.audio.bookTitle ?? "";
    subtitle = widget.audio.bookSubtitle ?? "";
    author = widget.audio.bookAuthor ?? "";
    narrator = widget.audio.bookNarrator ?? "";

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.ubuntu(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          topContent(),
          bottomContent(),
        ],
      ),
    );
  }

  Widget topContent() {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      // height: _height / 1,
      width: _width / 1,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Hero(
                tag: "Tag",
                child: Material(
                  elevation: 15.0,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/african_echoes_logo.jpeg',
                    image: image,
                    fit: BoxFit.fill,
                    height: _height / 2.5,
                  ),
                ),
              ),
            ),
            // Text(
            //   "1hr 30min",
            //   style: TextStyle(fontSize: 14, color: Colors.white),
            // )
          ],
        ),
      ),
    );
  }

  ///scrolling text description
  Widget bottomContent() {
    return Expanded(
      flex: 1,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 16.0, color: Colors.black)),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontSize: 14, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'By: ',
                ),
                TextSpan(text: author),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(fontSize: 14, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Narrated by: ',
                ),
                TextSpan(text: narrator),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "1hr 30min",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          // Text(
          //   "Description",
          //   style: Theme.of(context).textTheme.headline5,
          // ),
          // Text(
          //   "book.description",
          //   style: TextStyle(
          //     fontSize: 16.0,
          //     height: 1.5,
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext cotext) => MediaPlayerPage(
                            audioBook: widget.audio,
                          )));
                },
                color: Color(0xFFfcdc08),
                child: Text('Play',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
