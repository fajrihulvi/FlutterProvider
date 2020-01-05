import 'dart:async';

import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/TindakLanjut.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/tindak_lanjut_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/TindakLanjutTile.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';


class TindakLanjutScreen extends StatefulWidget {
  final int pelangganID;
  final int baID;
  final Berita_Acara beritaAcara;
  final Map<String,dynamic> result;
  final bool enableForm;
  final List<dynamic> hasil_pemeriksaan;
  final Pelanggan pelanggan;
  const TindakLanjutScreen({this.pelangganID,this.pelanggan,this.hasil_pemeriksaan,this.baID,this.beritaAcara,this.result,this.enableForm=true});
  
  @override
  _TindakLanjutScreenState createState() => _TindakLanjutScreenState();
}

class _TindakLanjutScreenState extends State<TindakLanjutScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<TindakLanjutModel>(
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
                              model.pemeliharaan.jenisPemeliharaan,
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
                      if(this.widget.enableForm){
                        var tindakLanjutId = new List();
                        var tindakLanjutCheck = new List();
                        var modem_id = new List();
                        var sim_card_id = new List();
                        var meter_id = new List();
                        for(var a in model.tindakLanjut){
                          tindakLanjutId.add(a.id);
                          tindakLanjutCheck.add(a.check);
                          modem_id.add(int.parse(this.widget.pelanggan.modemID.toString()));
                          meter_id.add(int.parse(this.widget.pelanggan.meterID.toString()));
                          sim_card_id.add(int.parse(this.widget.pelanggan.simCardID.toString()));
                        }
                        var result = await model.insertTindakLanjut(Provider.of<User>(context).token ,this.widget.baID,
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
                      }
                      else{
                        Navigator.pushNamed(
                                  context, '/view/detail_pemeriksaan/third',arguments: widget.beritaAcara);
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
  List<Widget> getTindakLanjut(List<TindakLanjut> tindakLanjut){
    var items = new List<Widget>();
      for (var tl in tindakLanjut) {
        items.add(new TindakLanjutTile(
            tindakLanjut: tl,
            isChecked: tl.check == null || tl.check == 0 ? false : true,
            onTap: (bool isCheck){
              if(this.widget.enableForm){
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
            }
          )
        );
      }
    return items;
  }
}
