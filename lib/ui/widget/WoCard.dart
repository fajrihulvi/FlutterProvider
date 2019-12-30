import 'package:amr_apps/core/model/WorkOrder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amr_apps/ui/shared/color.dart';

class WoCard extends StatelessWidget {
  final WorkOrder workOrder;
  final Function onTap;
  final String title;
  const WoCard({this.workOrder,this.onTap,this.title});
  @override
  Widget build(BuildContext context) {
    return Stack(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Card(
                                color: cBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        workOrder.tanggal,
                                        style: TextStyle(color: textColor, fontSize: 16),
                                      ),
                                      ListTile(
                                        title: AutoSizeText(this.title),
                                        subtitle: AutoSizeText(workOrder.nomorWO),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 25,)
                          ],
                        ),
                        Positioned(
                          right: 5,
                          top: MediaQuery.of(context).size.height/20,
                          child: InkWell(
                            onTap: onTap,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor2,
                                  shape: BoxShape.circle
                              ),
                              width: 50,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: colorWhite,
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.arrow_forward_ios,color: primaryColor1,),
                                ),
                              ),

                            ),
                          ),
                        )
                      ],
                    );
  }
}