class Berita_Acara {
  int _id;
  String _nomorBA;
  int _pelangganID;
  String _noPelanggan;
  String _namaPelanggan;
  String _alamat;
  String _tarif;
  int get id => _id;
  String get nomorBA => _nomorBA;
  int get pelangganID => _pelangganID;
  String get noPelanggan => _noPelanggan;
  String get namaPelanggan => _namaPelanggan;
  String get alamat => _alamat;
  String get tarif => _tarif;
  Berita_Acara.fromWorkOrder(Map<String,dynamic> obj){
    _id = int.parse(obj['id']);
    _nomorBA = obj['nomor_ba'];
    _pelangganID = int.parse(obj['pelanggan_id']);
    _noPelanggan = obj['no_pelanggan'];
    _namaPelanggan = obj['nama_pelanggan'];
    _alamat = obj['alamat'];
    _tarif = obj['tarif'];
  }
}