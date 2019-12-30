class Tegangan {
  int _id;
  String _vt;
  String _vs;
  String _vr;
  int get id=>_id;
  String get noIMEI =>_vt;
  String get tipe => _vs;
  String get merk => _vr;
  Tegangan.initial()
  : _id = 0,
    _vt = "",
    _vs ="",
    _vr ="";
  Tegangan.fromMap(Map<String,dynamic> obj){
    _id = int.parse(obj['id']);
    _vt = obj['vt'];
    _vs = obj['vs'];
    _vr = obj['vr'];
  }
}