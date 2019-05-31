import 'package:flutter/material.dart';
import 'package:terimler_app/Models/terim.dart';
import 'package:terimler_app/Screens/myTermDetail.dart';
import 'package:terimler_app/Utils/DatabaseHelper.dart';
import 'package:terimler_app/Widgets/myAppBar.dart';

class MyTerms extends StatefulWidget {
  @override
  _MyTermsState createState() => _MyTermsState();
}

class _MyTermsState extends State<MyTerms> {
  
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DatabaseHelper databaseHelper;
  List<Terim> tumTerimler;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    tumTerimler = List<Terim>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Benim Terimlerim", searchButtonIsActive: false,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Benim Terimlerim'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('Nedir ?'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Nasıl Kulllanılır ?'),
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Container(
        child: _showBody(),
      ),
    );
  }

  _showBody(){
    if(_selectedIndex == 0){
      return _showMyTermList();
    }else if(_selectedIndex == 1){
      return _showAbout();
    }else{
      return _showHowToUse();
    }
  }

  _showMyTermList(){
    return FutureBuilder(
      future: databaseHelper.benimTerimlerimListesiniGetir(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          tumTerimler =snapshot.data;
          if(tumTerimler.length > 0){
            return ListView.builder(
              itemCount: tumTerimler.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(tumTerimler[index].terim),
                  leading: Icon(Icons.power_input),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyTermDetail(termName: tumTerimler[index].terim,termDescription: tumTerimler[index].aciklama,termId: tumTerimler[index].id,)));
                  },
                );
              },
            );
          }else{
            return Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
                  child: ListTile(
                    title: Text("\nŞimdilik Benim Terimlerime Eklediğin Herhangi Bir Terim Yok...\n", textAlign: TextAlign.center,),
                  ),
                ),
              ),
            );
          }
          
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _showAbout(){
    return ListView(
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
              title: Text("Uygulama İçindeki Terimleri Favorilerinize Ekleyebilirsiniz. Favorilerinize Eklediğiniz Bu Terimler Benim Terimlerim Listesinde Alfabetik Olarak Listelenir.", textAlign: TextAlign.center,),
            ),
          ),
        ),
      ],
    );
  }

  _showHowToUse(){
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
            child: ListTile(
              title: Text("Nasıl Kullanılır ?", textAlign: TextAlign.center,),
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
              title: Text("Listelenen Terimler İçerisinde Daha Sonra Kolayca Ulaşmak İstediğiniz Terimin Favorilere Ekle Butonuna Tıklayabilirsin.", textAlign: TextAlign.center,),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
            child: ListTile(
              title: Text("Eklemiş Olduğun Terim Benim Terimlerim Sayfasında Listelenecektir.", textAlign: TextAlign.center,),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 1)),
            child: ListTile(
              title: Text("İlgili Terimi Favorilerimden Çıkar Butonuna Tıklayarak Terimlerim Listesinden Kaldırabilirsin.", textAlign: TextAlign.center,),
            ),
          ),
        ),
      ],
    );
  }


}