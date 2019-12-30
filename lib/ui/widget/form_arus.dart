import 'package:flutter/material.dart';
import 'package:amr_apps/core/model/Arus.dart';

class FormArus extends StatelessWidget {
  final TextEditingController lr;
  final TextEditingController ls;
  final TextEditingController lt;
  final int pemeriksaanID;
  final Arus arus;
  FormArus({this.lr,this.ls,this.lt,this.pemeriksaanID,this.arus});
  @override
  Widget build(BuildContext context) {
    TextEditingController _lr = new TextEditingController(text:this.arus.lr);
    TextEditingController _ls = new TextEditingController(text:this.arus.ls);
    TextEditingController _lt = new TextEditingController(text:this.arus.lt);
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: true,
                          controller: _lr,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data lr masih kosong';
                            }
                            this.lr.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Ir',
                          ),
                        ),
                        TextFormField(
                          controller: _ls,
                          enabled: true,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data ls masih kosong';
                            }
                            
                            this.ls.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Is',
                          ),
                        ),
                        TextFormField(
                          enabled: true,
                          controller: _lt,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data lt masih kosong';
                            }
                            this.lt.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'It',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}