import 'package:amr_apps/ui/shared/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
            child: Column(
              children: <Widget>[
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText('Firdaus Ikmal'),
                          subtitle: AutoSizeText('ID Pel : 1213292'),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: Colors.red,
                                    child: Text('Belum Selesai',style: TextStyle(color: colorWhite,fontSize: 11),),
                                    onPressed: (){}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText('Ikmal Firdaus'),
                          subtitle: AutoSizeText('ID Pel : 1213292'),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: primaryColor2,
                                    child: Text('Selesai',style: TextStyle(),),
                                    onPressed: (){}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///Pemasangan AMR
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText('Firdaus Ikmal'),
                          subtitle: AutoSizeText('ID Pel : 1213292'),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: Colors.red,
                                    child: Text('Belum Selesai',style: TextStyle(color: colorWhite,fontSize: 11),),
                                    onPressed: (){}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText('Ikmal Firdaus'),
                          subtitle: AutoSizeText('ID Pel : 1213292'),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: primaryColor2,
                                    child: Text('Selesai',style: TextStyle(),),
                                    onPressed: (){}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('5 November 2019',style: TextStyle(color: textColor,fontSize: 16),),
                        ListTile(
                          title: AutoSizeText('Ikmal Firdaus'),
                          subtitle: AutoSizeText('ID Pel : 1213292'),
                          trailing: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/3.5,
                                child:
                                MaterialButton(
                                    minWidth: 100,
                                    color: primaryColor2,
                                    child: Text('Selesai',style: TextStyle(),),
                                    onPressed: (){}),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
