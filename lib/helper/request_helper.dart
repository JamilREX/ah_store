import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class RequestHelper {
  static Future<Response> get(
      {bool authRequire = true, required String url}) async {
    String token;
    if (authRequire == true) {
      token = await GetStorage().read('token');
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
        'Authorization': 'Bearer $token'
      };
      Response response = await GetConnect().get(url, headers: headers);
      return response;
    } else {
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
      };
      Response response = await GetConnect().get(url, headers: headers);
      return response;
    }
  }
  static Future<Response> post({bool authRequire = true, required String url , required body})async{
    String token;
    if(authRequire==true){
      token = await GetStorage().read('token');
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
        'Authorization': 'Bearer $token'
      };
      print(url);
      Response response = await GetConnect().post(url , body , headers: headers);
      return response;
    }else{
      Map<String, String> headers = {
        'ZD_TOKEN': '2e4f7961133be1e08fffdb18634a453c',
      };
      Response response = await GetConnect().post(url , body , headers: headers);
      return response;
    }
  }
}
