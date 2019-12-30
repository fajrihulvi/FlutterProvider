import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/ui/pemasangan_pelanggan_kedua.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/form_arus.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PemasanganPelangganPertamaScreen extends StatefulWidget {
  final Berita_Acara beritaAcara;
  const PemasanganPelangganPertamaScreen({this.beritaAcara});
  
  @override
  _PemasanganPelangganPertamaScreenState createState() => _PemasanganPelangganPertamaScreenState();
}

class _PemasanganPelangganPertamaScreenState extends State<PemasanganPelangganPertamaScreen> {
  TextEditingController ls,lr,lt;
  final formArus = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                'Pemasangan Pelanggan',
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Merk Meter',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Type Meter',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'ID Meter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Data Modem',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Merk Modem',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Type Modem',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'No. Imei ',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'No. SIM Card ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Stand Meter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'LWBP',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'WBP',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'kVArH',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Tegangan (V)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Vr-n',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Vs-n',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Vt-n',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Arus (A)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Form(
                  key: this.formArus,
                  child: FormArus(
                    lr: this.lr,
                    ls:this.ls,
                    lt: this.lt,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: primaryColor2,
                      onPressed: () async{
                        if(this.formArus.currentState.validate()){
                          
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
    );
  }
}
