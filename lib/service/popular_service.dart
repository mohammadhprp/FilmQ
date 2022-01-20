import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:logger/logger.dart';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/popular.dart';

Future<Popular> fechPopular(String type) async {
  var logger = Logger();
  final response = await http.get(Uri.parse(
      "${Url.baseUrl}/$type/popular?api_key=${Key.apiKey}&language=${General.lang}"));
  if (response.statusCode == 200) {
    // logger.v(response.body);
    return Popular.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load popular film');
  }
}
