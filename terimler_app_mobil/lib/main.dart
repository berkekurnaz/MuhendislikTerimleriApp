import 'package:flutter/material.dart';
import 'package:terimler_app_mobil/Screens/home.dart';

void main(){
  runApp(MaterialApp(
    title: "Mühendislik Terimleri",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Montserrat"),
    initialRoute: "/",
    routes: {
      "/" : (context) => Home(),
    },
  ));
}