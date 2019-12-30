import 'package:amr_apps/ui/login_screen.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/shared/image.dart';
import 'package:amr_apps/ui/shared/size.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size(screenWidth(context), screenHeight(context, dividedBy: 8)),
        child: SafeArea(
            child: Container(
              height: screenHeight(context,dividedBy: 8),
              color: primaryColor1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text('Profile Pengguna',style: TextStyle(color: colorWhite,fontSize: 22),),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor1
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(lewy),
                        backgroundColor: Colors.transparent,
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      AutoSizeText('Ikmal',style: TextStyle(fontSize: 16),),
                      AutoSizeText('ID.08123456789'),
                    ],
                  ),
                )
              ],
            ),
            Card(
              child: ListTile(
                leading: Icon(CommunityMaterialIcons.key_outline,size: 50,),
                title: Text('Ubah Password'),
                subtitle: Text('Merubah Password Akun'),
                trailing: Icon(
                  Icons.arrow_forward_ios
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                leading: Icon(CommunityMaterialIcons.book,size: 50,),
                title: Text('Tutorial'),
                subtitle: Text('Tata cara penggunaan aplikasi'),
                trailing: Icon(
                  Icons.arrow_forward_ios
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())),
                child: ListTile(
                  leading: Icon(CommunityMaterialIcons.power,size: 50,),
                  title: Text('Logout'),
                  subtitle: Text(' '),
                  trailing: Icon(
                    Icons.arrow_forward_ios
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