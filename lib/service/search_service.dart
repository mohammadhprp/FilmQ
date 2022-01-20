import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:logger/logger.dart';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/search.dart';

Future<Search> fechSearch(String query) async {
  var logger = Logger();
  final response = await http.get(Uri.parse(
      "${Url.baseUrl}/search/multi?api_key=${Key.apiKey}&query=$query&language=${General.lang}"));
  if (response.statusCode == 200) {
    // logger.v(response.body);
    return Search.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film');
  }
}
