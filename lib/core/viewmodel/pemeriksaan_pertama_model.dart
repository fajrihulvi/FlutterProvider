import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Arus.dart';
import 'package:amr_apps/core/service/ArusApi.dart';
import 'package:amr_apps/core/viewmodel/base_model.dart';

import '../../locator.dart';

class PemeriksaanPertamaModel extends BaseModel{
  ArusApi _api = locator<ArusApi>();
  var resultArus = Map <String,dynamic>();
  Arus _arus;
  Future<Map<String,dynamic>> insertArus(String token, Map<String,dynamic>data)async{
    setState(ViewState.Busy);
    resultArus = await _api.insertArus(token, data);
    setState(ViewState.Idle);
    return resultArus;
  }
}