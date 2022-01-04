import 'package:flutter/material.dart';

import 'package:film_q/model/film.dart';
import 'package:film_q/service/film_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Film> _fetchFilm;

  @override
  void initState() {
    super.initState();
    _fetchFilm = fechFilm();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Film>(
        future: _fetchFilm,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
              return Text("${snapshot.data!.results![index].title}");
            });
          }
          else if (snapshot.hasError) {
            print(snapshot.error);
            return  Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
