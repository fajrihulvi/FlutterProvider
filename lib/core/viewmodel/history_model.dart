import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/service/api.dart';
import 'package:amr_apps/core/viewmodel/base_model.dart';

import '../../locator.dart';

class HistoryModel extends BaseModel{
  Api _api = locator<Api>();
  List<Berita_Acara> beritaAcara;
  Future getberitaAcara(String token, String jenisPemeliharaan)async{
    setState(ViewState.Busy);
    beritaAcara = await _api.getHistoryByWo(token,jenisPemeliharaan);
    setState(ViewState.Idle);
  }
}