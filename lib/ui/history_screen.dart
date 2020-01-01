import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/viewmodel/history_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with TickerProviderStateMixin {

  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabList.add(new Tab(
      text: 'Pemeriksaan AMR',

    ));
    tabList.add(new Tab(
      text: 'Pemasangan AMR',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor1,
        title: Text('History'),
        bottom: TabBar(
            labelColor: Colors.white,
            controller: _tabController,
            indicatorColor: primaryColor2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabList),
      ),
      body: TabBarView(
        controller: _tabController,

        children: <Widget>[
          ///pemeriksaan AMR
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: BaseView<HistoryModel>(
              onModelReady: (model)=>model.getberitaAcara(Provider.of<User>(context).token, "Hasil Pemeliharaan"),
              builder: (context,model,child)=>
              Column(
                children: this.historyCard(model.beritaAcara,"Hasil Pemeliharaan")
              ),
            )
          ),

          ///Pemasangan AMR
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BaseView<HistoryModel>(
              onModelReady: (model)=>model.getberitaAcara(Provider.of<User>(context).token, "Pasang Baru"),
              builder: (context,model,child)=>
              Column(
                children: this.historyCard(model.beritaAcara,"Pasang Baru")
              ),
            )
          ),

        ],
      )
    );
  }
  List<Widget> historyCard(List<Berita_Acara> beritaAcara,String jenisPemeliharaan){
    var items = new List<Widget>();
    if(beritaAcara == null){
      items.add(Center(child: Text("tidak ada data histori")));
      return items;
    }
    for(var ba in beritaAcara){
      items.add(this.card(ba,jenisPemeliharaan));
    }
    return items;
  }
  Widget card(Berita_Acara beritaAcara,String jenisPemeliharaan){
    return Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText(beritaAcara.namaPelanggan),
                          subtitle: AutoSizeText('ID Pel : '+beritaAcara.noPelanggan.toString()),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas == 0 ? Colors.red : primaryColor2,
                                    child: Text(
                                      beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas == 0 ? "Belum Selesai" : "Sudah Selesai",
                                      style: TextStyle(color: colorWhite,fontSize: 11),),
                                    onPressed: (){
                                      if(beritaAcara.ttdPetugas == 0 || beritaAcara.ttdPelanggan == 0){
                                        if(jenisPemeliharaan=="Hasil Pemeliharaan"){
                                          Navigator.pushNamed(context, '/detail_pemeriksaan/first',arguments: beritaAcara);
                                        }
                                        if(jenisPemeliharaan=="Pasang Baru"){
                                          Navigator.pushNamed(context, '/detail_pemasangan/first',arguments: beritaAcara);
                                        }
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}
