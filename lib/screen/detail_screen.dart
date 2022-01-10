import 'package:flutter/material.dart';

import 'package:film_q/model/detail_movie.dart' as movie;
import 'package:film_q/model/detail_tv.dart' as tv;
import 'package:film_q/service/film_service.dart';
import 'package:film_q/widget/detail_movies_widget.dart';
import 'package:film_q/widget/detail_tv_widget.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);
  static const routeName = '/detail';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<movie.DetailMovie> _fetchDetailMovie;
  late Future<tv.DetailTV> _fetchDetailTV;

  @override
  void initState() {
    super.initState();
    // final filmId = ModalRoute.of(context)!.settings.arguments as int;
    // _fetchDetailFilm = fechDetailFilm(filmId);
  }

  @override
  void didChangeDependencies() {
    final film =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final filmId = film['id'];
    final filmType = film['media_type'];
    if (filmType == "movie") {
      _fetchDetailMovie = fechDetailMovie(filmId);
    } else if (filmType == "tv") {
      _fetchDetailTV = fechDetailTV(filmId);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final film =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final filmType = film['media_type'];
    return filmType == "movie"
        ? FutureBuilder<movie.DetailMovie>(
            future: _fetchDetailMovie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      // title: Text("${snapshot.data!.title}"),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.favorite_outline),
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: Container(
                        color: const Color(0xFF262626),
                        child: DetailMovies(
                            snapshot.data!.id as int,
                            "movie",
                            "${snapshot.data!.title}",
                            snapshot.data!.belongsToCollection == null
                                ? "${snapshot.data!.backdropPath}"
                                : "${snapshot.data!.belongsToCollection!.backdropPath}",
                            "${snapshot.data!.overview}",
                            snapshot.data!.genres as List<movie.Genres>,
                            "${snapshot.data!.releaseDate}",
                            snapshot.data!.runtime as int,
                            snapshot.data!.productionCompanies
                                as List<movie.ProductionCompanies>,
                            snapshot.data!.productionCountries
                                as List<movie.ProductionCountries>,
                            snapshot.data!.spokenLanguages
                                as List<movie.SpokenLanguages>,
                            snapshot.data!.voteAverage as double,
                            snapshot.data!.voteCount as int)),
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            })
        : FutureBuilder<tv.DetailTV>(
            future: _fetchDetailTV,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: Scaffold(
                      extendBodyBehindAppBar: true,
                      appBar: AppBar(
                        // title: Text("${snapshot.data!.title}"),
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.favorite_outline),
                            onPressed: () {},
                          )
                        ],
                      ),
                      body: Container(
                          color: const Color(0xFF262626),
                          child: DetailTV(
                              "${snapshot.data!.name}",
                              "${snapshot.data!.backdropPath}",
                              "${snapshot.data!.overview}",
                              snapshot.data!.inProduction as bool,
                              snapshot.data!.genres as List<tv.Genres>,
                              "${snapshot.data!.firstAirDate}",
                              snapshot.data!.episodeRunTime as List<int>,
                              snapshot.data!.networks as List<tv.Networks>,
                              snapshot.data!.numberOfEpisodes as int,
                              snapshot.data!.popularity as double,
                              snapshot.data!.productionCountries
                                  as List<tv.ProductionCountries>,
                              snapshot.data!.spokenLanguages
                                  as List<tv.SpokenLanguages>,
                              snapshot.data!.voteAverage as double,
                              snapshot.data!.voteCount as int))),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            });
  }
}
