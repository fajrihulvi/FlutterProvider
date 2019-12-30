import 'package:amr_apps/core/service/ArusApi.dart';
import 'package:get_it/get_it.dart';
import 'package:amr_apps/core/service/api.dart';
import 'package:amr_apps/core/viewmodel/login_model.dart';

import 'core/service/auth_service.dart';
import 'core/viewmodel/arus_model.dart';
import 'core/viewmodel/detail_pemeriksaan_model.dart';
import 'core/viewmodel/home_model.dart';
import 'core/viewmodel/pemeriksaan_pertama_model.dart';
GetIt locator = GetIt.instance;
void setupLocator() {
 locator.registerLazySingleton(() => Api());
 locator.registerLazySingleton(() => ArusApi());
 locator.registerLazySingleton(()=>AuthService());
 locator.registerLazySingleton(()=>LoginModel());
 locator.registerFactory(()=>HomeModel());
 locator.registerFactory(()=>DetailPemeriksaanModel());
 locator.registerFactory(()=>PemeriksaanPertamaModel());
 locator.registerFactory(()=>ArusModel());
}