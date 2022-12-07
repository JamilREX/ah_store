import 'dart:convert';

import 'package:ah_store/const/consts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageUploader {
  static Future<String> uploadAndGetUrl(
      {required XFile xFile, String type = 'category'}) async {
    String imagePath;
    String token = await GetStorage().read('token');
    Uri url = Uri.parse('${KConstants.domain}api/tool/uploadImage');
    try {
      var req = http.MultipartRequest('POST', url);
      req.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });

      req.files.add(await http.MultipartFile.fromPath('image', xFile.path));
      req.fields.addAll({
        'type': type,
      });

      http.StreamedResponse response = await req.send();
      print('image response = ${response.statusCode}');


      if (response.statusCode == 200) {
        var body = await response.stream.bytesToString();
        imagePath = jsonDecode(body)['data'];
      } else {
        imagePath = '';
      }
      return imagePath;
    } catch (e) {
      print(e);
      return '';
    }
  }
}
