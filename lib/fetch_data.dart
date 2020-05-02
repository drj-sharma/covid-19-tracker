import 'dart:async';
import 'package:http/http.dart' as http;
const url = "https://api.covid19api.com/summary";

class FetchData {
  static Future getInfo() {
    return http.get(url);
  }
}