import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Screens/splashScreen.dart';
import 'package:terimler_app/Screens/test.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    theme: ThemeData(
      fontFamily: "Montserrat",
    ),
    routes: {
      "/" : (context) => SplashScreen(),
      "/main" : (context) => Home(),
    },
  ));
}