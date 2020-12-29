import 'package:flutter/material.dart';
import 'myPage.dart';

class CustomList extends StatefulWidget {

  final String listTitle;
  final String listDescription;
  final Color imageColor;
  final bool isShow;

  CustomList({this.listTitle, this.listDescription, this.imageColor, this.isShow});

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {

  bool isBookmark = false;
  bool isLock = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width =  MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyPage(
          pageTitle: widget.listTitle,
          pageDescription: widget.listDescription,
        )));
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        width: width,
        //color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width*0.82,
              //color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: height*0.110,
                            width: width*0.18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: widget.imageColor
                            ),
                          ),
                          Container(
                            height: 65,
                            //color: Colors.blue,
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.listTitle,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                                Container(
                                  width: width*0.4,
                                  //color: Colors.red,
                                  child: Text(
                                    widget.listDescription,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey[400]
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        splashRadius: 1.0,
                        icon: Icon(
                          isBookmark ? Icons.bookmark : Icons.bookmark_border,
                        ),
                        onPressed: () {
                          setState(() {
                            isBookmark = !isBookmark;
                          });
                        },
                      )
                    ],
                  ),
                  if(widget.isShow == true) ... [
                    Row(
                      children: [
                        Container(
                          height: 5,
                          width: width*0.23,
                          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        Container(
                          height: 5,
                          width: width*0.23,
                          margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        Container(
                          height: 5,
                          width: width*0.23,
                          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                      ],
                    ),
                  ],
                  if(widget.isShow != true) ... [
                    SizedBox(
                      height: 15,
                    )
                  ]
                ],
              ),
            ),
            Container(
              width: width*0.1,
              child: IconButton(
                splashRadius: 1.0,
                icon: Icon(
                  isLock ? Icons.lock_outline : Icons.lock_open_rounded,
                  color: isLock ? Colors.grey[400] : Colors.grey[300],
                ),
                onPressed: () {
                  setState(() {
                    isLock = !isLock;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
