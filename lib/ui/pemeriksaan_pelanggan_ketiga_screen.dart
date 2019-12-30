import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/signature_pemeriksaan_pelanggan_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PemeriksaanPelangganKetigaScreen extends StatefulWidget {
  final Berita_Acara beritaAcara;

  const PemeriksaanPelangganKetigaScreen({Key key, this.beritaAcara}) : super(key: key);
  
  @override
  _PemeriksaanPelangganKetigaScreenState createState() => _PemeriksaanPelangganKetigaScreenState();
}

class _PemeriksaanPelangganKetigaScreenState extends State<PemeriksaanPelangganKetigaScreen> {
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Text('Kode Segel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: 20,),
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Box App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sebelum Pemeriksan',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sesudah Pemeriksan',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('KWH Meter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sebelum Pemeriksan',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sesudah Pemeriksan',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Pembatas',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sebelum Pemeriksan',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Sesudah Pemeriksan',
                          ),
                        )

                      ],
                    ),
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      color: primaryColor2,
                      onPressed: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignatureView()));
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
