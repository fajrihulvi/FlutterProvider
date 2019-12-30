import 'package:amr_apps/ui/detail_wo_pemasangan_screen.dart';
import 'package:amr_apps/ui/detail_wo_pemeriksaan_screen.dart';
import 'package:amr_apps/ui/home_screen.dart';
import 'package:amr_apps/ui/login_screen.dart';
import 'package:amr_apps/ui/pemasangan_pelanggan_pertama.dart';
import 'package:amr_apps/ui/pemeriksaan_pelanggan_kedua.dart';
import 'package:amr_apps/ui/pemeriksaan_pelanggan_pertama.dart';
import 'package:flutter/material.dart';

import 'core/model/Berita_Acara.dart';
import 'core/model/WorkOrder.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/' :
        print("Load Home Screen");
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      case 'login':
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case '/detail_pemeriksaan':
        var wo = settings.arguments as WorkOrder;
        return MaterialPageRoute(builder: (_)=>DetailWoPemeriksaanScreen(workOrder:wo));
      case '/detail_pemasangan':
        var wo = settings.arguments as WorkOrder;
        return MaterialPageRoute(builder: (_)=>DetailWoPemasanganScreen(
          workOrder: wo,
        ));
      case '/detail_pemasangan/first':
        var ba = settings.arguments as Berita_Acara;
        return MaterialPageRoute(builder: (_)=>PemasanganPelangganPertamaScreen(
          pemeriksaanID: ba.id,
          pelangganID: ba.pelangganID,
        ));
      case '/detail_pemeriksaan/first':
        var ba = settings.arguments as Berita_Acara;
        return MaterialPageRoute(builder: (_)=>PemeriksaanPelangganPertamaScreen(pemeriksaanID: ba.id, pelangganID: ba.pelangganID));
      case '/detail_pemeriksaan/second':
        return MaterialPageRoute(builder: (_)=>PemeriksaanPelangganKeduaScreen());
      default :
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}")),
        )
      );
    }
  }
}