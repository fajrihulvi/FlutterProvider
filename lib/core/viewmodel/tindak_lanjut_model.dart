import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/TindakLanjut.dart';
import 'package:amr_apps/core/service/TindakLanjutApi.dart';
import 'package:amr_apps/core/viewmodel/base_model.dart';
import 'package:amr_apps/core/model/Pemeliharaan.dart';
import 'package:amr_apps/core/service/Api.dart';

import '../../locator.dart';

class TindakLanjutModel extends BaseModel{
  TindakLanjutApi _tindakLanjutApi = locator<TindakLanjutApi>();
  List<TindakLanjut> tindakLanjut;
  Pemeliharaan pemeliharaan;
  Api _api = locator<Api>();
  var result = new Map<String,dynamic>();
  Future getPemeliharaan(String token,String beritaAcaraID,String pemeliharaanID)async{
    setState(ViewState.Busy);
    tindakLanjut = await _tindakLanjutApi.getTindakLanjut(token, "Tindak Lanjut",beritaAcaraID);
    pemeliharaan = await _api.getPemeliharaan(token,pemeliharaanID);
    setState(ViewState.Idle);
  }
  Future<Map<String,dynamic>> insertTindakLanjut(String token, int beritaAcara,
  List tindakLanjutID,List tindakLanjutCheck,
  List modem_id, List meter_id, List sim_card_id
  )async{
    setState(ViewState.Busy);
    if(result['success']==false){
      return result;
    }
    result = await _tindakLanjutApi.insertHasilPemeriksaan(token, beritaAcara,tindakLanjutID,tindakLanjutCheck,modem_id,meter_id,sim_card_id);
    if(result['success']==false){
      return result;
    }
    var map = new Map<String,dynamic>();
    map['success'] = true;
    map['msg'] = "Data berhasil di input";
    setState(ViewState.Idle);
    return map;
  }
}