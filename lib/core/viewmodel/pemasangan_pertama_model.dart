import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Arus.dart';
import 'package:amr_apps/core/model/StandMeter.dart';
import 'package:amr_apps/core/model/Tegangan.dart';
import 'package:amr_apps/core/service/ArusApi.dart';
import 'package:amr_apps/core/service/MeterApi.dart';
import 'package:amr_apps/core/service/ModemApi.dart';
import 'package:amr_apps/core/service/SimCardApi.dart';
import 'package:amr_apps/core/service/StandMeterApi.dart';
import 'package:amr_apps/core/service/TeganganApi.dart';
import 'package:amr_apps/core/viewmodel/base_model.dart';

import '../../locator.dart';

class PemasanganPertamaModel extends BaseModel{
  ArusApi _api = locator<ArusApi>();
  TeganganApi _apiTegangan = locator<TeganganApi>();
  StandMeterApi _apiStandMeter = locator<StandMeterApi>();
  ModemApi _modemApi = locator<ModemApi>();
  SimCardApi _simCardApi = locator<SimCardApi>();
  MeterApi _meterApi = locator<MeterApi>();
  var result = Map <String,dynamic>();
  Future<Map<String,dynamic>> insertAll(String token, Map<String,dynamic>tegangan,Map<String,dynamic>arus,Map<String,dynamic>standmeter,Map<String,dynamic>modem,Map<String,dynamic>simcard, Map<String,dynamic> meter)async{
    setState(ViewState.Busy);
    result = await _api.insertArus(token, arus);
    if(result['success']==false){
      return result;
    }
    result = await _apiTegangan.insertTegangan(token, tegangan);
    if(result['success']==false){
      return result;
    }
    result = await _apiStandMeter.insertStandMeter(token, standmeter);
    if(result['success']==false){
      return result;
    }
    result = await _modemApi.insertModem(token, modem);
    if(result['success']==false){
      return result;
    }
    result = await _simCardApi.insertSimcard(token, simcard);
    if(result['success']==false){
      return result;
    }
    result = await _meterApi.insertMeter(token, meter);
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