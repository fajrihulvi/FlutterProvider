import 'dart:typed_data';

import 'package:amr_apps/ui/cari_member_pasang_baru_screen.dart';
import 'package:amr_apps/ui/detail_wo_pemasangan_screen.dart';
import 'package:amr_apps/ui/detail_wo_pemeriksaan_screen.dart';
import 'package:amr_apps/ui/home_dashboard.dart';
import 'package:amr_apps/ui/home_screen.dart';
import 'package:amr_apps/ui/login_screen.dart';
import 'package:amr_apps/ui/pemasangan_pelanggan_kedua.dart';
import 'package:amr_apps/ui/pemasangan_pelanggan_pertama.dart';
import 'package:amr_apps/ui/pemeriksaan_pelanggan_kedua.dart';
import 'package:amr_apps/ui/pemeriksaan_pelanggan_ketiga_screen.dart';
import 'package:amr_apps/ui/pemeriksaan_pelanggan_pertama.dart';
import 'package:amr_apps/ui/signature_pemasangan_pelanggan_view.dart';
import 'package:amr_apps/ui/signature_pemasangan_petugas_view.dart';
import 'package:amr_apps/ui/signature_pemeriksaan_pelanggan_view.dart';
import 'package:amr_apps/ui/signature_pemeriksaan_petugas_view.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import 'core/model/Berita_Acara.dart';
import 'core/model/WorkOrder.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/' :
        print("Load Home Screen");
        return MaterialPageRoute(builder: (_)=>HomeDashboard());
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
          beritaAcara: ba,
        ));
      case '/detail_pemasangan/second':
        var data = settings.arguments as Map<String,dynamic>;
        var ba = data['berita_acara'] as Berita_Acara;
        var result = data['result'];
        return MaterialPageRoute(builder: (_)=>PemasanganPelangganKeduaScreen(beritaAcara:ba,result: result));
      case '/detail_pemeriksaan/first':
        var ba = settings.arguments as Berita_Acara;
        return MaterialPageRoute(builder: (_)=>PemeriksaanPelangganPertamaScreen(pemeriksaanID: ba.id, pelangganID: ba.pelangganID,beritaAcara: ba));
      case '/detail_pemeriksaan/second':
        var data = settings.arguments as Map<String,dynamic>;
        var ba = data['berita_acara'] as Berita_Acara;
        var result = data['result'];
        print("Result : "+result.toString());
        return MaterialPageRoute(builder: (_)=>PemeriksaanPelangganKeduaScreen(baID: ba.id, pelangganID: ba.pelangganID,beritaAcara: ba,result: result));
      case '/detail_pemeriksaan/third':
        var ba = settings.arguments as Berita_Acara;
        print(ba);
        return MaterialPageRoute(builder: (_)=>PemeriksaanPelangganKetigaScreen(beritaAcara: ba));
      case '/signaturePelanggan':
        var ba = settings.arguments as Berita_Acara;
        return MaterialPageRoute(builder: (_)=>SignatureView(beritaacara: ba));
      case '/signaturePetugas':
        var data = settings.arguments as Map<String,dynamic>;
        var ba = data['berita_acara'] as Berita_Acara;
        var signaturePelanggan = data['signature_pelanggan'] as Uint8List;
        print("Signature Pelanggan :"+ signaturePelanggan.toString());
        return MaterialPageRoute(builder: (_)=>SignaturePetugasScreen(beritaacara: ba,signaturePelanggan: signaturePelanggan));
      case '/cari_pasang_baru':
        return MaterialPageRoute(builder: (_)=>CariMemberPasangBaruScreen());
      case '/cari_pemeriksaan':
        return MaterialPageRoute(builder: (_)=>CariMemberPasangBaruScreen());
      case '/history':
        return MaterialPageRoute(builder: (_)=>CariMemberPasangBaruScreen());
      default :
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(child: Text("No route defined for ${settings.name}")),
        )
      );
    }
  }
}