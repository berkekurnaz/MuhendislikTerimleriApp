import 'package:flutter/material.dart';
import 'package:terimler_app/Screens/termList.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String computerDepartment = "Bilgisayar";
  String electricityDepartment = "Elektrik";
  String industryDepartment = "Endüstri";
  String machineDepartment = "Makine";
  String chemistryDepartment = "Kimya";
  String civilDepartment = "İnşaat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Terim Kategorileri",
        searchButtonIsActive: false,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          _widgetTermDepartmentPage(
              computerDepartment, "Bilgisayar Mühendisliği", "computer.png"),
              SizedBox(height: 10,),
          _widgetTermDepartmentPage(
              electricityDepartment, "Elektrik-Elektronik Mühendisliği", "electricity.png"),
              SizedBox(height: 10,),
          _widgetTermDepartmentPage(
              industryDepartment, "Endüstri Mühendisliği", "industry.png"),
              SizedBox(height: 10,),
          _widgetTermDepartmentPage(machineDepartment, "Makine Mühendisliği", "machine.png"),
          SizedBox(height: 10,),
          _widgetTermDepartmentPage(
              chemistryDepartment, "Kimya Mühendisliği", "chemistry.png"),
              SizedBox(height: 10,),
          _widgetTermDepartmentPage(civilDepartment, "İnşaat Mühendisliği", "civil.png"),
          SizedBox(height: 10,),
        ],
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
        margin: EdgeInsets.only(right: 15, left: 15),
        decoration: BoxDecoration(border: Border.all()),
        width: 200.0,
        height: 100,
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
}
