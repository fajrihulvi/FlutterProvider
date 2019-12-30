import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/signature_pemasangan_pelanggan_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PemasanganPelangganKeduaScreen extends StatefulWidget {
  @override
  _PemasanganPelangganKeduaScreenState createState() => _PemasanganPelangganKeduaScreenState();
}

class _PemasanganPelangganKeduaScreenState extends State<PemasanganPelangganKeduaScreen> {


  bool _isChecked = false;
  bool _isCheckedPasangBaruModem1Set = false;
  bool _modem = false;
  bool _powerSupply = false;
  bool _kabelData = false;
  bool _antena = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Pemasangan',
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
              Text('Jenis Pekerjaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text('Pasang Baru Modem AMR'),
                      trailing: Checkbox(
                          value: _isChecked, onChanged: (bool x){
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      }),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Tindak Lanjut Pekerjaan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Card(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text('Pasang Baru Modem 1 Set'),
                      trailing: Checkbox(
                          value: _isCheckedPasangBaruModem1Set, onChanged: (bool x){
                        setState(() {
                          _isCheckedPasangBaruModem1Set = !_isCheckedPasangBaruModem1Set;
                        });
                      }),
                    ),
                    ListTile(
                      title: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Modem',
                        ),
                      ),
                      trailing: Checkbox(
                          value: _modem, onChanged: (bool x){
                        setState(() {
                          _modem = !_modem;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Power Supply'),
                      trailing: Checkbox(
                          value: _powerSupply, onChanged: (bool x){
                        setState(() {
                          _powerSupply = !_powerSupply;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Power Supply'),
                      trailing: Checkbox(
                          value: _kabelData, onChanged: (bool x){
                        setState(() {
                          _kabelData = !_kabelData;
                        });
                      }),
                    ),
                    ListTile(
                      title: Text('Antena'),
                      trailing: Checkbox(
                          value: _antena, onChanged: (bool x){
                        setState(() {
                          _antena = !_antena;
                        });
                      }),
                    ),
                    ListTile(
                      title: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'SIM Card',
                        ),
                      ),
                      trailing: Checkbox(
                          value: _modem, onChanged: (bool x){
                        setState(() {
                          _modem = !_modem;
                        });
                      }),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                          SizedBox(height: 10,),

                        ],
                      ),
                    ),),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
        RaisedButton(
        color: primaryColor2,
            onPressed: (){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignaturePemasanganPelangganScreen()));
      },
        child: Text('Selanjutnya'),

      )
      ],
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
