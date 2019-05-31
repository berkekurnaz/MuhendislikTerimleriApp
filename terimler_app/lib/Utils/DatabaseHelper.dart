import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:terimler_app/Models/terim.dart';

class DatabaseHelper {
  
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    }else{
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async{
    if(_database == null){
      _database = await _initializeDatabase();
      return _database;
    }else{
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;

      if (_db == null) {
        await lock.synchronized(() async {
          if (_db == null) {
            var databasesPath = await getDatabasesPath();
            var path = join(databasesPath, "appDB.db");
            print("OLUSACAK DBNIN PATHI : $path");
            var file = new File(path);

            // check if file exists
            if (!await file.exists()) {
              // Copy from asset
              ByteData data = await rootBundle.load(join("assets/db", "DbTerimler.db"));
              List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
              await new File(path).writeAsBytes(bytes);
            }
            // open the database
            _db = await openDatabase(path);
          }
        });
      }
      return _db;
  }

  Future<List<Map<String,dynamic>>> _terimleriGetir() async{
    var db= await _getDatabase();
    var sonuc = await db.query("Terimler");
    return sonuc;
  }

  Future<List<Terim>> terimListesiniGetir() async{
    var terimleriIcerenMapListesi = await _terimleriGetir();
    var terimListesi = List<Terim>();
    for(Map map in terimleriIcerenMapListesi){
      terimListesi.add(Terim.fromMap(map));
    }
    return terimListesi;
  }

  Future<List<Map<String,dynamic>>> terimleriGetirBolum(String blm) async{
    var db =await _getDatabase();
    var sonuc = await db.query("Terimler", orderBy: "terimAd",where: "terimBolum = ?",whereArgs: [blm]);
    return sonuc;
  }

  Future<int> terimEkle(Terim terim) async{
    var db= await _getDatabase();
    var sonuc = await db.insert("Terimler", terim.toMap());
    return sonuc;
  }
  Future<int> terimGuncelle(Terim terim) async{
    var db= await _getDatabase();
    var sonuc = await db.update("Terimler", terim.toMap(), where: 'Id = ?', whereArgs: [terim.id]);
    return sonuc;
  }
  Future<int> terimSil(int id) async{
    var db= await _getDatabase();
    var sonuc = await db.delete("Terimler", where: 'Id = ?', whereArgs: [id]);
    return sonuc;
  }

  /* BENİM TERİMLERİM İLE İLGİLİ İŞLEMLER */
  Future<List<Map<String,dynamic>>> _benimTerimlerimiGetir() async{
    var db= await _getDatabase();
    var sonuc = await db.query("BenimTerimlerim", orderBy: "terimAd");
    return sonuc;
  }

  Future<List<Terim>> benimTerimlerimListesiniGetir() async{
    var terimleriIcerenMapListesi = await _benimTerimlerimiGetir();
    var terimListesi = List<Terim>();
    for(Map map in terimleriIcerenMapListesi){
      terimListesi.add(Terim.fromMap(map));
    }
    return terimListesi;
  }

  Future<int> benimTerimlerimEkle(Terim terim) async{
    var db= await _getDatabase();
    var sonuc = await db.insert("BenimTerimlerim", terim.toMap());
    return sonuc;
  }

  Future<int> benimTerimlerimSil(int id) async{
    var db= await _getDatabase();
    var sonuc = await db.delete("BenimTerimlerim", where: 'Id = ?', whereArgs: [id]);
    return sonuc;
  }


}