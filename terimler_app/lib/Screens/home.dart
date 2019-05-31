import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terimler_app/Screens/about.dart';
import 'package:terimler_app/Screens/contact.dart';
import 'package:terimler_app/Screens/howToUse.dart';
import 'package:terimler_app/Screens/myTerms.dart';
import 'package:terimler_app/Screens/searchList.dart';
import 'package:terimler_app/Screens/suggestionSend.dart';
import 'package:terimler_app/Screens/termDetail.dart';
import 'package:terimler_app/Screens/termList.dart';
import 'package:terimler_app/Utils/DatabaseHelper.dart';
import 'package:terimler_app/Utils/myToLowerCaseFormatter.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';
import 'package:terimler_app/Widgets/myDrawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var formKey = GlobalKey<FormState>();

  DatabaseHelper databaseHelper = DatabaseHelper();

  String computerDepartment = "Bilgisayar";
  String electricityDepartment = "Elektrik";
  String industryDepartment = "Endüstri";
  String machineDepartment = "Makine";
  String chemistryDepartment = "Kimya";
  String civilDepartment = "İnşaat";

  String searchText;

  var url = "http://info.plakala.xyz/api/ASonTerimler";

  Future<List> getLast10Data() async{
    final response =await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Mühendislik Terimleri",
        searchButtonIsActive: true,
        department: "all",
      ),
      drawer: MyDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            _widgetForm(),
            _horizontalLine(),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "   Terim Kategorileri",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _widgetTermDepartmentPage(
                      computerDepartment, "Bilgisayar", "computer.png"),
                  _widgetTermDepartmentPage(
                      electricityDepartment, "Elektrik", "electricity.png"),
                  _widgetTermDepartmentPage(
                      industryDepartment, "Endüstri", "industry.png"),
                  _widgetTermDepartmentPage(
                      machineDepartment, "Makine", "machine.png"),
                  _widgetTermDepartmentPage(
                      chemistryDepartment, "Kimya", "chemistry.png"),
                  _widgetTermDepartmentPage(
                      civilDepartment, "İnşaat", "civil.png"),
                ],
              ),
            ),
            _horizontalLine(),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "   Son Eklenen 10 Terim",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 75,
              child: FutureBuilder(
                future: getLast10Data(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index){
                        return _widgetLastTenTerm(snapshot.data[index]["terimAd"], snapshot.data, index);
                      },
                    );
                    
                  }else{
                    return _widgetLoadingBar();
                  }
                },
              ),
            ),
            _horizontalLine(),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "   Hızlı Menü",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _widgetQuickMenuItem("info.png", "Nasıl Kullanılır", MaterialPageRoute(builder: (context) => HowToUse())),
                      _widgetQuickMenuItem("myterms.png", "Benim Terimlerim", MaterialPageRoute(builder: (context) => MyTerms()))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _widgetQuickMenuItem("suggestion.png", "Terim Öner", MaterialPageRoute(builder: (context) => SuggestionSend())),
                      _widgetQuickMenuItem("contact.png", "İletişim", MaterialPageRoute(builder: (context) => Contact()))
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _widgetForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
                MyToLowerCaseFormatter(),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Aranacak Terimi Yazınız",
              ),
              textAlign: TextAlign.center,
              validator: (value){
                if(value.length < 2){
                  return "Lütfen En Az 3 Karakterli Bir Terim Giriniz";
                }
              },
              onSaved: (value){
                searchText =value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              borderSide: BorderSide(color: Colors.black),
              child: Text(
                "Terim Ara",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if(formKey.currentState.validate()){
                  formKey.currentState.save();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchList(termDepartment: "all",termName: searchText)));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _horizontalLine() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.black,
      ),
    );
  }

  _widgetTermDepartmentPage(
      String departmentName, String textName, String iconName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TermList(
                      termDepartment: departmentName,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 5),
        decoration: BoxDecoration(border: Border.all()),
        width: 200.0,
        child: Card(
          elevation: 0,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child:
                    Image.asset("assets/icons/" + iconName, fit: BoxFit.cover),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(textName, style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _widgetLastTenTerm(String termName, List list, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TermDetail(
                          list: list,
                          index: index,
                        )));
      },
      child: Container(
        width: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10, left: 5),
        decoration: BoxDecoration(border: Border.all()),
        child: ListTile(
          leading: Icon(
            Icons.power_input,
            color: Colors.black,
          ),
          title: _mySubstringMethod(termName, 15),
        ),
      ),
    );
  }

  _mySubstringMethod(String text, double sizeFont){
    if(text.length > 12){
      return Text(text.substring(0,10) + "...", style: TextStyle(fontSize: sizeFont));
    }else{
      return Text(text, style: TextStyle(fontSize: sizeFont));
    }
  }

  _widgetQuickMenuItem(String image, String text, MaterialPageRoute route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, route);
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(right: 10, left: 5),
        decoration: BoxDecoration(border: Border.all()),
        width: MediaQuery.of(context).size.width / 2 - 20,
        child: Card(
          elevation: 0,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/icons/" + image, fit: BoxFit.cover),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(text, style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _widgetLoadingBar(){
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        width: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10, left: 5),
        decoration: BoxDecoration(border: Border.all()),
        child: ListTile(
          leading: Icon(
            Icons.power_input,
            color: Colors.black,
          ),
          title: Text("Yükleniyor", style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
