import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/announcementDetail.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';
import 'package:http/http.dart' as http;

class Announcements extends StatefulWidget {
  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  
  String url = "http://info.plakala.xyz/api/ADuyurular";

  Future<List> getData() async {
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Duyurular",searchButtonIsActive: false,),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return _itemList(snapshot.data, snapshot.data.length);
          }else{
            return Center(
              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
            );
          }
        },
      ),
    );
  }

  _itemList(List list, int count){
    if(count == 0 || count == null){
      return GestureDetector(
        onTap: () {},
        child: Center(
          child: Container(
          width: double.infinity,
          height: 150,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 30, left: 30),
          decoration: BoxDecoration(border: Border.all()),
          child: ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
            title: Text("Bu Kategoride Herhangi Bir Terim Bulunmamaktadır.", style: TextStyle(fontSize: 15)),
          ),
        ),
        ),
      );
    }else{
      return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(_myTextFormat(list[index]["baslik"])),
            leading: Icon(Icons.power_input),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnnouncementDetail(
                            list: list,
                            index: index,
                          )));  
            },
          );
        },
      );
    }
  }

  _myTextFormat(String txt){
    if(txt.length > 30){
      return txt.substring(0,30) + "...";
    }else{
      return txt;
    }
  }

}