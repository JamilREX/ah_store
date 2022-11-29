import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RequestHelper {
  static Future<http.Response> get(
      {bool authRequire = true, required String url}) async {
    String token;
    if (authRequire == true) {
      token = await GetStorage().read('token');
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      return response;
    } else {
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
      };
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      return response;
    }
  }
  static Future<http.Response> post({bool authRequire = true, required String url , required body})async{
    String token;
    if(authRequire==true){
      token = await GetStorage().read('token');
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
        'Authorization': 'Bearer $token'
      };
      print(url);
      http.Response response = await http.post(Uri.parse(url) , headers: headers , body: body);
      return response;
    }else{
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
      };
      http.Response response = await http.post(Uri.parse(url) , headers: headers , body: body);
      return response;
    }
  }
}
