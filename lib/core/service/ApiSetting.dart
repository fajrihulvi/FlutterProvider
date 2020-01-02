class ApiSetting{
  String host;
  String postfix;
  String get _host => host;
  String get _postfix => postfix;
  ApiSetting.initial()
  :
  host = "http://192.168.43.85",
  postfix = "/amr";
}