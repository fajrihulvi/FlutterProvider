import 'package:amr_apps/core/service/ArusApi.dart';
import 'package:amr_apps/core/service/MeterApi.dart';
import 'package:amr_apps/core/service/ModemApi.dart';
import 'package:amr_apps/core/service/SimCardApi.dart';
import 'package:amr_apps/core/viewmodel/detail_pemasangan_model.dart';
import 'package:amr_apps/core/viewmodel/meter_model.dart';
import 'package:amr_apps/core/viewmodel/modem_model.dart';
import 'package:amr_apps/core/viewmodel/sim_card_model.dart';
import 'package:get_it/get_it.dart';
import 'package:amr_apps/core/service/api.dart';
import 'package:amr_apps/core/viewmodel/login_model.dart';

import 'core/service/StandMeterApi.dart';
import 'core/service/TeganganApi.dart';
import 'core/service/auth_service.dart';
import 'core/viewmodel/arus_model.dart';
import 'core/viewmodel/detail_pemeriksaan_model.dart';
import 'core/viewmodel/home_model.dart';
import 'core/viewmodel/pemasangan_pertama_model.dart';
import 'core/viewmodel/pemeriksaan_pertama_model.dart';
import 'core/viewmodel/stand_meter_model.dart';
import 'core/viewmodel/tegangan_model.dart';
GetIt locator = GetIt.instance;
void setupLocator() {
 locator.registerLazySingleton(() => Api());
 locator.registerLazySingleton(() => ArusApi());
 locator.registerLazySingleton(() => StandMeterApi());
 locator.registerLazySingleton(() => TeganganApi());
 locator.registerLazySingleton(() => SimCardApi());
 locator.registerLazySingleton(() => ModemApi());
 locator.registerLazySingleton(() => MeterApi());
 locator.registerLazySingleton(()=>AuthService());
 locator.registerLazySingleton(()=>LoginModel());
 locator.registerFactory(()=>HomeModel());
 locator.registerFactory(()=>DetailPemeriksaanModel());
 locator.registerFactory(()=>DetailPemasanganModel());
 locator.registerFactory(()=>PemeriksaanPertamaModel());
 locator.registerFactory(()=>PemasanganPertamaModel());
 locator.registerFactory(()=>StandMeterModel());
 locator.registerFactory(()=>TeganganModel());
 locator.registerFactory(()=>ArusModel());
 locator.registerFactory(()=>SimCardModel());
 locator.registerFactory(()=>ModemModel());
 locator.registerFactory(()=>MeterModel());
}