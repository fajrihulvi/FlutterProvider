import 'package:amr_apps/core/model/Tegangan.dart';
import 'package:flutter/material.dart';

class FormTegangan extends StatelessWidget {
  final TextEditingController vr;
  final TextEditingController vs;
  final TextEditingController vt;
  final int pemeriksaanID;
  final Tegangan tegangan;
  FormTegangan({this.vr,this.vs,this.vt,this.pemeriksaanID,this.tegangan});
  @override
  Widget build(BuildContext context) {
    TextEditingController _vr = new TextEditingController(text:this.tegangan.vr);
    TextEditingController _vs = new TextEditingController(text:this.tegangan.vs);
    TextEditingController _vt = new TextEditingController(text:this.tegangan.vt);
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: true,
                          controller: _vr,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data vr masih kosong';
                            }
                            
                            this.vr.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'vr',
                          ),
                        ),
                        TextFormField(
                          controller: _vs,
                          enabled: true,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data vs masih kosong';
                            }
                            
                            this.vs.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'vs',
                          ),
                        ),
                        TextFormField(
                          enabled: true,
                          controller: _vt,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data vt masih kosong';
                            }
                            this.vt.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'vt',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}