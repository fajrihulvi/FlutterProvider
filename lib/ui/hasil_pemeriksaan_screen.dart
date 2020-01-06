import 'dart:async';

import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/HasilPemeriksaan.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/hasil_pemeriksaan_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/HasilPemeriksaanTile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HasilPemeriksaanScreen extends StatefulWidget {
  final int pelangganID;
  final int baID;
  final Berita_Acara beritaAcara;
  final int woID;
  final Map<String,dynamic> result;
  final bool enableForm;
  final Pelanggan pelanggan;

  const HasilPemeriksaanScreen({this.pelanggan,this.pelangganID, this.woID,this.baID,this.beritaAcara,this.result,this.enableForm=true});
  
  @override
  _HasilPemeriksaanScreenState createState() => _HasilPemeriksaanScreenState();
}

class _HasilPemeriksaanScreenState extends State<HasilPemeriksaanScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<HasilPemeriksaanModel>(
    onModelReady : (model)=>model.getPemeliharaan(Provider.of<User>(context).token,this.widget.beritaAcara == null ? "" : this.widget.beritaAcara.id.toString(),this.widget.pelanggan.pemeliharaanID),
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
                            Text(
                              model.pemeliharaan == null ? "": model.pemeliharaan.pemeliharaan,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: primaryColor2,
                    onPressed: () async{
                      if(this.widget.enableForm){
                        var hasilPemeriksaanId = List();
                        var hasilPemeriksaanCheck = List();
                        for(var a in model.hasilPemeriksaan){
                          hasilPemeriksaanId.add(a.id);
                          hasilPemeriksaanCheck.add(a.check);
                        }
                        var result = await model.insertHasilPemeriksaan(Provider.of<User>(context).token ,this.widget.beritaAcara==null? "" : this.widget.beritaAcara.id.toString(), 
                        hasilPemeriksaanId,hasilPemeriksaanCheck
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
                                  context, '/tindak_lanjut',arguments: {"pelanggan":this.widget.pelanggan, "hasil_pemeriksaan":result['hasil_pemeriksaan']});
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
                      else{
                        Navigator.pushNamed(
                                  context, '/view/tindak_lanjut',arguments: widget.beritaAcara);
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
              if(this.widget.enableForm){
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
            }
          )
        );
      }
    return items;
  }
}
