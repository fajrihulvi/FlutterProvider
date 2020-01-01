import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/cari_member_model.dart';
import 'package:amr_apps/ui/map_screen.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/maps.dart';
import 'package:amr_apps/ui/widget/search_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';


class CariMemberPemeriksaanScreen extends StatefulWidget {
  @override
  _CariMemberPemeriksaanScreenState createState() => _CariMemberPemeriksaanScreenState();
}

class _CariMemberPemeriksaanScreenState extends State<CariMemberPemeriksaanScreen> {
  
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<CariMemberModel>(
      onModelReady: (model)=>model.getberitaAcara(Provider.of<User>(context).token, "Hasil Pemeliharaan"),
      builder:(context,model,child)=>Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size(screenWidth(context), screenHeight(context, dividedBy: 4.5)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (ModalRoute.of(context).canPop)
                      BackButton(
                        color: Colors.black54,
                      ),
                    Text('Daftar Member'),
                  ],
                ),
              ),
              RewardSearchBar(
                titleSearch: 'Cari Member Anda',
                onBarcodePressed: () {
                  print('A');
                },
                onDrawerPressed: (){
                  print('A');
                },
                onChanged: (val) {
                print('A');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:this.getUserBar(model.beritaAcara),
        ),
      ),

    ));
  }
  List<Widget> getUserBar(List<Berita_Acara> beritaAcara){
    var items = new List<Widget>();
    if(beritaAcara == null){
      items.add(Center(child: Text("tidak ada data member")));
      return items;
    }
    for(var ba in beritaAcara){
      if(ba.ttdPetugas == 0 || ba.ttdPelanggan == 0){
        items.add(this.getSingleUserBar(ba));
      }
    }
    if(items.length==0){
      items.add(Center(child: Text("tidak ada data member")));
    }
    return items;
  }
  Widget getSingleUserBar(Berita_Acara beritaAcara){
    return InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen(
                lat: beritaAcara.lat == null ? "-2.070556" : beritaAcara.lat,
                long: beritaAcara.long == null ? "106.077080" : beritaAcara.long
              ))),
              child: Card(
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ExpansionTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(beritaAcara.namaPelanggan),
                            AutoSizeText('ID Pel : '+beritaAcara.noPelanggan),
                          ],
                        ),
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: MapsScreen(
                              lat: beritaAcara.lat == null ? "-2.070556" : beritaAcara.lat,
                              long: beritaAcara.long == null ? "106.077080" : beritaAcara.long
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                  color: primaryColor1,
                                  child: Text('Pasang Sekarang'),
                                  onPressed: (){
                                    Navigator.pushNamed(context, "/detail_pemasangan/first",arguments: beritaAcara);
                                  }
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}
