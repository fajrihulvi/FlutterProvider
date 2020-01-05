import 'dart:convert';
import 'dart:core';
import 'package:amr_apps/core/model/Berita_Acara.dart';
import 'package:amr_apps/core/model/Pelanggan.dart';
import 'package:amr_apps/core/model/Pemeliharaan.dart';
import 'package:amr_apps/core/model/User.dart';
import 'package:amr_apps/core/model/WorkOrder.dart';
import 'package:http/http.dart' as http;

import 'ApiSetting.dart';

class Api {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();
  var apiSetting = new ApiSetting.initial();
  Future<User> login(String username,String password) async{
    var _url = apiSetting.host+apiSetting.postfix+"/auth/login";
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
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    return User.fromMap(json.decode(response.body));
  }
  Future<User> me(String token) async{
    var _url = apiSetting.host+apiSetting.postfix+"/auth/me";
    print("URL : {$_url}");
    var response = await http.get(_url,
      headers: {
        "Authorization" : token,
        "Content-Type" : "application/json"
    });
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    var map = json.decode(response.body);
    return User.fromMap(map);
  }
  Future<bool> logout(String token) async{
    var _url = apiSetting.host+apiSetting.postfix+"/auth/logout";
    print("Token : {$token}");
    var response = await http.get(_url,
      headers: {
        "Authorization" : token,
        "Content-Type" : "application/json"
    });
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
      return null;
    }
    var map = json.decode(response.body);
    return map['success'];
  }
  Future<List<WorkOrder>> getWorkOrder(String token, int limit) async{
    print("Get Work Order");
    print("Token : $token");
    var workOrder = List<WorkOrder>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/work_order?"+"limit="+limit.toString());
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
  Future<List<Pelanggan>> getPelangganByWO(String token,String nomorWO) async{
    print("Get Pelanggan By WO");
    print("Token : $token");
    var pelanggan = List<Pelanggan>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/work_order/pelanggan?"+"&nomor_wo="+nomorWO.toString());
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
      pelanggan.add(Pelanggan.fromMap(beritaAcara));
    }
    return pelanggan;
  }
  Future<List<Berita_Acara>> getHistoryByWo(String token,String jenisPemeliharaan) async{
    print("Get Pelanggan By WO");
    print("Token : $token");
    var pelanggan = List<Berita_Acara>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/berita_acara/history?"+"&jenis_pemeliharaan="+jenisPemeliharaan.toString());
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
  Future<List<Berita_Acara>> cariMember(String token,String jenisPemeliharaan,String query) async{
    print("Get Pelanggan By WO");
    print("Token : $token");
    var pelanggan = List<Berita_Acara>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/berita_acara/cari_member?"+"jenis_pemeliharaan="+jenisPemeliharaan.toString()+"&query="+query);
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
  Future<Map<String,dynamic>> changePassword(String token,String password,String oldPassword) async{
    var _url = apiSetting.host+apiSetting.postfix+"/user/password";
    print("URL : {$_url}");
    var response = await http.post(_url,
      headers: {
      "Authorization" : token,
    },
    body:{
      "old_password":oldPassword,
      "password":password
    });
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
       return json.decode(response.body);
    }
    return json.decode(response.body);
  }
  Future<Pemeliharaan> getPemeliharaan(String token,String pemeliharaanID) async{
    print("Get Pemeliharaan By ID....");
    print("Token : $token");
    Pemeliharaan pemeliharaan;
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/pemeliharaan?"+"pemeliharaan_id="+pemeliharaanID.toString()+"&limit=1");
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
    var responseBody =  json.decode(response.body);
    if(responseBody['pemeliharaan'] == null){
      return null;
    }
    pemeliharaan = new Pemeliharaan.fromMap(responseBody['pemeliharaan']);
    return pemeliharaan;
  }
}