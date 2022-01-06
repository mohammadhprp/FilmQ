import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:film_q/model/film.dart';
import 'package:film_q/service/film_service.dart';
import 'package:film_q/widget/trending_movies_widget.dart';

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
          if (snapshot.hasData) {
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: const Text('Film Q'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.menu_outlined),
                    onPressed: () {},
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    )
                  ],
                ),
                body: Container(
                    color: const Color(0xFF262626),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    left: 22, bottom: 10, top: 20),
                                child: const Text(
                                  'Trending',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: snapshot.data!.results!.length,
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    height: 350,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: true,
                                    enlargeStrategy:
                                        CenterPageEnlargeStrategy.height,
                                  ),
                                  itemBuilder: (context, index, id) {
                                    return TrendingMovies(
                                        "${snapshot.data!.results![index].mediaType}" ==
                                                "movie"
                                            ? "${snapshot.data!.results![index].title}"
                                            : "${snapshot.data!.results![index].name}",
                                        "${snapshot.data!.results![index].posterPath}");
                                  }),
                            ],
                          ),
                        ),
                        const Expanded(
                            flex: 1,
                            child: Text(
                              'New Movies',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )));
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
