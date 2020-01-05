import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:flutter/material.dart';
import 'package:amr_apps/ui/shared/color.dart';

class PemeriksaanCard extends StatelessWidget {
  final Pelanggan pelanggan;
  final Function onTap;
  const PemeriksaanCard({this.pelanggan,this.onTap});
  
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
                                    child: Text(this.pelanggan.noBA),
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
                                    child: Text(this.pelanggan.idPel),
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
                                    child: Text(this.pelanggan.namaPelanggan),
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
                                    child: Text(this.pelanggan.alamat),
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
                                    child: Text(this.pelanggan.tarif),
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