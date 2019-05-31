import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/about.dart';
import 'package:terimler_app/Screens/announcements.dart';
import 'package:terimler_app/Screens/categories.dart';
import 'package:terimler_app/Screens/contact.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Screens/myTerms.dart';
import 'package:terimler_app/Screens/suggestionSend.dart';
import 'package:terimler_app/Screens/test.dart';

class MyDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Mühendislik Terimleri\nUygulaması", style: TextStyle(color: Colors.black,fontSize: 20.0),textAlign: TextAlign.center,),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 1.0, color: Colors.black))
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Kategoriler'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
            },
          ),
          ListTile(
            leading: Icon(Icons.not_listed_location),
            title: Text('Nedir ?'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(Icons.my_location),
            title: Text('Benim Terimlerim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyTerms()));
            },
          ),
          ListTile(
            leading: Icon(Icons.publish),
            title: Text('Terim Gönder'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestionSend()));
            },
          ),
          ListTile(
            leading: Icon(Icons.blur_linear),
            title: Text('Duyurular'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Announcements()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
        ],
      ),
    );
  }
  
}