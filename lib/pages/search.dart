import 'package:flutter/material.dart';

class CustomSearchClass extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];

    // ignore: dead_code
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //   searchResult.clear();

    //  searchResult =
    //    (where to search).where((element) => element.startsWith(query)).toList();

    // return Container(
    //   margin: EdgeInsets.all(20),
    //   child: ListView(
    //       padding: EdgeInsets.only(top: 8, bottom: 8),
    //       scrollDirection: Axis.vertical,
    //       children: List.generate(searchResult.length, (index) {
    //         var item = searchResult[index];
    //         return Card(
    //           color: Colors.white,
    //           child: Container(padding: EdgeInsets.all(16), child: Text(item)),
    //         );
    //       })),
    // );
    // ignore: dead_code
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    throw UnimplementedError();
  }
}
