import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/detail_movie.dart';
import 'package:film_q/model/detail_tv.dart';

Future<DetailMovie> fechDetailMovie(int id) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/movie/$id?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    // print(response.body);
    return DetailMovie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film');
  }
}

Future<DetailTV> fechDetailTV(int id) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/tv/$id?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    // print(response.body);
    return DetailTV.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film');
  }
}