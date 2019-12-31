import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:amr_apps/core/model/TindakLanjut.dart';
import 'package:http/http.dart' as http;

class TindakLanjutApi {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var client = new http.Client();
  Future<List<TindakLanjut>> getTindakLanjut(String token,String jenisPemeriksaan) async{
    print("Get Tindak Lanjut....");
    print("Token : $token");
    var tindaklanjut = new List<TindakLanjut>();
    var url = Uri.parse(host+postfix+"/tindak_lanjut?"+"jenis_pemeliharaan="+jenisPemeriksaan.toString());
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
    if(responseBody['tindak_lanjut'] == null){
      return null;
    }
    var map = new Map<String,dynamic>();
    map = json.decode(response.body);
    var parsed = map['tindak_lanjut'] as List<dynamic>;
    for (var hp in parsed) {
      print("Tindak Lanjut $hp");
      tindaklanjut.add(TindakLanjut.fromMap(hp));
    }
    return tindaklanjut;
  }
  Future<Map<String,dynamic>> insertHasilPemeriksaan(String token,int beritaAcara, List pemeliharaanID,List check,
  List modem_id,List meter_id,List sim_card_id) async{
    print("Insert Tindak Lanjut....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.encodeFull(host+postfix+"/tindak_lanjut");
    print("URL : $url");
    var body = new Map<String,dynamic>();
    body["check"] = json.encode(check);
    body["pemeliharaan_id"] = json.encode(pemeliharaanID);
    body["modem_id"] = json.encode(modem_id);
    body["sim_card_id"] = json.encode(sim_card_id);
    body["meter_id"] = json.encode(meter_id);
    body["berita_acara_id"] = beritaAcara.toString();
    print(body);
    var response = await http.post(url,headers: {"Authorization" : token,
      "Accept":"application/json"},body:body);
    final statusCode = response.statusCode;
    print('body: [${response.body}]');
    if(statusCode < 200 || statusCode >= 400){
      print("An Error Occured : [Status Code : $statusCode]");
    }
    var responseBody =  json.decode(response.body);
    map = responseBody;
    return map;
  }
  Future<Map<String,dynamic>> updateSignature(String token,String beritaAcara, Uint8List ttdPetugas,Uint8List ttdPelanggan) async{
     print("Update tanda tangan hasil pemeriksaan....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.parse(host+postfix+"/tindak_lanjut/signature");
    print("URL : $url");
    var body = new Map<String,dynamic>();
    body['berita_acara_id'] = beritaAcara;
    body['ttd_petugas'] = base64Encode(ttdPetugas);
    body['ttd_pelanggan'] = base64Encode(ttdPelanggan);
    print("Body : "+body.toString());
    var response = await http.post(url,
      headers: {"Authorization":token},
      body: body,
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