import 'package:african_echoes/bloc/bloc.dart';
import 'package:african_echoes/model/audio_book.dart';
import 'package:african_echoes/model/model.dart';
import 'package:african_echoes/repositories/repositories.dart';
import 'package:african_echoes/widget/see_all_books.dart';
import 'package:african_echoes/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioBookList extends StatefulWidget {
  @override
  _AudioBookListState createState() => _AudioBookListState();
}

class _AudioBookListState extends State<AudioBookList> {
  List<Book> books = BooksRepository.loadProducts();

  final AudioBloc audioBloc = AudioBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AudioBook>>(
        stream: audioBloc.audios,
        builder: (context, AsyncSnapshot<List<AudioBook>> snapshot) {
          return _buildAudioList(snapshot);
        });
  }

  Widget _buildAudioItems(BuildContext context, int position, AudioBook book) {
    return AudioBookListItem(book);
  }

  Widget _buildAudioList(AsyncSnapshot<List<AudioBook>> snapshot) {
    if (snapshot.hasData) {
      return snapshot.data.length != 0
          ? ListView(
              children: [
                Container(
                  height: 410,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10, bottom: 15),
                    child: GridView.builder(
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: _buildAudioItems(
                          context,
                          index,
                          snapshot.data[index],
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 0.6,
                        childAspectRatio: 7 / 4.5,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Customers Also Bought",
                          style: GoogleFonts.alegreyaSans(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Row(
                            children: [
                              Text(
                                "See All",
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllBooks()));
                          },
                        ),
                      ]),
                ),
                BookList(),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Center(
                      child: Text('Powered by theSOFTtribe',
                          style: GoogleFonts.ubuntu(
                            color: Colors.grey,
                            fontSize: 14,
                          ))),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            )
          : Center(child: Text('No Purchased Book Available'));
    } else {
      audioBloc.getAudios();
      return LoadingIndicator();
    }
  }
}
