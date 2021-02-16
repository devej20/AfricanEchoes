import 'package:african_echoes/bloc/audio_book/audio_bloc.dart';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/model/book.dart';
import 'package:african_echoes/repositories/audio_repository.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:disk_space/disk_space.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;
  BookDetailPage({@required this.book});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
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
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 45,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildButton(
                      context,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              _separate(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description will appear here',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Similar Books",
                        style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
          message: "$title already exist in your library")
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
      width: 250,
      child: RaisedButton(
        color: Color(0xFFfcdc08),
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        onPressed: _checkDiskSpace,
        // onPressed: _checkDiskSpace,
        child: Text(
          "Download",
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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(color: Colors.white),
            child: FadeInImage.assetNetwork(
                placeholder: "assets/images/blank.png",
                image: image,
                fit: BoxFit.fitHeight),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 180,
                    child: Text(
                      title,
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 20,
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.launch,
                        color: Colors.black,
                      ),
                      onPressed: () {})
                ],
              ),
              _separate(),
              Text(
                author,
                style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              // _separate(),
              // Text(
              //   price,
              //   style: GoogleFonts.ubuntu(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600),
              // ),
              // _separate(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _separate() {
    return SizedBox(
      height: 7,
    );
  }

  // Widget _bookDetailItem({
  //   String title,
  // })
  // {
  //   return Row(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         title,
  //         style: GoogleFonts.ubuntu(
  //             color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),
  //       ),
  //       SizedBox(
  //         width: 10.0,
  //       ),
  //     ],
  //   );
  // }
}
