import 'dart:async';

import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/HasilPemeriksaan.dart';
import 'package:amr_apps/core/model/TindakLanjut.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/pemeriksaan_kedua.model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/HasilPemeriksaanTile.dart';
import 'package:amr_apps/ui/widget/TindakLanjutTile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PemeriksaanPelangganKeduaScreen extends StatefulWidget {
  final int pelangganID;
  final int baID;
  final Berita_Acara beritaAcara;
  final Map<String,dynamic> result;

  const PemeriksaanPelangganKeduaScreen({this.pelangganID, this.baID,this.beritaAcara,this.result});
  
  @override
  _PemeriksaanPelangganKeduaScreenState createState() => _PemeriksaanPelangganKeduaScreenState();
}

class _PemeriksaanPelangganKeduaScreenState extends State<PemeriksaanPelangganKeduaScreen> {
  bool _isChecked9 = false;
  bool _isChecked10 = false;
  bool _isChecked11 = false;
  bool _isChecked12 = false;
  bool _isChecked13 = false;
  bool _isChecked14 = false;
  bool _isChecked15= false;
  bool _isChecked16 = false;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<PemeriksaanKeduaModel>(
    onModelReady : (model)=>model.getPemeliharaan(Provider.of<User>(context).token),
    builder : (context,model,child)=>Scaffold(
      key: _scaffoldKey,
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
      body: model.state == ViewState.Busy ?
      Center(child: CircularProgressIndicator()) :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Hasil Pemeriksaan dan Pemeliharaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child:
                Column(
                  children: this.getTileHasilPemeriksaan(model.hasilPemeriksaan),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Tindak Lanjut Pemeriksaan dan Pemeliharaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.getTindakLanjut(model.tindakLanjut)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: primaryColor2,
                    onPressed: () async{
                      var tindakLanjutId = new List();
                      var tindakLanjutCheck = new List();
                      var modem_id = new List();
                      var sim_card_id = new List();
                      var meter_id = new List();
                      for(var a in model.tindakLanjut){
                        tindakLanjutId.add(a.id);
                        tindakLanjutCheck.add(a.check);
                        modem_id.add(int.parse(this.widget.result['modem_id']));
                        meter_id.add(int.parse(this.widget.result['meter_id']));
                        sim_card_id.add(int.parse(this.widget.result['card_id']));
                      }
                      var hasilPemeriksaanId = List();
                      var hasilPemeriksaanCheck = List();
                      for(var a in model.hasilPemeriksaan){
                        hasilPemeriksaanId.add(a.id);
                        hasilPemeriksaanCheck.add(a.check);
                      }
                      var result = await model.insert(Provider.of<User>(context).token ,this.widget.baID, 
                      hasilPemeriksaanId,hasilPemeriksaanCheck,
                      tindakLanjutId,tindakLanjutCheck,
                      modem_id,meter_id,sim_card_id
                      );
                      if(result['success']==true){
                        print(result['msg']);
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
                                context, '/detail_pemeriksaan/third',arguments: widget.beritaAcara);
                                  }
                                );
                      }
                      else{
                         _scaffoldKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                                content: Text(result['msg'])));
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
    )
  );
  }
  List<Widget> getTileHasilPemeriksaan(List<HasilPemeriksaan> hasilPemeriksaan){
    var items = new List<Widget>();
      for (var hp in hasilPemeriksaan) {
        items.add(new HasilPemeriksaanTile(
            hasilPemeriksaan: hp,
            isChecked: hp.check == null || hp.check == 0 ? false : true,
            onTap: (bool isCheck){
              if(isCheck == true){
                setState(() {
                  hp.check = 1;
                });
              }
              else{
                setState(() {
                  hp.check = 0;
                });
              }
            }
          )
        );
      }
    return items;
  }
  List<Widget> getTindakLanjut(List<TindakLanjut> tindakLanjut){
    var items = new List<Widget>();
      for (var tl in tindakLanjut) {
        items.add(new TindakLanjutTile(
            tindakLanjut: tl,
            isChecked: tl.check == null || tl.check == 0 ? false : true,
            onTap: (bool isCheck){
              if(isCheck == true){
                setState(() {
                  tl.check = 1;
                });
              }
              else{
                setState(() {
                  tl.check = 0;
                });
              }
            }
          )
        );
      }
    return items;
  }
}
