import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terimler_app/Screens/searchList.dart';
import 'package:terimler_app/Utils/myToLowerCaseFormatter.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  String department;
  bool searchButtonIsActive;

  MyAppBar({this.title, this.searchButtonIsActive, this.department});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "$title",
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: new IconThemeData(color: Colors.black),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4),
        child: Container(
          color: Colors.black,
          height: 0.5,
        ),
      ),
      actions: <Widget>[
        searhButton(context),
      ],
    );
  }

  Widget searhButton(BuildContext context) {
    if (searchButtonIsActive == true) {
      return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          _openShowDialog(context);
        },
        color: Colors.black,
      );
    }else{
      return Container();
    }
  }

  _openShowDialog(BuildContext context){
    
    String termName;
    var formKey =GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text("Terim Ara"),
          children: <Widget>[
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    MyToLowerCaseFormatter(),
                  ],
                  decoration: InputDecoration(
                    hintText: "Aranacak Terim"
                  ),
                  onSaved: (value){
                    termName = value;
                  },
                  validator: (value){
                    if(value.length <= 0){
                      return "Lütfen Bir Değer Giriniz";
                    }
                  },
                ),
              ),    
            ),
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
                  child: Text("Ara"),
                  onPressed: (){
                      // Arama Sayfasina Gitme Islemi
                      if(formKey.currentState.validate()){
                        formKey.currentState.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchList(termDepartment: department,termName: termName)));
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


  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
