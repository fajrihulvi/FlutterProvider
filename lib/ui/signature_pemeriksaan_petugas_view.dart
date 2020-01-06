import 'dart:async';
import 'dart:typed_data';

import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/signature_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class SignaturePetugasScreen extends StatefulWidget {
  final Uint8List signaturePelanggan;
  final Berita_Acara beritaacara;
  final List hasil_pemeriksaan;
  final List tindak_lanjut;
  final Pelanggan pelanggan;
  final bool enableForm;

  const SignaturePetugasScreen({this.signaturePelanggan, this.beritaacara, this.hasil_pemeriksaan, this.tindak_lanjut, this.pelanggan, this.enableForm=true});
  @override
  _SignaturePetugasScreenState createState() => _SignaturePetugasScreenState();
}

class _SignaturePetugasScreenState extends State<SignaturePetugasScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

    var _signatureCanvas = Signature(
      height: 250,
      width: MediaQuery.of(context).size.width / 1.2,
      backgroundColor: cBgColor,
      onChanged: (points) {
        print(points);
      },
    );
    return BaseView<SignatureModel>(
    builder: (context,model,child)=>Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhite,
      appBar: PreferredSize(
        preferredSize:
        Size(screenWidth(context), screenHeight(context, dividedBy: 7)),
        child: SafeArea(
            child: Container(
              color: primaryColor1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pemeiksaan',
                      style: TextStyle(color: colorWhite, fontSize: 22),
                    ),
                    Row(
                      children: <Widget>[
                        Text('AMR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colorWhite),),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  CommunityMaterialIcons.chevron_double_right,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Pemeriksaan Pelanggan',
                                  style: TextStyle(color: colorWhite, fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  CommunityMaterialIcons.chevron_double_right,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Tandatangan Petugas',
                                  style: TextStyle(color: colorWhite, fontSize: 14),
                                )
                              ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
color: cBgColor,
                    child: SizedBox(
//                        width: MediaQuery.of(context).size.width,
                        child: _signatureCanvas)),
              ),
              Positioned(
                right: 10,
                child:
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    return _signatureCanvas.clear();
                  });
                },
              ),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                color: primaryColor2,
                child: Text('Simpan'),
                onPressed: ()async{
                  var ttdPetugas = await _signatureCanvas.exportBytes();
                  var ttdPelanggan = this.widget.signaturePelanggan;
                  var result = await model.updateSignature(
                  Provider.of<User>(context).token, 
                  ttdPetugas,ttdPelanggan,widget.tindak_lanjut,widget.hasil_pemeriksaan,widget.pelanggan.id,widget.pelanggan.woID
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
                                          Navigator.pushNamed(context, '/');
                                        }
                                      );
                  }
                  else{
                         _scaffoldKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                                content: Text(result['msg'])));
                      }
                }),
          )
        ],
      ),
    ));
  }

}