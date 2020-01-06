import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/cari_member_model.dart';
import 'package:amr_apps/ui/map_screen.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/maps.dart';
import 'package:amr_apps/ui/widget/search_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class CariMemberPemeriksaanScreen extends StatefulWidget {
  @override
  _CariMemberPemeriksaanScreenState createState() => _CariMemberPemeriksaanScreenState();
}

class _CariMemberPemeriksaanScreenState extends State<CariMemberPemeriksaanScreen> {
  
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var items = List<Widget>();
  String query;
  Widget body;
  CariMemberModel model = new CariMemberModel();
  TextEditingController inputBar = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                titleSearch: 'Ketikan nama, alamat, atau ID member',
                inputBar: inputBar,
                onBarcodePressed: (val) {
                  setState(() {
                    this.setBody(context, val);
                  });
                },
                onDrawerPressed: (){
                  print('A');
                },
                onChanged: (val){
                  setState(() {
                    this.query = val;
                    this.setBody(context, query);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: this.body
    );
  }
  void setBody(BuildContext context, String query)async{
    await model.getberitaAcara(Provider.of<User>(context).token, "Pemeliharaan", query);
    setState(() {
        this.body = model.state == ViewState.Busy ?
        CircularProgressIndicator() :
        Container(
          child:SingleChildScrollView(
            child: Column(
              children:this.getUserBar(model.pelanggan),
            ),
          ),
        );
      });
  }
  List<Widget> getUserBar(List<Pelanggan> beritaAcara){
       print(beritaAcara);
        var items = new List<Widget>();
        if(beritaAcara == null){
          items.add(Center(child: Text("tidak ada data member")));
          return items;
        }
        else{
          for(var ba in beritaAcara){
            items.add(this.getSingleUserBar(ba));
          }
          if(items.length==0){
            items.add(Center(child: Text("tidak ada data member")));
          }
        }
        return items;
  }
  Widget getSingleUserBar(Pelanggan beritaAcara){
    return InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen(
                beritaAcara: beritaAcara,
                myPosition: LatLng(double.parse("-2.070556"),double.parse("106.077080")),
                pelangganPosition: beritaAcara.lat == null || beritaAcara.long == null ? 
                LatLng(double.parse("-2.070556"),double.parse("106.077080")) : 
                LatLng(double.parse(beritaAcara.lat),double.parse(beritaAcara.long)),
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
                            AutoSizeText('ID Pel : '+beritaAcara.idPel),
                          ],
                        ),
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: MapsScreen(
                              beritaAcara: beritaAcara,
                              myPosition: LatLng(double.parse("-2.070556"),double.parse("106.077080")),
                              pelangganPosition: beritaAcara.lat == null || beritaAcara.long == null ? 
                              LatLng(double.parse("-2.070556"),double.parse("106.077080")) : 
                              LatLng(double.parse(beritaAcara.lat),double.parse(beritaAcara.long)),
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
