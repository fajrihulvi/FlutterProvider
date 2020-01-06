import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:flutter/material.dart';

class UploadFotoScreen extends StatefulWidget {
  final List hasil_pemeriksaan;
  final Berita_Acara beritaAcara;
  final List tindak_lanjut;
  final Pelanggan pelanggan;
  final bool enableForm;
  const UploadFotoScreen({Key key, this.hasil_pemeriksaan, this.beritaAcara, this.tindak_lanjut, this.pelanggan, this.enableForm=true}) : super(key: key);
  @override
  _UploadFotoScreenState createState() => _UploadFotoScreenState();
}

class _UploadFotoScreenState extends State<UploadFotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}