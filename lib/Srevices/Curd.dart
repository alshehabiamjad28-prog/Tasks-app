///////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('amjad:11111'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  // Get Request
  getrequest(String Url) async {
    try {
      var response = await http.get(Uri.parse(Url));

      if (response.statusCode == 200) {
        try {
          var responbody = jsonDecode(response.body);
          return responbody;
        } catch (e) {
          print("خطأ في تحويل الرد إلى JSON: $e");
          return null;
        }
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  // Post Request
  postrequest(String Url, Map data) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      var response = await http.post(
        Uri.parse(Url),
        body: data,
        headers: myheaders,
      );

      if (response.statusCode == 200) {
        try {
          var responbody = jsonDecode(response.body);
          return responbody; // الآن يرجع JSON صح
        } catch (e) {
          print("خطأ في تحويل الرد إلى JSON: $e");
          return null;
        }
      } else {
        print("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }

  Postrequestwithfile(String Url, Map data, File file) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(Url));

      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartfile = http.MultipartFile(
        "file",
        stream,
        length,
        filename: basename(file.path),
      );

      request.headers.addAll(myheaders);

      request.files.add(multipartfile);

      // إضافة الحقول
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      var myrequest = await request.send();
      var respons = await http.Response.fromStream(myrequest);

      if (myrequest.statusCode == 200) {
        return jsonDecode(respons.body);
      } else {
        print("error ${myrequest.statusCode}");
        return {
          "success": false,
          "error": "حدث خطأ في الاتصال بالخادم (${myrequest.statusCode})",
        };
      }
    } catch (e) {
      print("Exception: $e");
      return {"success": false, "error": "حدث خطأ أثناء إرسال الطلب: $e"};
    }
  }
}