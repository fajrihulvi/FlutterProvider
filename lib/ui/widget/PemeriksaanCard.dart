import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:flutter/material.dart';
import 'package:amr_apps/ui/shared/color.dart';

import '../pemeriksaan_pelanggan_pertama.dart';

class PemeriksaanCard extends StatelessWidget {
  final Berita_Acara beritaAcara;
  final Function onTap;
  const PemeriksaanCard({this.beritaAcara,this.onTap});
  
  @override

  Widget build(BuildContext context) {
    return Card(
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
                                    child: Text(this.beritaAcara.nomorBA),
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
                                    child: Text(this.beritaAcara.noPelanggan),
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
                                    child: Text(this.beritaAcara.namaPelanggan),
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
                                    child: Text(this.beritaAcara.alamat),
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
                                    child: Text(this.beritaAcara.tarif),
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
                          onPressed: onTap,
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
            );
  }
}