import 'package:flutter/material.dart';
import 'package:amr_apps/core/model/Arus.dart';

class FormArus extends StatelessWidget {
  final TextEditingController lr;
  final TextEditingController ls;
  final TextEditingController lt;
  final int pemeriksaanID;
  final Arus arus;
  final bool enableEdit;
  FormArus({this.lr,this.ls,this.lt,this.pemeriksaanID,this.arus,this.enableEdit=true});
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: this.enableEdit,
                          initialValue: this.arus.lr,
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
                          initialValue: this.arus.ls,
                          enabled: this.enableEdit,
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
                          enabled: this.enableEdit,
                          initialValue: this.arus.lt,
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