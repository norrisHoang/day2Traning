import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatelessWidget {
  final String textTest;
  TextEditingController _textController = TextEditingController();

  SecondScreen(this.textTest);

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
  }

  void _clearText() {
    _textController.clear();
  }
  @override
  Widget build(BuildContext context) {
    DateTime pre_backpress = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 95,
                    width: 383,
                    padding: const EdgeInsets.only(left: 10.0, top: 35.0),
                    child: Text(textTest)),
                Container(
                    height: 95,
                    width: 383,
                    padding: const EdgeInsets.only(left: 10.0, top: 35.0),
                    child: TextButton(
                      child: Text('Logout'),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _clearText();
                        Navigator.pop(context);
                      },
                    )),
              ]),
        ),
      ),
    );
  }
}
