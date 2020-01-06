import 'dart:async';

import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/arus_model.dart';
import 'package:amr_apps/core/viewmodel/meter_model.dart';
import 'package:amr_apps/core/viewmodel/modem_model.dart';
import 'package:amr_apps/core/viewmodel/pemeriksaan_pertama_model.dart';
import 'package:amr_apps/core/viewmodel/stand_meter_model.dart';
import 'package:amr_apps/core/viewmodel/tegangan_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/form_arus.dart';
import 'package:amr_apps/ui/widget/form_meter.dart';
import 'package:amr_apps/ui/widget/form_modem.dart';
import 'package:amr_apps/ui/widget/form_stand_meter.dart';
import 'package:amr_apps/ui/widget/form_tegangan.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PemeriksaanPelangganPertamaScreen extends StatefulWidget {
  final int pemeriksaanID;
  final int pelangganID;
  final Berita_Acara beritaAcara;
  final bool enableForm;
  final Pelanggan pelanggan;

  const PemeriksaanPelangganPertamaScreen({
    this.pemeriksaanID,
    this.pelangganID,
    this.beritaAcara,
    this.enableForm=true,this.pelanggan});
  
  @override
  _PemeriksaanPelangganPertamaScreenState createState() => _PemeriksaanPelangganPertamaScreenState();
}

class _PemeriksaanPelangganPertamaScreenState extends State<PemeriksaanPelangganPertamaScreen> {
  TextEditingController ls = new TextEditingController(),
  lr=TextEditingController(),
  lt = TextEditingController(),
  vt = TextEditingController(),
  vr = TextEditingController(),
  vs = TextEditingController(),
  lwbp = TextEditingController(),
  wbp = TextEditingController(),
  kvarh = TextEditingController(),
  noImei= TextEditingController(),
  tipeModem= TextEditingController(),
  merkModem= TextEditingController(),
  noSeri= TextEditingController(),
  tipeMeter= TextEditingController(),
  merkMeter= TextEditingController(),
  noSim= TextEditingController();
  final formArus = GlobalKey<FormState>();
  final formTegangan = GlobalKey<FormState>();
  final formStandMeter = GlobalKey<FormState>();
  final formMeter = GlobalKey<FormState>();
  final formModem = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<PemeriksaanPertamaModel>(
    builder : (context, model,child)=>SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: cBgColor,
        appBar: PreferredSize(
          preferredSize:
          Size(screenWidth(context), screenHeight(context, dividedBy: 8)),
          child: SafeArea(
              child: Container(
                color: primaryColor1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pemeriksan',
                        style: TextStyle(color: colorWhite, fontSize: 22),
                      ),
                      Row(
                        children: <Widget>[
                          Text('AMR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colorWhite),),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            CommunityMaterialIcons.chevron_double_right,
                            color: Colors.white,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Pemeriksaan Pelanggan',
                                style: TextStyle(color: colorWhite, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Data App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                BaseView<MeterModel>(
                  onModelReady: (modelMeter)=>modelMeter.getMeterByPelanggan(Provider.of<User>(context).token, this.widget.pelangganID.toString()),
                  builder: (context,modelMeter,child)=>modelMeter.state == ViewState.Busy ? 
                  Center(child: CircularProgressIndicator()) :
                  Form(
                    key: this.formMeter,
                    child: FormMeter(
                      enableEdit: this.widget.enableForm,
                      tipeMeter: this.tipeMeter,
                      merkMeter: this.merkMeter,
                      noSeri: this.noSeri,
                      meter: modelMeter.meter
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Text('Data Modem',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                BaseView<ModemModel>(
                  onModelReady: (modelModem)=>modelModem.getDataModem(Provider.of<User>(context).token, this.widget.pelangganID.toString()),
                  builder: (context,modelModem,child)=>modelModem.state == ViewState.Busy ? 
                  Center(child: CircularProgressIndicator()) :
                  Form(
                    key: this.formModem,
                    child: FormModem(
                      enableEdit: this.widget.enableForm,
                      tipeModem: this.tipeModem,
                      merkModem: this.merkModem,
                      noImei: this.noImei,
                      noSimcard: this.noSim,
                      modem: modelModem.modem,
                      simCard: modelModem.simCard,
                    ),
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: primaryColor2,
                        onPressed: () async{
                          if(this.widget.enableForm){
                            if(this.formModem.currentState.validate()
                          &&this.formMeter.currentState.validate()){
                            Map<String,dynamic> result = await model.insertAll(Provider.of<User>(context).token,
                            {
                              "no_imei" : this.noImei.text,
                              "tipe" : this.tipeModem.text,
                              "merk" : this.merkModem.text,
                              "pelanggan_id" : this.widget.pelangganID.toString()
                            },
                            {
                              "no_sim" : this.noSim.text,
                              "pelanggan_id" : this.widget.pelangganID.toString()
                            },
                            {
                              "no_seri" : this.noSeri.text,
                              "tipe" : this.tipeMeter.text,
                              "merk" : this.merkMeter.text,
                              "pelanggan_id" : this.widget.pelangganID.toString()
                            },
                            );
                            if(result['success']==true){
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: Duration(
                                  seconds: 1
                                ),
                                  content: Text(result['msg']))
                                  
                                );
                                Timer(
                                  Duration(
                                    seconds: 3,
                                  ),(){
                                    Navigator.pushNamed(
                                context, '/hasil_pemeriksaan', arguments: this.widget.pelanggan);
                                  }
                                );
                            }
                            else{
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                                content: Text(result['msg'])));
                            }
                          }
                          }
                          else{
                              Navigator.pushNamed(
                              context, '/view/hasil_pemeriksaan',arguments:{ "pelanggan": this.widget.pelanggan,"enableForm":this.widget.enableForm});
                          }
                          
                        },
                      child: Text('Selanjutnya'),
                    
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}
