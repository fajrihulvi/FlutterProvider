import 'package:amr_apps/ui/pemasangan_pelanggan_pertama.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWoPemasanganScreen extends StatefulWidget {
  @override
  _DetailWoPemasanganScreenState createState() =>
      _DetailWoPemasanganScreenState();
}

class _DetailWoPemasanganScreenState extends State<DetailWoPemasanganScreen> {
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
                      'Detail',
                      style: TextStyle(color: colorWhite, fontSize: 22),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          CommunityMaterialIcons.chevron_double_right,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'WO Pemasangan Pelanggan',
                              style: TextStyle(color: colorWhite, fontSize: 14),
                            ),
                            Text(
                              'No 12098716152',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Data Pelanggan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Nomor BA'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('2123040 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ID PELANGGAN'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1234124 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('NAMA PELANGGAN'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Ahmad '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ALAMAT'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Jl Utama Utara '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('TARIF DAYA'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Rp 000 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: primaryColor1,
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => PemasanganPelangganPertamaScreen()));
                          },
                          child: Text(
                            'CHECK PELANGGAN',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Nomor BA'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('2123040 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ID PELANGGAN'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1234124 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('NAMA PELANGGAN'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Ahmad '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ALAMAT'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Jl Utama Utara '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('TARIF DAYA'),
                                )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Container(
                                  color: cBgColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Rp 000 '),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: primaryColor1,
                          onPressed: () {},
                          child: Text(
                            'CHECK PELANGGAN',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
