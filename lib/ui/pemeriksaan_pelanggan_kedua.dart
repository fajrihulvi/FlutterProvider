import 'package:amr_apps/ui/pemeriksaan_pelanggan_ketiga_screen.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PemeriksaanPelangganKeduaScreen extends StatefulWidget {
  @override
  _PemeriksaanPelangganKeduaScreenState createState() => _PemeriksaanPelangganKeduaScreenState();
}

class _PemeriksaanPelangganKeduaScreenState extends State<PemeriksaanPelangganKeduaScreen> {

  bool _isChecked = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  bool _isChecked7 = false;
  bool _isChecked8 = false;
  bool _isChecked9 = false;
  bool _isChecked10 = false;
  bool _isChecked11 = false;
  bool _isChecked12 = false;
  bool _isChecked13 = false;
  bool _isChecked14 = false;
  bool _isChecked15= false;
  bool _isChecked16 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text('Hasil Pemeriksaan dan Pemeliharaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child:
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Modem Normal'),
                      trailing: Checkbox(
                          value: _isChecked, onChanged: (bool x){
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Modem Error / Hang'),
                      trailing: Checkbox(
                          value: _isChecked2, onChanged: (bool x){
                        setState(() {
                          _isChecked2 = !_isChecked2;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Modem Rusak'),
                      trailing: Checkbox(
                          value: _isChecked3, onChanged: (bool x){
                        setState(() {
                          _isChecked3 = !_isChecked3;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Power Supply Modem Rusak'),
                      trailing: Checkbox(
                          value: _isChecked4, onChanged: (bool x){
                        setState(() {
                          _isChecked4 = !_isChecked4;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Kabel Data Rusak / Putus'),
                      trailing: Checkbox(
                          value: _isChecked5, onChanged: (bool x){
                        setState(() {
                          _isChecked5 = !_isChecked5;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('No. SIM Card Rusak / Terblokir'),
                      trailing: Checkbox(
                          value: _isChecked6, onChanged: (bool x){
                        setState(() {
                          _isChecked6 = !_isChecked6;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Antena Rusak / Hilang'),
                      trailing: Checkbox(
                          value: _isChecked7, onChanged: (bool x){
                        setState(() {
                          _isChecked7 = !_isChecked7;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Blank Spot / Tidak Ada Sinyal Komunikasi'),
                      trailing: Checkbox(
                          value: _isChecked8, onChanged: (bool x){
                        setState(() {
                          _isChecked8 = !_isChecked8;
                        });
                      }),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Tindak Lanjut Pemeriksaan dan Pemeliharaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text('Restart Modem'),
                      trailing: Checkbox(
                          value: _isChecked9, onChanged: (bool x){
                        setState(() {
                          _isChecked9 = !_isChecked9;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Ganti Power Supply'),
                      trailing: Checkbox(
                          value: _isChecked10, onChanged: (bool x){
                        setState(() {
                          _isChecked10 = !_isChecked10;
                        });
                      }),
                    ),
                    ListTile(
                      title: Row(
                        children: <Widget>[
                          Text('Ganti Modem'),
                          Column(
                            children: <Widget>[
                            ],
                          )
                        ],
                      ),
                      trailing: Checkbox(
                          value: _isChecked11, onChanged: (bool x){
                        setState(() {
                          _isChecked11 = !_isChecked11;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Ganti Kabel Data'),
                      trailing: Checkbox(
                          value: _isChecked12, onChanged: (bool x){
                        setState(() {
                          _isChecked12 = !_isChecked12;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Ganti Antena'),
                      trailing: Checkbox(
                          value: _isChecked13, onChanged: (bool x){
                        setState(() {
                          _isChecked13 = !_isChecked13;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Ganti Konektor RJ45'),
                      trailing: Checkbox(
                          value: _isChecked14, onChanged: (bool x){
                        setState(() {
                          _isChecked14 = !_isChecked14;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Ganti No SIM Card'),
                      trailing: Checkbox(
                          value: _isChecked15, onChanged: (bool x){
                        setState(() {
                          _isChecked15 = !_isChecked15;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Lainnya'),
                      trailing: Checkbox(
                          value: _isChecked16, onChanged: (bool x){
                        setState(() {
                          _isChecked16 = !_isChecked16;
                        });
                      }),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: primaryColor2,
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>PemeriksaanPelangganKetigaScreen()));
                    },
                    child: Text('Selanjutnya'),

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
