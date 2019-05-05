import 'package:flutter/material.dart';
import 'package:terimler_app_mobil/Screens/home.dart';
import 'package:terimler_app_mobil/Widgets/myAppBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TermList extends StatefulWidget {
  String bolum = "";

  TermList({this.bolum});

  @override
  State<StatefulWidget> createState() => _TermListState();
}

class _TermListState extends State<TermList> {

  Future<List> getData() async {
    final response = await http
        .get("http://info.plakala.xyz/api/ATerimler?bolum=" + widget.bolum);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                  count: snapshot.data.length,
                )
              : Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  int count;

  ItemList({this.list, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMyCommentList(list, count),
    );
  }

  ListView getMyCommentList(List list, int count) {
    if (count == 0 || count == null) {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, i) {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Icon(
                    Icons.announcement,
                    color: Colors.green,
                    size: 50.0,
                  ),
                  Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child:
                              Icon(Icons.directions_car, color: Colors.white),
                        ),
                        title: Text(
                          "Bu Kategoriye Ait Yorum Bulunamadı",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: OutlineButton(
                      child: Text("Anasayfaya Dön"),
                      borderSide: BorderSide(
                        color: Colors.black87,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: OutlineButton(
                      child: Text("Yeni Bir Yorum Ekle"),
                      borderSide: BorderSide(
                        color: Colors.black87,
                        style: BorderStyle.solid,
                        width: 2.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: count,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {

              },
              child: Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: Icon(Icons.directions_car, color: Colors.white),
                      ),
                      title: Text(
                        list[i]['terimAd'],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("Plaka : ${list[i]['terimAd']}",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
