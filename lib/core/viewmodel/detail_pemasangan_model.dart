import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/service/api.dart';
import 'package:amr_apps/core/viewmodel/base_model.dart';

import '../../locator.dart';

class DetailPemasanganModel extends BaseModel{
  Api _api = locator<Api>();
  List<Pelanggan> pelanggan;
  Future getPelangganByWO(String token, String nomorWO)async{
    setState(ViewState.Busy);
    pelanggan = await _api.getPelangganByWO(token, nomorWO);
    setState(ViewState.Idle);
  }
}