import 'dart:convert';
import 'dart:core';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/model/WorkOrder.dart';
import 'package:http/http.dart' as http;

class Api {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();

  Future<User> login(String username,String password) async{
    var _url = host+postfix+"/auth/login";
    print("URL : {$_url}");
    var response = await http.post(_url,
      headers: {
      'Content-type': 'application/x-www-form-urlencoded',
    },
    body:{
      "username":username,
      "password":password
    });
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode > 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    return User.fromMap(json.decode(response.body));
  }
  Future<List<WorkOrder>> getWorkOrder(String token, int limit) async{
    print("Get Work Order");
    print("Token : $token");
    var workOrder = List<WorkOrder>();
    var url = Uri.parse(host+postfix+"/work_order?"+"&limit="+limit.toString());
    print("URL : $url");
    var response = await http.get(url,
      headers: {
        "Authorization" : token,
        "Content-Type" : "application/json"
      }
    );
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    var map = new Map<String,dynamic>();
    map = json.decode(response.body);
    if(map['data']==null){
      return null;
    }
    var parsed = map['data'] as List<dynamic>;
    for (var wo in parsed) {
      print("WO $wo");
      workOrder.add(WorkOrder.fromMap(wo));
    }
    return workOrder;
  }
  Future<List<Berita_Acara>> getPelangganByWO(String token,String nomorWO) async{
    print("Get Pelanggan By WO");
    print("Token : $token");
    var pelanggan = List<Berita_Acara>();
    var url = Uri.parse(host+postfix+"/berita_acara?"+"&nomor_wo="+nomorWO.toString());
    print("URL : $url");
    var response = await http.get(url,
      headers: {
        "Authorization" : token,
        "Content-Type" : "application/json"
      }
    );
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    var map = new Map<String,dynamic>();
    map = json.decode(response.body);
    if(map['data']==null){
      return null;
    }
    var parsed = map['data'] as List<dynamic>;
    for (var beritaAcara in parsed) {
      print("WO $beritaAcara");
      pelanggan.add(Berita_Acara.fromWorkOrder(beritaAcara));
    }
    return pelanggan;
  }
}