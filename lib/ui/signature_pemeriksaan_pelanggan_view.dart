import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/signature_pemeriksaan_petugas_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureView extends StatefulWidget {
  
  final Berita_Acara beritaacara;

  const SignatureView({this.beritaacara});
  
  @override
  _SignatureViewState createState() => _SignatureViewState();
}

class _SignatureViewState extends State<SignatureView> {




  @override
  Widget build(BuildContext context) {

    var _signatureCanvas = Signature(
      height: 250,
      width: MediaQuery.of(context).size.width / 1.2,
      backgroundColor: cBgColor,
      onChanged: (points) {
        print(points);
      },
    );

    // TODO: implement build
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: PreferredSize(
        preferredSize:
        Size(screenWidth(context), screenHeight(context, dividedBy: 7)),
        child: SafeArea(
            child: Container(
              color: primaryColor1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pemeiksaan',
                      style: TextStyle(color: colorWhite, fontSize: 22),
                    ),
                    Row(
                      children: <Widget>[
                        Text('AMR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colorWhite),),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  CommunityMaterialIcons.chevron_double_right,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Pemeriksaan Pelanggan',
                                  style: TextStyle(color: colorWhite, fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  CommunityMaterialIcons.chevron_double_right,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Tandatangan Pelanggan',
                                  style: TextStyle(color: colorWhite, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        )

                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                color: cBgColor,
                    child: SizedBox(
//                        width: MediaQuery.of(context).size.width,
                        child: _signatureCanvas)),
              ),
              Positioned(
                right: 10,
                child:
              IconButton(
                icon: const Icon(Icons.clear),
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    return _signatureCanvas.clear();
                  });
                },
              ),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                color: primaryColor2,
                child: Text('Simpan'),
                onPressed: () async {
                  var signaturePelanggan = await _signatureCanvas.exportBytes();
                  print("Signature Pelanggan :"+signaturePelanggan.toString());
                  if(signaturePelanggan != null){
                    Navigator.pushNamed(context, '/signaturePetugas', arguments: {"berita_acara" : this.widget.beritaacara,"signature_pelanggan":signaturePelanggan});
                    }
                }),
          )
        ],
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Builder(
//        builder: (context) => Scaffold(
//          body: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              //SIGNATURE CANVAS
//              _signatureCanvas,
//              //OK AND CLEAR BUTTONS
//              Container(
//                  decoration: const BoxDecoration(
//                    color: Colors.black,
//                  ),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    mainAxisSize: MainAxisSize.max,
//                    children: <Widget>[
//                      //SHOW EXPORTED IMAGE IN NEW ROUTE
//                      IconButton(
//                        icon: const Icon(Icons.check),
//                        color: Colors.blue,
//                        onPressed: () async {
//                          if (_signatureCanvas.isNotEmpty) {
//                            var data = await _signatureCanvas.exportBytes();
//                            Navigator.of(context).push(
//                              MaterialPageRoute(
//                                builder: (BuildContext context) {
//                                  return Scaffold(
//                                    appBar: AppBar(),
//                                    body: Container(
//                                      color: Colors.grey[300],
//                                      child: Image.memory(data),
//                                    ),
//                                  );
//                                },
//                              ),
//                            );
//                          }
//                        },
//                      ),
//                      //CLEAR CANVAS
//                      IconButton(
//                        icon: const Icon(Icons.clear),
//                        color: Colors.blue,
//                        onPressed: () {
//                          setState(() {
//                            return _signatureCanvas.clear();
//                          });
//                        },
//                      ),
//                    ],
//                  )),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}