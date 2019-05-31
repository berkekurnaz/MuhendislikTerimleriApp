import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,  
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Mühendislik Terimleri", style: TextStyle(fontSize: 20.0, color: Colors.black),),
            SizedBox(height: 20,),
            Container(
              width: double.infinity - 50,
              height: 200,
              child: FlareActor("assets/animations/yukleme.flr",color: Colors.black,animation: "rotation",),
            ),
            SizedBox(height: 20,),
            Text("Uygulama Yükleniyor", style: TextStyle(fontSize: 20.0, color: Colors.black),),
          ],
        ),
      ),
    ),
    );
  }
}