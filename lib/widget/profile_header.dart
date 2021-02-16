import 'dart:io';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _imagePath;
  File _image;

  Future getImage() async {
    final SharedPreferences prefs = await _prefs;
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        prefs.setString("profile_image", pickedFile.path).then((bool success) {
          return FlushbarHelper.createSuccess(message: 'Image saved')
              .show(context);
        });
        _imagePath = prefs.getString('profile_image');
        print('_image: $_image');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        _imagePath = prefs.getString('profile_image');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: _width,
      height: _height / 2.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: getImage,
            child: Container(
              child: Center(
                  child: _imagePath == null
                      ? Image.asset("assets/images/african_echoes_logo.jpeg",
                          height: _height / 4.5, width: _width)
                      : Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.file(
                            File(_imagePath),
                            height: _height / 4,
                            width: _width,
                          ),
                        )),
            ),
          ),
          RaisedButton(
            color: Color(0xFF4ecc8f),
            onPressed: getImage,
            child: Text('Select Picture'),
          )
        ],
      ),
    );
  }
}
