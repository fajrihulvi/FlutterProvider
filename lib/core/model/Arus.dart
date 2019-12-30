class Arus {
  int _id;
  String _lt;
  String _ls;
  String _lr;
  int get id=>_id;
  String get noIMEI =>_lt;
  String get tipe => _ls;
  String get merk => _lr;
  Arus.initial()
  : _id = 0,
    _lt = "",
    _ls ="",
    _lr ="";
  Arus.fromMap(Map<String,dynamic> obj){
    _id = int.parse(obj['id']);
    _lt = obj['lt'];
    _ls = obj['ls'];
    _lr = obj['lr'];
  }
}