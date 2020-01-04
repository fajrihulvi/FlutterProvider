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
           Container(
            padding: const EdgeInsets.all(8.0),
            child: BaseView<HistoryModel>(
              onModelReady: (model)=>model.getberitaAcara(Provider.of<User>(context).token, "Hasil Pemeliharaan"),
              builder: (context,model,child)=>
              ListView(
                scrollDirection: Axis.vertical,
                children: this.historyCard(model.beritaAcara,"Hasil Pemeliharaan")
              ),
            )
          ),

          ///Pemasangan AMR
          Container(
            padding: const EdgeInsets.all(8.0),
            child: BaseView<HistoryModel>(
              onModelReady: (model)=>model.getberitaAcara(Provider.of<User>(context).token, "Pasang Baru"),
              builder: (context,model,child)=>
              ListView(
                scrollDirection: Axis.vertical,
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
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 12),
                Text("Tanggal",style: TextStyle(color: primaryColor1b,fontSize: 12)),
                SizedBox(height: 20),
                Text(beritaAcara.namaPelanggan,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text("ID : "+beritaAcara.noPelanggan,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 130, child:MaterialButton(
                  color: beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas == 0 ? primaryColor3 : primaryColor4,
                  onPressed: (){
                    if(beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas==0){
                      if(jenisPemeliharaan == "Pasang Baru"){
                        Navigator.pushNamed(context, '/detail_pemasangan/first',arguments: beritaAcara);
                      }
                      else if(jenisPemeliharaan == "Hasil Pemeliharaan"){
                        Navigator.pushNamed(context, '/detail_pemeriksaan/first',arguments: beritaAcara);
                      }
                    }
                  },
                  child: Text( 
                    beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas == 0 ? "Belum Selesai" : "Sudah Selesai"
                    ,style: TextStyle(color: Colors.white),),
                ),),
                SizedBox(height: 8),
                beritaAcara.ttdPelanggan == 0 || beritaAcara.ttdPetugas == 0 ? null :
                SizedBox(width: 130,child: MaterialButton(
                  color: primaryColor2,
                  onPressed: (){
                    if(jenisPemeliharaan == "Pasang Baru"){
                      Navigator.pushNamed(context, '/view/detail_pemasangan/first',arguments: beritaAcara);
                    }
                    else if(jenisPemeliharaan == "Hasil Pemeliharaan"){
                      Navigator.pushNamed(context, '/view/detail_pemeriksaan/first',arguments: beritaAcara);
                    }
                  },
                  child: Text("Lihat Detail", style: TextStyle(color: Colors.white),),
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
