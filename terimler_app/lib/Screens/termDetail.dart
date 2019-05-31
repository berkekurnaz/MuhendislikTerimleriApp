import 'package:flutter/material.dart';
import 'package:terimler_app/Models/terim.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Utils/DatabaseHelper.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class TermDetail extends StatefulWidget {
  List list;
  int index;

  TermDetail({this.list, this.index});

  @override
  _TermDetailState createState() => _TermDetailState();
}

class _TermDetailState extends State<TermDetail> {
  DatabaseHelper databaseHelper;
  List<Terim> benimTerimlerim;

  @override
  void initState() {
    super.initState();
    databaseHelper =DatabaseHelper();
  }

  void _kategoriListesiniGetir() {
    databaseHelper.benimTerimlerimListesiniGetir().then((value) {
      setState(() {
        benimTerimlerim = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if(benimTerimlerim ==null){
      benimTerimlerim = List<Terim>();
      _kategoriListesiniGetir();
    }

    return Scaffold(
      appBar: MyAppBar(
        title: "Terim Detayları",
        searchButtonIsActive: false,
      ),
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
                    widget.list[widget.index]["terimAd"],
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
                  title: Text("\n"+
                    widget.list[widget.index]["terimAciklama"] + "\n",
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
                      _terimKontrol(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _terimKontrol() {
    int flag = 0;
    for (int i = 0; i < benimTerimlerim.length; i++) {
      if (benimTerimlerim[i].terim == widget.list[widget.index]["terimAd"]) {
        flag = 1;
      }
    }
    if (flag == 0) {
      return OutlineButton(
        borderSide: BorderSide(color: Colors.black),
        child: Text("Favorilerime Ekle"),
        onPressed: () {
          _terimEkle();
        },
      );
    }else{
      return OutlineButton(
        borderSide: BorderSide(color: Colors.black),
        child: Text("Favorilerime Eklenmiş"),
        onPressed: () {
          print("Tamam");
        },
      );
    }
  }

  void _terimEkle() {
    int flag = 0;
    for (int i = 0; i < benimTerimlerim.length; i++) {
      if (benimTerimlerim[i].terim == widget.list[widget.index]["terimAd"]) {
        flag = 1;
      }
    }
    if (flag == 0) {
      databaseHelper.benimTerimlerimEkle(Terim(
          widget.list[widget.index]["terimAd"],
          widget.list[widget.index]["terimAciklama"],
          widget.list[widget.index]["terimBolum"]));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
