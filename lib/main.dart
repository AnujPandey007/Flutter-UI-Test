import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship/customList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ));
    super.initState();
  }

  Widget myHeading(String pageHeading, {bool show = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageHeading,
                  //overflow: show ? TextOverflow.fade : TextOverflow.visible,
                  //maxLines: 1,
                  style: TextStyle(
                    color: show ? Colors.black : Colors.grey[300],
                    fontWeight: show ? FontWeight.bold : FontWeight.w400,
                    fontSize: 15
                  ),
                ),
                if(show == true) ... [
                  Container(
                    height: 3,
                    width: 30,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30)
                    ),
                  )
                ]
              ],
            ),
          ),
          Container(
            height: 5,
            width: 5,
            margin: EdgeInsets.only(left: 10.0, top: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30)
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Lessons',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28,
          ),
          color: Colors.black,
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.yellow[600],
              radius: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.yellow[800],
                radius:15.0,
                child: Stack(
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(15/360),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[600],
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: SizedBox(
                            height: 23,
                            width: 23,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "10",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 75.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  myHeading("Design", show: true),
                  myHeading("Environment"),
                  myHeading("Technology"),
                  myHeading("Research")
                ],
              ),
            ),
            CustomList(
              listTitle: "UI Design",
              listDescription: "Visual appearance of app sjd",
              imageColor: Colors.yellow,
              isShow: true,
            ),
            CustomList(
              listTitle: "UX Design",
              listDescription: "Brain behind the design",
              imageColor: Colors.blue,
              isShow: true,
            ),
            CustomList(
              listTitle: "Interaction Design",
              listDescription: "Includes animations and effective",
              imageColor: Colors.redAccent,
              isShow: false,
            ),
            CustomList(
              listTitle: "Industrial Design",
              listDescription: "Visual appearance of app &",
              imageColor: Colors.indigoAccent,
              isShow: false,
            ),
          ],
        ),
      )
    );
  }
}




