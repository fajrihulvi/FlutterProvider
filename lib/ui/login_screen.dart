import 'package:amr_apps/core/viewmodel/login_model.dart';
import 'package:amr_apps/ui/shared/color.dart';
import 'package:amr_apps/ui/widget/background_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_view.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightHeader = size.height / 3;
    return BaseView<LoginModel>(
      builder : (context, model, child) =>
      SafeArea(
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: BackgroundScreen(),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                )
              ],
            ),
            Positioned(
              top: heightHeader - 11,
              right: 20,
              left: 20,
              child: Stack(
                children: <Widget>[
                  Card(
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(8),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              labelText: 'email',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: disableColor,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                            onFieldSubmitted: (email) {
                              
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _secureText,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                                onPressed: showHide,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: disableColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
            Positioned(
              top: heightHeader + 160,
              right: 20,
              left:20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    var loginsuccess = await model.login(this._usernameController.text, this._passwordController.text
                    );
                    if(loginsuccess==true){
                      print("Login sukses ? : ${loginsuccess}");
                      Navigator.pushNamed(context, '/');
                    }
                    else{
                      _key.currentState.showSnackBar(new SnackBar(content: Text("Username atau password salah"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor1
                    ),
                  height: 50,
                  width: 50,
                  child: Icon(CommunityMaterialIcons.chevron_double_right,size: 50,),
//                ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: heightHeader - 120,
                right: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText('Monitoring Pemeriksaan dan Pemasangan', style: TextStyle(color: colorWhite, fontSize: 16),),
                    AutoSizeText('Pelanggan AMR', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  ],
                )),
          ],
        ),
        ),
      ),
  );
  }
}
