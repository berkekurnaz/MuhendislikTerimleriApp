import 'package:flutter/material.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class AnnouncementDetail extends StatefulWidget {
  
  List list;
  int index;

  AnnouncementDetail({this.list, this.index});
  
  @override
  _AnnouncementDetailState createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Duyuru Detay", searchButtonIsActive: false,),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1)),
                child: ListTile(
                  title: Text(
                    widget.list[widget.index]["baslik"],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1)),
                child: ListTile(
                  title: Text(
                    widget.list[widget.index]["eklenmeTarihi"],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1)),
                child: ListTile(
                  title: Text(
                    widget.list[widget.index]["icerik"],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}