import 'package:amr_apps/core/enum/userstate.dart';
import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:amr_apps/core/viewmodel/login_model.dart';
import 'package:amr_apps/ui/base_view.dart';
import 'package:amr_apps/ui/home_dashboard.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      onModelReady: (model)=>model.checkLogin(),
      builder: (context,model,child)=>Scaffold(
        body: model.state == ViewState.Busy ? 
        Center(child: CircularProgressIndicator()) : this.body(model) ,
      )
    );
  }
  Widget body(LoginModel model){
    return  model.userState == UserState.NotAuth ? 
        LoginScreen() : HomeDashboard();
  }
}