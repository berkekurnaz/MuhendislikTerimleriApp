import 'package:flutter/material.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Nedir ?", searchButtonIsActive: false,),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("Nedir ?", textAlign: TextAlign.center,),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.info),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("Mühendislik Terimleri Uygulaması mühendislik bölümlerinde okuyan öğrenciler için veya mühendislik terimlerine ilgisi olan herkes için geliştirilmiş ücretsiz terim paylaşım platformudur.", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("Şimdilik Bilgisayar Mühendisliği, Elektrik-Elektronik Mühendisliği, Endüstri Mühendisliği, Makine Mühendisliği, Kimya Mühendisliği Ve İnşaat Mühendisliği Bölümleriyle İlgili Terimler Bulunmaktadır.", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("Sizlerde Terim Önerilerinizi Gönderebilir Ve Terimlerinizin Uygulama İçinde Yayınlanmasını Sağlayabilirsiniz.", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nGeliştirici : Berke Kurnaz\nGeliştirilme Tarihi : Haziran 2019\nUygulama Sürümü : 1.0.0\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}