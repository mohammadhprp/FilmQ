import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/model/detail_tv.dart';

class DetailTV extends StatelessWidget {
  final String name;
  final String image;
  final String overview;
  final bool inProduction;
  final List<Genres> genres;
  final String firstAirDate;
  final List<int> episodeRunTime;
  final List<Networks> networks;
  final int numberOfSeasons;
  final double popularity;
  final List<ProductionCountries> countries;
  final List<SpokenLanguages> languages;
  final double voteAverage;
  final int voteCount;

  const DetailTV(
      this.name,
      this.image,
      this.overview,
      this.inProduction,
      this.genres,
      this.firstAirDate,
      this.episodeRunTime,
      this.networks,
      this.numberOfSeasons,
      this.popularity,
      this.countries,
      this.languages,
      this.voteAverage,
      this.voteCount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final dateTime = DateTime.parse(firstAirDate);
    final format = DateFormat('yyyy');
    final year = format.format(dateTime);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
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
                  Color(0xCC000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0xCC000000),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(children: [
                Text(name, style: const TextStyle(color: Colors.white),),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(243, 67, 105, 1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(50))),
                  child:  Text(year,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ],)
            ],)
        ]));
  }
}
