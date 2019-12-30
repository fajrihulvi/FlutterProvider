import 'dart:async';

import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/locator.dart';

import 'api.dart';
class AuthService{
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();
  Future <bool> login (String username,String password)async{
    var user = await _api.login(username, password);
    var hasUser = user != null;
    if(hasUser){
      userController.add(user);
    }
    print("${user}");
    return hasUser;
  }
}