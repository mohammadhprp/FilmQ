import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/getwidget.dart';

import 'package:film_q/model/film.dart';
import 'package:film_q/service/film_service.dart';
import 'package:film_q/widget/drawer.dart';
import 'package:film_q/widget/trending_movies_widget.dart';
import 'package:film_q/widget/new_movies_widget.dart';
import 'package:film_q/screen/search_screen.dart';

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
    final TextEditingController _searchController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder<Film>(
        future: _fetchFilm,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    Navigator.pushNamed(context, SearchScreen.routeName, arguments: _searchController.text);
                  },

                ),
                drawer: DrawerAppbar(),
                body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child: Container(
                      color: const Color(0xFF262626),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      left: 22, bottom: 10, top: 90),
                                  child: Text(
                                    'Trending',
                                    style: textTheme.headline6
                                  ),
                                ),
                                CarouselSlider.builder(
                                    itemCount: snapshot.data!.results!.length,
                                    options: CarouselOptions(
                                      autoPlay: false,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                      height: 350,
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                    ),
                                    itemBuilder: (context, index, id) {
                                      return TrendingMovies(
                                          "${snapshot.data!.results![index].posterPath}",
                                          "${snapshot.data!.results![index].mediaType}",
                                          snapshot.data!.results![index].id!
                                              .toInt());
                                    }),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                        left: 25, bottom: 10),
                                    child: Text(
                                      'New Movies',
                                      style: textTheme.headline6
                                    ),
                                  ),
                                  CarouselSlider.builder(
                                      itemCount: snapshot.data!.results!.length,
                                      options: CarouselOptions(
                                        autoPlay: false,
                                        aspectRatio: 2.0,
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                        initialPage: 0,
                                        enlargeStrategy:
                                            CenterPageEnlargeStrategy.height,
                                      ),
                                      itemBuilder: (context, index, id) {
                                        return NewMovies(
                                            "${snapshot.data!.results![index].mediaType}" ==
                                                    "movie"
                                                ? "${snapshot.data!.results![index].title}"
                                                : "${snapshot.data!.results![index].name}",
                                            "${snapshot.data!.results![index].backdropPath}",
                                            "${snapshot.data!.results![index].mediaType}",
                                            snapshot.data!.results![index].id!
                                                .toInt());
                                      }),
                                ],
                              ))
                        ],
                      )),
                )));
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }
          return const Center(child:  CircularProgressIndicator());
        });
  }
}
