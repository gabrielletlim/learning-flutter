import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Uri url = Uri.parse(this.url);
    Response resp = await get(url);
    if (resp.statusCode == 200) {
      String data = resp.body;
      return jsonDecode(data);
    } else {
      print(resp.statusCode);
    }
  }
}