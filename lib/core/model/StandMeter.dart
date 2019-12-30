class StandMeter {
  int _id;
  String _lwbp;
  String _wbp;
  String _kvarh;
  int get id=>_id;
  String get noIMEI =>_lwbp;
  String get tipe => _wbp;
  String get merk => _kvarh;
  StandMeter.initial()
  : _id = 0,
    _lwbp = "",
    _wbp ="",
    _kvarh ="";
  StandMeter.fromMap(Map<String,dynamic> obj){
    _id = int.parse(obj['id']);
    _lwbp = obj['lwbp'];
    _wbp = obj['wbp'];
    _kvarh = obj['kvarh'];
  }
}