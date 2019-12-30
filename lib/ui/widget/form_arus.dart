import 'package:flutter/material.dart';

class FormArus extends StatelessWidget {
  final TextEditingController lr;
  final TextEditingController ls;
  final TextEditingController lt;

  FormArus({this.lr,this.ls,this.lt});
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: true,
                          controller: this.lr,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data lr masih kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Ir',
                          ),
                        ),
                        TextFormField(
                          controller: this.ls,
                          enabled: true,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data ls masih kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Is',
                          ),
                        ),
                        TextFormField(
                          enabled: true,
                          controller: this.lt,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data lt masih kosong';
                            }
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