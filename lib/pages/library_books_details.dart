import 'package:african_echoes/bloc/audio_book/audio_bloc.dart';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/repositories/audio_repository.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class LibraryBookDetail extends StatefulWidget {
  final Book book;
  LibraryBookDetail({@required this.book});

  @override
  _LibraryBookDetailState createState() => _LibraryBookDetailState();
}

class _LibraryBookDetailState extends State<LibraryBookDetail> {
  final AudioBloc audioBloc = AudioBloc();
  double audioFileSize;

  int id;
  String image;
  String title;
  String subTitle;
  String author;
  String narrator;
  String category;
  String publisher;
  String language;

  @override
  void initState() {
    super.initState();

    audioFileSize = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    id = widget.book.id ?? 0;
    image = widget.book.coverImage ??
        "http://173.248.135.167/africanechoes/uploads/images/african_echoes_logo.jpeg";
    title = widget.book.title ?? "";
    subTitle = widget.book.subTitle ?? "";
    author = widget.book.author ?? "";
    narrator = widget.book.narrator ?? "";
    category = widget.book.category ?? "";
    publisher = widget.book.publisher ?? "";
    language = widget.book.language ?? "";
    audioFileSize = widget.book.audioFileSize ?? 0.0;

    // ignore: unused_local_variable
    final textStyle = Theme.of(context).textTheme.headline6;
    // ignore: unused_local_variable
    TextStyle titleTextStyle = Theme.of(context).textTheme.headline6;
    // ignore: unused_local_variable
    TextStyle subtitleTextStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 16.0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.book.title,
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBookDetails(),
              HorizontalDivider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        children: <TextSpan>[
                          // TextSpan(
                          //   style: GoogleFonts.ubuntu(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 15),
                          //   text: 'Price: ',
                          // ),
                          // TextSpan(
                          //     style: GoogleFonts.ubuntu(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15),
                          //     text: 'GHc5'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildButton(
                      context,
                    ),
                  ],
                ),
              ),
              HorizontalDivider(),
              Container(
                padding: EdgeInsets.fromLTRB(
                  10,
                  8,
                  10,
                  1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Similar Genres",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    BookList(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  _horizontalD() {
    return Divider(
      height: 4,
      thickness: 2,
    );
  }

  _checkDiskSpace() async {
    var availableDisKspace = await DiskSpace.getFreeDiskSpace;

    if (availableDisKspace > (audioFileSize + 1)) {
      _checkAudioBookExist();
    } else {
      FlushbarHelper.createInformation(
        message:
            "Not enough available space, available space $availableDisKspace, file size: $audioFileSize",
      )..show(context);
    }
  }

  _checkAudioBookExist() async {
    AudioRepository repository = AudioRepository();

    if (await repository.audioBookExist(title)) {
      FlushbarHelper.createInformation(
          message: "Audio Book $title already exist in playlist")
        ..show(context);
    } else {
      _addDownloadTask();
    }
  }

  _addDownloadTask() {
    var uuid = Uuid().v1();
    audioBloc.addAudio(AudioBook.fromBook(widget.book, uuid));

    // BlocProvider.of<DownloadTaskBloc>(context)
    //     .add(AddDownload(book: widget.book));
    // Navigator.popUntil(context, ModalRoute.withName(homeRoute));
  }

  Container _buildButton(
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(color: Colors.white)),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        onPressed: _checkDiskSpace,
        // onPressed: _checkDiskSpace,
        child: Text(
          "Play",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildBookDetails() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: FadeInImage.assetNetwork(
              placeholder: "assets/images/african_echoes_logo.jpeg",
              image: image,
              fit: BoxFit.fitHeight),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              _separate(),
              _bookDetailItem(title: "Language: ", subtitle: language),
              _separate(),
              _bookDetailItem(title: "Duration: ", subtitle: ""),
              _separate(),
              _bookDetailItem(title: "By: ", subtitle: author),
              _separate(),
              _bookDetailItem(title: "Narrated by: ", subtitle: narrator),
              _separate(),
              _bookDetailItem(title: "Publisher: ", subtitle: publisher),
              _separate(),
              _bookDetailItem(title: "Category: ", subtitle: category),
              _separate(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _separate() {
    return SizedBox(
      height: 10,
    );
  }

  Widget _bookDetailItem({String title, String subtitle}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        // RichText(
        //   text: TextSpan(
        //       style: Theme.of(context).textTheme.headline6.copyWith(),
        //       children: <TextSpan>[
        //         TextSpan(
        //           text: title,
        //         ),
        //         TextSpan(
        //           text: subtitle,
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //       ]),
        // ),
      ],
    );
  }
}
