import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/termDetail.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';
import 'package:http/http.dart' as http;

class SearchList extends StatefulWidget {
  
  String termDepartment;
  String termName;

  SearchList({this.termDepartment, this.termName});

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  
    Future<List> getData() async{
    final response = await http.get("http://info.plakala.xyz/api/ATerimAra?bolum="+ widget.termDepartment + "&kelime=" + widget.termName);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Terim Arama",
        searchButtonIsActive: false,
      ),
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
    if(count != 0){
      return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(list[index]["terimAd"]),
            leading: Icon(Icons.power_input),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermDetail(list: list, index: index,)));
            },
          );
        },
      );
    }else{
      return Center(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nÜzgünüm...\nAradığın Terimi Bulamadım\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
      );
    }
    
  }

}