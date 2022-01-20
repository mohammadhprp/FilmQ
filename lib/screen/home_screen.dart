import 'package:film_q/model/popular.dart';
import 'package:film_q/service/popular_service.dart' as service;
import 'package:film_q/widget/film_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';

import 'package:film_q/model/film.dart';
import 'package:film_q/service/film_service.dart';
import 'package:film_q/widget/drawer.dart';
import 'package:film_q/widget/trending_movies_widget.dart';
import 'package:film_q/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Film> _fetchFilm;
  late Future<Popular> _fetchPopularTV;
  late Future<Popular> _fetchPopularMoive;

  @override
  void initState() {
    super.initState();
    _fetchFilm = fechFilm();
    _fetchPopularTV = service.fechPopular("tv");
    _fetchPopularMoive = service.fechPopular("movie");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: GFAppBar(
          title: const Text('Film Q'),
          centerTitle: true,
          searchBar: true,
          searchController: _searchController,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onSubmitted: (_) {
            Navigator.pushNamed(context, SearchScreen.routeName,
                arguments: _searchController.text);
          },
        ),
        drawer: DrawerAppbar(),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Container(
                    color: const Color(0xFF262626),
                    child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      left: 22, bottom: 10, top: 10),
                                  child: Text('Trending',
                                      style: textTheme.headline6),
                                ),
                                FutureBuilder<Film>(
                                    future: _fetchFilm,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CarouselSlider.builder(
                                            itemCount:
                                                snapshot.data!.results!.length,
                                            options: CarouselOptions(
                                              autoPlay: false,
                                              autoPlayInterval:
                                                  const Duration(seconds: 5),
                                              height: 350,
                                              aspectRatio: 2.0,
                                              enlargeCenterPage: true,
                                              enlargeStrategy:
                                                  CenterPageEnlargeStrategy
                                                      .height,
                                            ),
                                            itemBuilder: (context, index, id) {
                                              return TrendingMovies(
                                                  "${snapshot.data!.results![index].posterPath}",
                                                  "${snapshot.data!.results![index].mediaType}",
                                                  snapshot
                                                      .data!.results![index].id!
                                                      .toInt());
                                            });
                                      } else if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return Text("${snapshot.error}");
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                FutureBuilder<Film>(
                                    future: _fetchFilm,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: const EdgeInsets.only(
                                                  left: 25, bottom: 10),
                                              child: Text('New Movies',
                                                  style: textTheme.headline6),
                                            ),
                                            CarouselSlider.builder(
                                                itemCount: snapshot
                                                    .data!.results!.length,
                                                options: CarouselOptions(
                                                  autoPlay: false,
                                                  aspectRatio: 2.0,
                                                  enlargeCenterPage: true,
                                                  enableInfiniteScroll: true,
                                                  initialPage: 5,
                                                  enlargeStrategy:
                                                      CenterPageEnlargeStrategy
                                                          .height,
                                                ),
                                                itemBuilder:
                                                    (context, index, id) {
                                                  return FilmWidget(
                                                      name: "${snapshot.data!.results![index].mediaType}" ==
                                                              "movie"
                                                          ? "${snapshot.data!.results![index].title}"
                                                          : "${snapshot.data!.results![index].name}",
                                                      image:
                                                          "${snapshot.data!.results![index].backdropPath}",
                                                      mediaType:
                                                          "${snapshot.data!.results![index].mediaType}",
                                                      id: snapshot.data!
                                                          .results![index].id!
                                                          .toInt());
                                                }),
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return Text("${snapshot.error}");
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                FutureBuilder<Popular>(
                                    future: _fetchPopularTV,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: const EdgeInsets.only(
                                                  left: 25, bottom: 10),
                                              child: Text('What\'s Popular (TV)',
                                                  style: textTheme.headline6),
                                            ),
                                            CarouselSlider.builder(
                                                itemCount: snapshot
                                                    .data!.results!.length,
                                                options: CarouselOptions(
                                                  autoPlay: false,
                                                  aspectRatio: 2.0,
                                                  enlargeCenterPage: true,
                                                  enableInfiniteScroll: false,
                                                  initialPage: 1,
                                                  enlargeStrategy:
                                                      CenterPageEnlargeStrategy
                                                          .height,
                                                ),
                                                itemBuilder:
                                                    (context, index, id) {
                                                  return FilmWidget(
                                                    image:
                                                        "${snapshot.data!.results![index].backdropPath}",
                                                    name:
                                                        "${snapshot.data!.results![index].name}",
                                                    mediaType: "tv",
                                                    id: snapshot.data!
                                                        .results![index].id!,
                                                  );
                                                }),
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return Text("${snapshot.error}");
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                FutureBuilder<Popular>(
                                    future: _fetchPopularMoive,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: const EdgeInsets.only(
                                                  left: 25, bottom: 10),
                                              child: Text('What\'s Popular (Movie)',
                                                  style: textTheme.headline6),
                                            ),
                                            CarouselSlider.builder(
                                                itemCount: snapshot
                                                    .data!.results!.length,
                                                options: CarouselOptions(
                                                  autoPlay: false,
                                                  aspectRatio: 2.0,
                                                  enlargeCenterPage: true,
                                                  enableInfiniteScroll: false,
                                                  initialPage: 1,
                                                  enlargeStrategy:
                                                  CenterPageEnlargeStrategy
                                                      .height,
                                                ),
                                                itemBuilder:
                                                    (context, index, id) {
                                                  return FilmWidget(
                                                    image:
                                                    "${snapshot.data!.results![index].backdropPath}",
                                                    name:
                                                    "${snapshot.data!.results![index].tilte}",
                                                    mediaType: "movie",
                                                    id: snapshot.data!
                                                        .results![index].id!,
                                                  );
                                                }),
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return Text("${snapshot.error}");
                                      }
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }),
                              ])
                        ])))));
  }
}
