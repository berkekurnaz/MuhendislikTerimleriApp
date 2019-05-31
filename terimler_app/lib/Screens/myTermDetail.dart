import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Utils/DatabaseHelper.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class MyTermDetail extends StatefulWidget {
  
  String termName;
  String termDescription;
  int termId;

  MyTermDetail({this.termName, this.termDescription, this.termId});

  @override
  _MyTermDetailState createState() => _MyTermDetailState();
}

class _MyTermDetailState extends State<MyTermDetail> {
  
  DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper =DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Terim Detayları",searchButtonIsActive: false,),
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
                    widget.termName,
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
                    widget.termDescription,
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
                      side: BorderSide(width: 0)),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.black),
                        child: Text("Geriye Dön"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.black),
                        child: Text("Terimi Sil"),
                        onPressed: () {
                          _terimSil(widget.termId);
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _terimSil(int id){
    showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text("Terim Silme Ekranı"),
          children: <Widget>[
            Text("Terimi Silmek İstediğinize Emin Misiniz?",textAlign: TextAlign.center,),
            ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.black),
                        child: Text("Vazgeç"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      OutlineButton(
                        borderSide: BorderSide(color: Colors.black),
                        child: Text("Terimi Sil"),
                        onPressed: () {
                          databaseHelper.benimTerimlerimSil(id).then((value){
                            if(value != 0){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                            }
                          });
                        },
                      ),
                    ],
            ),
          ],
        );
      }
    );
  }

}