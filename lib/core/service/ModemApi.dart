import 'dart:convert';
import 'package:amr_apps/core/model/Modem.dart';
import 'package:http/http.dart' as http;

class ModemApi {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();
  Future<Modem> getModemByPelanggan(String token,String pelangganID) async{
    print("Get Modem By Pelanggan....");
    print("Token : $token");
    Modem modem;
    var url = Uri.parse(host+postfix+"/modem?"+"pelanggan_id="+pelangganID.toString()+"&limit=1");
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
      modem = new Modem.initial();
      return modem;
    }
    var responseBody =  json.decode(response.body);
    if(responseBody['modem']==null){
      modem = new Modem.initial();
      return modem;
    }
    modem = new Modem.fromMap(responseBody['modem']);
    return modem;
  }
  Future<Map<String,dynamic>> insertModem(String token,Map<String,dynamic> data) async{
    print("Insert data modem....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.parse(host+postfix+"/modem");
    print("URL : $url");
    var response = await http.post(url,
      headers: {
        "Authorization" : token,
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