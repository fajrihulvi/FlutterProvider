import 'dart:convert';

import 'package:amr_apps/core/model/Arus.dart';
import 'package:http/http.dart' as http;
class ArusApi {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();
  Future<Arus> getArusByBA(String token,String hasilPemeriksaanID) async{
    print("Get Arus By BA....");
    print("Token : $token");
    var arus = new Arus.initial();
    var url = Uri.parse(host+postfix+"/arus?"+"&hasil_pemeriksaan_id="+hasilPemeriksaanID.toString());
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
      return arus;
    }
    var responseBody =  json.decode(response.body);
    arus = new Arus.fromMap(responseBody);
    return arus;
  }
  Future<Map<String,dynamic>> insertArus(String token,Map<String,dynamic> data) async{
    print("Insert data arus....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.parse(host+postfix+"/arus");
    print("URL : $url");
    var response = await http.post(url,
      headers: {
        "Authorization" : token,
        "Content-Type" : "application/json"
      },
      body: data
    );
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
    }
    var responseBody =  json.decode(response.body);
    map = responseBody;
    return map;
  }
}