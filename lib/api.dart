import 'dart:convert';

import 'package:http/http.dart' as http;

class MainAPI {
  final String url_core = "https://iot-automation-602c60d5d422.herokuapp.com/api";
  // Device
  static const String getDevice = "/getDevice";
  static const String udtDevice = "/udtDevice";

  Future<String> getData(String func) async {
    try {
      var rsp = await http.get(Uri.parse(url_core + func));

      print(rsp.body);

      if (rsp.statusCode == 200) {
        return rsp.body;
      } else {
        return json.encode({"msg": "failed"}).toString();
      }
    } catch (e) {
      print(e);
      return json.encode({"msg": "failed"}).toString();
    }
  }
}
