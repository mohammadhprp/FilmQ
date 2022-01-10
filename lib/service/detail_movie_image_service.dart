import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/detail_movie_image.dart';

Future<DetailMovieImage> fechDetailMovieImage(int id) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/movie/$id/images?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    print(response.body);
    return DetailMovieImage.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load detail image');
  }
}
Future<DetailMovieImage> fechDetailMovieTV(int id) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/tv/$id/images?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    print(response.body);
    return DetailMovieImage.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load detail image');
  }
}