import 'package:flutter/material.dart';
import 'package:amr_apps/core/model/Modem.dart';
import 'package:amr_apps/core/model/SimCard.dart';

class FormModem extends StatelessWidget {
  final TextEditingController merkModem;
  final TextEditingController tipeModem;
  final TextEditingController noImei;
  final TextEditingController noSimcard;
  final int pelangganID;
  final Modem modem;
  final SimCard simCard;
  FormModem({this.merkModem,this.tipeModem,this.noImei,this.noSimcard,this.pelangganID,this.simCard,this.modem});
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: this.modem.merk,
                          decoration: InputDecoration(
                            labelText: 'Merk Modem',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'merk modem masih kosong';
                            }
                            this.modem.merk = value;
                            this.merkModem.text = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: this.modem.tipe,
                          decoration: InputDecoration(
                            labelText: 'Type Modem',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'tipe modem masih kosong';
                            }
                            this.modem.tipe = value;
                            this.tipeModem.text = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: this.modem.noIMEI,
                          decoration: InputDecoration(
                            labelText: 'No. Imei ',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'no imei modem masih kosong';
                            }
                            this.modem.noIMEI = value;
                            this.noImei.text = value;
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          initialValue: this.simCard.noSIM,
                          decoration: InputDecoration(
                            labelText: 'No. SIM Card ',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              return 'no sim card modem masih kosong';
                            }
                            this.simCard.noSIM = value;
                            this.noSimcard.text = value;
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
        );
  }
}