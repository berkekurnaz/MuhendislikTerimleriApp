import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/home.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
    final _formKey = GlobalKey<FormState>();

  String adSoyad, mail, terimAd, terimAciklama, terimBolum;
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  int _currentState = 0;

  String termDepartment = "Bilgisayar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Raised Button",
        searchButtonIsActive: false,
      ),
      body: ListView(
        children: <Widget>[
          Stepper(
            steps: _mySteps(),
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  OutlineButton(
                    onPressed: onStepCancel,
                      borderSide: BorderSide(
                        color: Colors.black
                      ),
                      child: Text("Geri"),
                  ),
                  Container(
                    height: 50,
                    width: 20,
                  ),
                  OutlineButton(
                    onPressed: onStepContinue,
                      borderSide: BorderSide(
                        color: Colors.black
                      ),
                      child: Text("İleri"),
                  ),
                ],
              );
            },
            currentStep: _currentState,
            onStepTapped: (step) {
              setState(() {
                _currentState = step;
              });
            },
            onStepContinue: () {
              if(_currentState == 4){
                _openShowDialog();
              }
              setState(() {
                if (_formKeys[_currentState].currentState.validate()) {
                  _formKeys[_currentState].currentState.save();
                  if (_currentState == _mySteps().length - 1) {
                    _formKey.currentState.save();
                  }
                  _currentState++;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentState > 0) {
                  _currentState -= 1;
                } else {
                  debugPrint("Bitti");
                }
              });
            },
          ),
        ],
      ),
    );
  }

    List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          content: Form(
            key: _formKeys[0],
            child: TextFormField(
              decoration: InputDecoration(hintText: "İsim Soyisim Giriniz"),
              validator: (isim) {
              if (isim.length < 5) {
                return "İsim Soyisim boş bırakılamaz";
              }
            }, onSaved: (isimF) {
              adSoyad = isimF;
            }),
          ),
          title: Text("İsim Soyisim"),
          isActive: _currentState >= 0),
      Step(
          content: Form(
            key: _formKeys[1],
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email Giriniz"),
              validator: (email) {
              if (!email.contains("@")) {
                return "Geçerli bir email adresi giriniz.";
              }
            }, onSaved: (emailF) {
              mail = emailF;
            }),
          ),
          title: Text("Email"),
          isActive: _currentState >= 1),
      
      Step(
          content: Form(
            key: _formKeys[2],
            child: TextFormField(
              decoration: InputDecoration(hintText: "Terim Adı Giriniz"),
              validator: (value) {
              if (value.length < 3) {
                return "Lütfen Terim Adını Giriniz";
              }
            }, onSaved: (terim) {
              terimAd = terim;
            }),
          ),
          title: Text("Terim Adı"),
          isActive: _currentState >= 2),
      Step(
          content: Form(
            key: _formKeys[3],
            child: TextFormField(
              decoration: InputDecoration(hintText: "Terim Açıklaması Giriniz"),
              validator: (value) {
              if (value.length < 10) {
                return "Lütfen Terim Açıklamasını Giriniz";
              }
            }, onSaved: (terim) {
              terimAciklama = terim;

            }),
          ),
          title: Text("Terim Açıklama"),
          isActive: _currentState >= 3),    
      Step(
          content: Form(
            key: _formKeys[4],
            child: DropdownButtonFormField(
                      value:  termDepartment,         
                      items: ["Bilgisayar","Elektrik","Endüstri","Makine","Kimya","İnşaat"].map((label)=> DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      )).toList(),
                      onChanged: (value){
                        setState(() {
                         termDepartment = value; 
                        });
                      },
                    ),
          ),
          title: Text("Terim Kategori"),
          isActive: _currentState >= 4),   
    ];
    return _steps;
  }

  _openShowDialog(){
    showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text("Öneri Gönderme Ekranı"),
          children: <Widget>[
            Text("Öneriyi Göndermek İstiyor Musunuz ?", textAlign: TextAlign.center,),
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
                          _sendData();
                      },
                    ),
                  ],
                ),
          ],
        );
      }
    );
  }

  _sendData(){
        var url = "http://info.plakala.xyz/api/AOneriler";
        http.post(url, body: {
        "adSoyad": adSoyad,
        "mail": mail,
        "terimAd": terimAd,
        "terimAciklama": terimAciklama,
        "terimBolum": termDepartment,
      });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  InputDecoration box() {
    return InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ));
  }

}
