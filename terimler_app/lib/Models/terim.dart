class Terim {
  
  int _id;
  String _terim;
  String _aciklama;
  String _terimBolum;
  /* Yapıcı Metotlarin Yazimasi */
  Terim(this._terim,this._aciklama,this._terimBolum);
  Terim.withID(this._id,this._terim,this._aciklama,this._terimBolum);

  /* Get Metotlarinin Yazimasi */
  int get id => _id;
  String get terim => _terim;
  String get aciklama => _aciklama;

  /* Set Metotlarinin Yazimasi */
  set terim(String value) {
    _terim = value;
  }

  set aciklama(String value) {
    aciklama = value;
  }

  /* Map Olusturma */
  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["Id"] = _id;
    map["terimAd"] =_terim;
    map["terimAciklama"] =_aciklama;
    map["terimBolum"] =_terimBolum;

    return map;
  }

  /* From Object Olusturma */
  Terim.fromMap(Map<String,dynamic> map){
    this._id = map["Id"];
    this._terim = map["terimAd"];
    this._aciklama = map["terimAciklama"];
    this._terimBolum = map["terimBolum"];
   
  }

}
