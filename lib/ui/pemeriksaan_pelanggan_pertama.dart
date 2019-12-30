import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/arus_model.dart';
import 'package:amr_apps/core/viewmodel/pemeriksaan_pertama_model.dart';
import 'package:amr_apps/core/viewmodel/tegangan_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/form_arus.dart';
import 'package:amr_apps/ui/widget/form_tegangan.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PemeriksaanPelangganPertamaScreen extends StatefulWidget {
  final int pemeriksaanID;

  const PemeriksaanPelangganPertamaScreen({this.pemeriksaanID});
  
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
  kvarh = TextEditingController();
  final formArus = GlobalKey<FormState>();
  final formTegangan = GlobalKey<FormState>();
  final formStandMeter = GlobalKey<FormState>();
  final formMeter = GlobalKey<FormState>();
  final formModem = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<PemeriksaanPertamaModel>(
    builder : (context, model,child)=>SafeArea(
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
                 BaseView<TeganganModel>(
                  onModelReady: (modelTegangan)=>modelTegangan.getTeganganByBA(Provider.of<User>(context).token, this.widget.pemeriksaanID.toString()),
                  builder: (context,modelTegangan,child)=> modelTegangan.state == ViewState.Busy ?
                  Center(child: CircularProgressIndicator()) : 
                   Form(
                    key: this.formTegangan,
                    child: FormTegangan(
                      vr: this.vr,
                      vs: this.vs,
                      vt: this.vt,
                      pemeriksaanID: modelTegangan.tegangan.baID,
                      tegangan: modelTegangan.tegangan,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text('Arus (A)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                BaseView<ArusModel>(
                  onModelReady: (modelArus)=>modelArus.getArusByBA(Provider.of<User>(context).token, this.widget.pemeriksaanID.toString()),
                  builder: (context,modelArus,child)=> modelArus.state == ViewState.Busy ?
                  Center(child: CircularProgressIndicator()) : 
                   Form(
                    key: this.formArus,
                    child: FormArus(
                      lr: this.lr,
                      ls: this.ls,
                      lt: this.lt,
                      pemeriksaanID: modelArus.arus.baID,
                      arus: modelArus.arus,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: primaryColor2,
                        onPressed: () async{
                          if(this.formArus.currentState.validate()){
                            Map<String,dynamic> resultArus = await model.insertArus(Provider.of<User>(context).token, {
                              "nilai_ls" : this.ls.text,
                              "nilai_lr" : this.lr.text,
                              "nilai_lt" : this.lt.text,
                              "hasil_pemeriksaan_id" : this.widget.pemeriksaanID.toString()
                            });
                            print(resultArus['msg']);
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
