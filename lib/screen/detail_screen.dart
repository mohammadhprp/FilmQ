import 'package:flutter/material.dart';

import 'package:film_q/model/detail_movie.dart';
import 'package:film_q/service/film_service.dart';
import 'package:film_q/widget/detail_movies_widget.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);
  static const routeName = '/detail';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailMovie> _fetchDetailFilm;

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
    _fetchDetailFilm = fechDetailFilm(filmId, filmType);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final film =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final filmType = film['media_type'];
    return FutureBuilder<DetailMovie>(
        future: _fetchDetailFilm,
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
                        "${snapshot.data!.title}",
                        "${snapshot.data!.belongsToCollection!.backdropPath}",
                        "${snapshot.data!.overview}",
                        snapshot.data!.adult as bool,
                        snapshot.data!.genres as List<Genres>,
                        "${snapshot.data!.releaseDate}",
                        snapshot.data!.runtime as int,
                        snapshot.data!.productionCompanies
                            as List<ProductionCompanies>,
                        snapshot.data!.productionCountries
                            as List<ProductionCountries>,
                        snapshot.data!.spokenLanguages as List<SpokenLanguages>,
                        snapshot.data!.voteAverage as double,
                        snapshot.data!.voteCount as int)),
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
