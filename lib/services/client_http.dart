import 'dart:convert';

import 'package:http/http.dart' as http;

class ClientHttp {
  Future<List<dynamic>> getJson(String link) async {
    var resp = await http.get(Uri.parse(link));
    var res = json.decode(resp.body);
    return res['results'];
  }
}
