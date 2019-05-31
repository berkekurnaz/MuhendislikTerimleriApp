import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var formKey = GlobalKey<FormState>();

  String nameSurname;
  String mail;
  String title;
  String content;
  String tarih = DateTime.now().toUtc().toString();

  void sendData() {
    var url = "http://info.plakala.xyz/api/AMesajlar";
    http.post(url, body: {
      "adSoyad": nameSurname,
      "mail": mail,
      "baslik": title,
      "icerik": content,
      "tarih": tarih,
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "İletişim", searchButtonIsActive: false,),
      body: Container(
        child: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[

                  SizedBox(height: 20,),

                  Text(
                    "İletişim Ekranı",
                    style: TextStyle(color: Colors.black,fontSize: 20.0),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Ad Soyad",border: OutlineInputBorder(),counterText: ""),
                      maxLength: 40,
                      onSaved: (value) {
                        nameSurname = value;
                      },
                      validator: (value) {
                        if (value.length < 5) {
                          return "Ad Soyad En Az 3 Karakter Olmak Zorundadır";
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Mail",border: OutlineInputBorder(),counterText: ""),
                      maxLength: 40,
                      onSaved: (value) {
                        mail = value;
                      },
                      validator: (value) {
                        if (value.length < 5) {
                          return "Mail Adresi En Az 3 Karakter Olmak Zorundadır";
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Başlık",border: OutlineInputBorder(),counterText: ""),
                      maxLength: 50,
                      onSaved: (value) {
                        title = value;
                      },
                      validator: (value) {
                        if (value.length < 5) {
                          return "Başlık En Az 3 Karakter Olmak Zorundadır";
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLines: 3,
                      maxLength: 500,
                      
                      decoration: InputDecoration(hintText: "İçerik",border: OutlineInputBorder(),counterText: ""),
                      onSaved: (value) {
                        content = value;
                      },
                      validator: (value) {
                        if (value.length < 10) {
                          return "İçerik En Az 10 Karakter Olmak Zorundadır";
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.black
                      ),
                      child: Text("Mesaj Gönder"),
                      onPressed: (){
                        _sendMessage();
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendMessage(){
    showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text("Mesaj Kutusu"),
            children: <Widget>[
                Text("Bu Mesajı Göndermek İstiyor Musunuz ?", textAlign: TextAlign.center,),
                ButtonBar(
                  children: <Widget>[
                    OutlineButton(
                      borderSide: BorderSide(color: Colors.black),
                      child: Text("Vazgeç"),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    OutlineButton(
                      borderSide: BorderSide(color: Colors.black),
                      child: Text("Gönder"),
                      onPressed: (){
                          if(formKey.currentState.validate()){
                            formKey.currentState.save();
                            sendData();
                          }else{
                            Navigator.pop(context);
                          }
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