import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/detail_film_image.dart';


Future<DetailFilmImage> fechDetailFilmImage(int id, String type) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/$type/$id/images?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    // print(response.body);
    return DetailFilmImage.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load detail image');
  }
}
