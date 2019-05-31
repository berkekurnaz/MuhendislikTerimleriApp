import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:terimler_app/Models/terim.dart';
import 'package:terimler_app/Screens/termDetail.dart';
import 'package:terimler_app/Utils/DatabaseHelper.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

import 'package:connectivity/connectivity.dart';

class TermList extends StatefulWidget {
  String termDepartment;

  TermList({this.termDepartment});

  @override
  _TermListState createState() => _TermListState();
}

class _TermListState extends State<TermList> {
  
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List tumTerimler = [];
  String url = "http://info.plakala.xyz/api/ATerimler?bolum=";

  Future<List> getData() async {
    final response = await http.get(url + widget.termDepartment);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "${widget.termDepartment} Terimleri",
        searchButtonIsActive: true,
        department: widget.termDepartment,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return itemList(snapshot.data, snapshot.data.length);
          } else {
            return Center(
              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
            );
          }
        },
      ),
    );
  }

  /*
   _myBodyRender() async{
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.wifi || result ==ConnectivityResult.mobile){
      return Text("internet var");
    }else{
      return Center(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nİnternet Bağlantısı Bulunmuyor\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
      );
    }
  }
  */
  
  Widget itemList(List list, int count) {
    if (count == 0 || count == null) {
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
    } else {
      return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]["terimAd"]),
            leading: Icon(Icons.power_input),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TermDetail(
                            list: list,
                            index: index,
                          )));
            },
          );
        },
      );
    }
  }
}
