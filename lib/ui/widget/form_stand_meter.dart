import 'package:amr_apps/core/model/StandMeter.dart';
import 'package:flutter/material.dart';

class FormStandMeter extends StatelessWidget {
  final TextEditingController lwbp;
  final TextEditingController wbp;
  final TextEditingController kvarh;
  final int pemeriksaanID;
  final StandMeter standMeter;
  FormStandMeter({this.lwbp,this.wbp,this.kvarh,this.pemeriksaanID,this.standMeter});
  @override
  Widget build(BuildContext context) {
    TextEditingController _lwbp = new TextEditingController(text:this.standMeter.lwbp);
    TextEditingController _wbp = new TextEditingController(text:this.standMeter.wbp);
    TextEditingController _kvarh = new TextEditingController(text:this.standMeter.kvarh);
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: true,
                          controller: _lwbp,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data lwbp masih kosong';
                            }
                            
                            this.lwbp.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Ir',
                          ),
                        ),
                        TextFormField(
                          controller: _wbp,
                          enabled: true,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data wbp masih kosong';
                            }
                            
                            this.wbp.text = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Is',
                          ),
                        ),
                        TextFormField(
                          enabled: true,
                          controller: _kvarh,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'data kvarh masih kosong';
                            }
                            this.kvarh.text = value;
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