import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {

  final pageTitle;
  final pageDescription;
  MyPage({this.pageTitle, this.pageDescription});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),
        ),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            widget.pageDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.grey[300],
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
