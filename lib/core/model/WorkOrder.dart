class WorkOrder{
  int _id;
  String _nomorWO;
  String _tanggal;
  String _jenisPemeliharaan;
  int get id=> _id;
  String get nomorWO=>_nomorWO;
  String get tanggal=>_tanggal;
  String get jenisPemeliharaan => _jenisPemeliharaan;
  WorkOrder.fromMap(Map<String,dynamic>obj){
    _id = int.parse(obj['id']);
    _nomorWO = obj['nomor_work_order'];
    _tanggal = obj['tanggal_work_order'];
    _jenisPemeliharaan = obj['jenis_pemeliharaan'];
  }
  WorkOrder.fromMapList(Map<String,dynamic>obj) 
  : _id = obj['id'],
    _nomorWO = obj['nomor_work_order'],
    _tanggal = obj['tanggal_work_order'],
    _jenisPemeliharaan = obj['jenis_pemeliharaan'];
}