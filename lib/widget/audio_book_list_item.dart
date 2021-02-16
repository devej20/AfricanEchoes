import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioBookListItem extends StatelessWidget {
  final AudioBook audio;
  AudioBookListItem(this.audio);

  @override
  Widget build(BuildContext context) {
    final String image = audio.bookCoverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.png";
    final String title = audio.bookTitle ?? "";
    final String author = audio.bookAuthor ?? "";
    return Column(
      children: [
        Container(
            width: 250,
            padding: EdgeInsets.only(left: 4, top: 30, right: 4, bottom: 0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext cotext) => AudioBookDetailsPage(
                            audio: audio,
                          )));
                },
                child: Column(children: <Widget>[
                  // ignore: missing_required_param
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 1.6,
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/blank.png",
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
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
                  SizedBox(
                    height: 7,
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
                ]))),
      ],
    );
  }
}
