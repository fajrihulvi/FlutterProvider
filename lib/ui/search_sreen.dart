//import 'package:amr_apps/ui/widget/maps.dart';
//import 'package:amr_apps/ui/shared/size.dart';
//import 'package:flutter/material.dart';
//
//import 'shared/color.dart';
//
//class SearchMemberScreen extends StatefulWidget {
//  @override
//  _SearchMemberScreenState createState() => _SearchMemberScreenState();
//}
//
//class _SearchMemberScreenState extends State<SearchMemberScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: PreferredSize(
//        preferredSize:
//        Size(screenWidth(context), screenHeight(context, dividedBy: 8)),
//        child: SafeArea(
//            child: Container(
//              height: screenHeight(context,dividedBy: 8),
//              color: Colors.lightGreen,
//              child: Padding(
//                padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    SizedBox(height: 20,),
//                    Text('Profile Pengguna',style: TextStyle(color: colorWhite,fontSize: 20),),
//                    SizedBox(height: 20,),
//                  ],
//                ),
//              ),
//            )),
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Flexible(
//              fit: FlexFit.loose,
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                height: 100,
//                child: Text('Bang Jarwo'),
//              ),
//            ),
//            Flexible(
//                fit: FlexFit.loose,
//                child:
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height / 2,
//                  child: MapsScreen(),
//                ),
//            ),
//            RaisedButton(
//                color: primaryColor1,
//                child: Text('Pasang Sekarang'),
//                onPressed: (){}
//                )
//          ],
//        ),
//      ),
//    );
//  }
//}
