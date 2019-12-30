import 'package:amr_apps/ui/map_screen.dart';
import 'package:amr_apps/ui/pemasangan_pelanggan_pertama.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/widget/maps.dart';
import 'package:amr_apps/ui/widget/search_bar.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class CariMemberPasangBaruScreen extends StatefulWidget {
  @override
  _CariMemberPasangBaruScreenState createState() => _CariMemberPasangBaruScreenState();
}

class _CariMemberPasangBaruScreenState extends State<CariMemberPasangBaruScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size(screenWidth(context), screenHeight(context, dividedBy: 5)),
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
          children: <Widget>[
            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen())),
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
                            AutoSizeText('Firdaus Ikmal'),
                            AutoSizeText('ID Pel : 1213292'),
                          ],
                        ),
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: MapsScreen(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                  color: primaryColor1,
                                  child: Text('Pasang Sekarang'),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PemasanganPelangganPertamaScreen()));

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
            ),
          ],
        ),
      ),

    );
  }
}
