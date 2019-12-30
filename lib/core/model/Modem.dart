class Modem {
  int _id;
  String _noIMEI;
  String _tipe;
  String _merk;
  int get id=>_id;
  String get noIMEI =>_noIMEI;
  String get tipe => _tipe;
  String get merk => _merk;
  Modem.initial()
  : _id = 0,
    _noIMEI = "",
    _tipe ="",
    _merk ="";
  Modem.fromMap(Map<String,dynamic> obj){
    _id = int.parse(obj['id']);
    _noIMEI = obj['no_imei'];
    _tipe = obj['tipe'];
    _merk = obj['merk'];
  }
}