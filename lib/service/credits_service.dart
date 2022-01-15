import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:film_q/model/api.dart';
import 'package:film_q/model/credits.dart';


Future<Credits> fechCredits(int id, String type) async {
  final response  = await http.get(Uri.parse("${Url.baseUrl}/$type/$id/credits?api_key=${Key.apiKey}"));
  if (response.statusCode == 200) {
    print(response.body);
    return Credits.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load credits');
  }
}
