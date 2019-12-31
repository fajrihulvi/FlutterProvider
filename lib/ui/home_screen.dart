import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/model/WorkOrder.dart';
import 'package:amr_apps/core/viewmodel/home_model.dart';
import 'package:amr_apps/ui/cari_member_pasang_baru_screen.dart';
import 'package:amr_apps/ui/cari_member_pemeriksaan_screen.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/image.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:amr_apps/ui/widget/WoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady : (model)=>model.getWorkOrder(Provider.of<User>(context).token,5),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: cBgColor,
        appBar: PreferredSize(
          preferredSize:
          Size(screenWidth(context), screenHeight(context, dividedBy: 8)),
          child: SafeArea(
            child: Container(
            color: primaryColor1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Selamat Datang',
                    style: TextStyle(color: colorWhite, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
  //                Spacer(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Ikmal Firdaus',
                        style: TextStyle(color: colorWhite, fontSize: 18),
                      ),
                      Spacer(),
                      Icon(
                        Icons.account_circle,
                        color: colorWhite,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        ),
        body: model.state == ViewState.Busy ?
        Center(child: CircularProgressIndicator()) :
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Text(
                'WO PEMERIKSAAN PELANGGAN',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Column(
                  children: getPemeliharaanUi(model.workOrder),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'WO PELANGGAN BARU',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Column(
                  children: getPelangganBaruUi(model.workOrder),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: ()=> Navigator.push(context, CupertinoPageRoute(builder: (context)=>CariMemberPemeriksaanScreen())),
                    child: Card(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: 75,
                                width: 75,
                                child: Image.asset(checkPelanggan)),
                            Text('Periksa AMR'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => CariMemberPasangBaruScreen())),
                    child: Card(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: 75,
                                width: 75,
                                child: Image.asset(addPelanggan)),
                            Text('Pasang Baru AMR'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )
    );
  }
  List<Widget> getPemeliharaanUi(List<WorkOrder> workOrder) {
    var items = new List<WoCard>();
    for (var wo in workOrder) {
      if(wo.jenisPemeliharaan.contains("Pemeliharaan")){
        items.add(new WoCard(
          workOrder: wo,
          title: "WO Pemeriksaan",
          onTap: (){
            print(wo.nomorWO);
            Navigator.pushNamed(context, '/detail_pemeriksaan',arguments: wo);
          },
        ));
      }
    }
    return items;
  }
  List<Widget> getPelangganBaruUi(List<WorkOrder> workOrder) {
    var items = new List<WoCard>();
    for (var wo in workOrder) {
      if(wo.jenisPemeliharaan.contains("Pasang Baru")){
        items.add(new WoCard(
          workOrder: wo,
          title: "WO Pemasangan Baru",
          onTap: (){
            Navigator.pushNamed(context, '/detail_pemasangan',arguments: wo);
          },
        ));
      }
    }
    return items;
  }
}
