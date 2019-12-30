import 'package:amr_apps/core/enum/viewstate.dart';
import 'package:flutter/foundation.dart';

class BaseModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;
  ViewState get state=>_state;
  void setState(ViewState state){
    _state = state;
    notifyListeners();
  }
}