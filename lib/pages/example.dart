import 'package:flutter/material.dart';

class ExpansionTileSample extends StatelessWidget {
  Widget _buildCartItems(BuildContext context, int position) {
    return _buildItem(position);
  }

  Widget _buildCartList() {
    return SafeArea(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        itemBuilder: (BuildContext context, int index) =>
            _buildCartItems(context, index),
        itemCount: 6,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Choose Gmae Day"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Text("Monday special"),
                )
              ],
            ),
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/diamond.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("September, 30")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 2.0,
          ),
          ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Choose Gmae Day"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Text("Monday special"),
                )
              ],
            ),
            children: <Widget>[Expanded(child: _buildCartList())],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int pos) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/diamond.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text("September, 30")
        ],
      ),
    );
  }
}
