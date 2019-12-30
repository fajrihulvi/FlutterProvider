import 'dart:convert';
import 'package:amr_apps/core/model/SimCard.dart';
import 'package:http/http.dart' as http;

class SimCardApi {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();
  Future<SimCard> getSimCardByPelanggan(String token,String pelangganID) async{
    print("Get SimCard By Pelanggan....");
    print("Token : $token");
    SimCard simCard;
    var url = Uri.parse(host+postfix+"/sim_card?"+"pelanggan_id="+pelangganID.toString()+"&limit=1");
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
      simCard = new SimCard.initial();
      return simCard;
    }
    var responseBody =  json.decode(response.body);
    if(responseBody['sim_card']==null){
      simCard = new SimCard.initial();
      return simCard;
    }
    simCard = new SimCard.fromMap(responseBody['sim_card']);
    return simCard;
  }
  Future<Map<String,dynamic>> insertSimcard(String token,Map<String,dynamic> data) async{
    print("Insert data sim_card....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.parse(host+postfix+"/sim_card");
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