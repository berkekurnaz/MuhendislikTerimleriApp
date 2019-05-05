import 'package:flutter/material.dart';
import 'package:terimler_app_mobil/Screens/termList.dart';
import 'package:terimler_app_mobil/Widgets/myAppBar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  String txtBilgisayar = "Bilgisayar";
  String txtElektrik = "Elektrik";
  String txtEndustri = "Endüstri";
  String txtMakine = "Makine";
  String txtKimya = "Kimya";
  String txtInsaat = "İnşaat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtBilgisayar,
                            )));
              },
              child: Text("Bilgisayar Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtElektrik,
                            )));
              },
              child: Text("Elektrik Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtEndustri,
                            )));
              },
              child: Text("Endüstri Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtMakine,
                            )));
              },
              child: Text("Makine Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtKimya,
                            )));
              },
              child: Text("Kimya Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermList(
                              bolum: txtInsaat,
                            )));
              },
              child: Text("İnşaat Terimleri"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
