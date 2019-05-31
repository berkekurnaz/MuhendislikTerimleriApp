import 'package:flutter/material.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class HowToUse extends StatefulWidget {
  @override
  _HowToUseState createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Nasıl Kullanılır ?", searchButtonIsActive: false,),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nİstediğin Terimi Ara Veya Kategorilere Giderek Terimleri Liste İçerisindeki Görüntüle\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nBeğendiğin Terimleri 'Favorilerime Ekle' Butonuna Tıklayarak Benim Terimlerim Sayfasına Ekleyebilirsin. Böylelikle İlgili Terimlere İnternet Bağlantısı Olmayan Zamanlarda Bile Ulaşabilirsin.\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nEklenmesini İstediğin Terimi Terim Öner Sayfası Aracılığıyla Bize Gönderebilirsin.\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
              child: ListTile(
                title: Text("\nGörüş,Şikayet Ve Öneriler İçin İletişim Bölümünden Bizimle İletişim Kurabilirsin.\n", textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}