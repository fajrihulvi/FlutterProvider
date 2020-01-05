import 'dart:convert';
import 'dart:typed_data';
import 'package:amr_apps/core/model/HasilPemeriksaan.dart';
import 'package:amr_apps/core/service/ApiSetting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class HasilPemeriksaanApi {
  static const host = "http://192.168.43.85";
  static const postfix = "/amr";
  var apiSetting = new ApiSetting.initial();
  var client = new http.Client();
  Future<List<HasilPemeriksaan>> getHasilPemeriksaan(String token,String jenisPemeriksaan,String beritaAcara) async{
    print("Get Hasil Pemeriksaan....");
    print("Token : $token");
    var hasilpemeriksaan = List<HasilPemeriksaan>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/hasil_pemeriksaan?"+"jenis_pemeliharaan="+jenisPemeriksaan.toString()+"&berita_acara_id="+beritaAcara);
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
    if(responseBody['hasil_pemeriksaan'] == null){
      return null;
    }
    var map = new Map<String,dynamic>();
    map = json.decode(response.body);
    var parsed = map['hasil_pemeriksaan'] as List<dynamic>;
    for (var hp in parsed) {
      print("Hasil Pemeriksaan $hp");
      hasilpemeriksaan.add(HasilPemeriksaan.fromMap(hp));
    }
    return hasilpemeriksaan;
  }
  Future<Map<String,dynamic>> insertHasilPemeriksaan(String token,String beritaAcara, List pemeliharaanID,List check) async{
    print("Insert Hasil Pemeriksaan....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.encodeFull(apiSetting.host+apiSetting.postfix+"/hasil_pemeriksaan");
    print("URL : $url");
    var body = new Map<String,dynamic>();
    body["check"] = json.encode(check);
    body["pemeliharaan_id"] = json.encode(pemeliharaanID);
    body["berita_acara_id"] = beritaAcara;
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
    print("Update tanda tangan tindak lanjut....");
    print("Token : $token");
    var map = new Map<String,dynamic>();
    var url = Uri.parse(apiSetting.host+apiSetting.postfix+"/hasil_pemeriksaan/signature");
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