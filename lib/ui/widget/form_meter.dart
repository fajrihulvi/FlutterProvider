import 'package:amr_apps/core/model/Meter.dart';
import 'package:flutter/material.dart';
import 'package:amr_apps/core/model/Arus.dart';

class FormMeter extends StatelessWidget {
  final TextEditingController merkMeter;
  final TextEditingController tipeMeter;
  final TextEditingController noSeri;
  final int pelangganID;
  final Meter meter;
  FormMeter({this.merkMeter,this.tipeMeter,this.noSeri,this.pelangganID,this.meter});
  @override
  Widget build(BuildContext context) {
    TextEditingController _merkMeter = new TextEditingController(text:this.meter.merk);
    TextEditingController _tipeMeter = new TextEditingController(text:this.meter.tipe);
    TextEditingController _noSeri = new TextEditingController(text:this.meter.noSERI);
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _merkMeter,
                          decoration: InputDecoration(
                            labelText: 'Merk Meter',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return "merk meter masih kosong";
                            }
                            this.merkMeter.text=value;
                            this.meter.merk = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _tipeMeter,
                          decoration: InputDecoration(
                            labelText: 'Type Meter',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return "tipe meter masih kosong";
                            }
                            this.tipeMeter.text = value;
                            this.meter.tipe = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _noSeri,
                          decoration: InputDecoration(
                            labelText: 'ID Meter',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return "ID meter masih kosong";
                            }
                            this.noSeri.text=value;
                            this.meter.noSERI = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                );
  }
}