import 'package:film_q/model/credits.dart';
import 'package:film_q/screen/credits_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:intl/intl.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/model/detail_movie.dart';
import 'package:film_q/widget/detail_movie_image_widget.dart';

class DetailMovies extends StatelessWidget {
  final int id;
  final String type;
  final String name;
  final String image;
  final String overview;
  final List<Genres> genres;
  final String releaseDate;
  final int runtime;
  final List<ProductionCompanies> companies;
  final List<ProductionCountries> countries;
  final List<SpokenLanguages> languages;
  final double voteAverage;
  final int voteCount;

  const DetailMovies(this.id,
      this.type,
      this.name,
      this.image,
      this.overview,
      this.genres,
      this.releaseDate,
      this.runtime,
      this.companies,
      this.countries,
      this.languages,
      this.voteAverage,
      this.voteCount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    final dateTime = DateTime.parse(releaseDate);
    final format = DateFormat('yyyy');
    final year = format.format(dateTime);

    // final runTimeRegex = RegExp(r"(\d+).(\d{0,2})");
    final hour = runtime / 60;
    final minute = runtime % 60;

    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Stack(children: [
        CachedNetworkImage(
          imageUrl: "${api.Url.imageUrl}/original$image",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fitWidth,
          width: width / 0.5,
          // height: height,
        ),
        Container(
          height: width * 0.565,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.24,
          left: width * 0.04,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom,
                  left: 10,
                  right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(243, 67, 105, 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(50))),
                        child: Text(year,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: 10,
                            child: Text(
                              '•',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: genres.length,
                              separatorBuilder: (context, index) {
                                return Container(
                                  width: 1,
                                  color: Colors.white30,
                                  margin: const EdgeInsets.only(
                                      left: 7.0, right: 7.0),
                                );
                              },
                              itemBuilder: (context, index) {
                                return Text(
                                  genres[index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30, top: 12),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("${hour.toStringAsFixed(0)}h ${minute}m",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 15)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("$voteAverage ($voteCount)",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15))
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        overview,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Images',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      DetailMovieImage(id, type),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  // TODO: add cast for detail screen
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Cast',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        CreditsScreen(id: id, type: type),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
