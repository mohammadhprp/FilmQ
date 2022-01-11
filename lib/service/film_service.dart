import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/film.dart';

Future<Film> fechFilm() async {
  final response = await http.get(Uri.parse(
      "${Url.baseUrl}/trending/all/week?api_key=${Key.apiKey}&language=${General.lang}"));
  if (response.statusCode == 200) {
    // print(response.body);
    return Film.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load film');
  }
}

