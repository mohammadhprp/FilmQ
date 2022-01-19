import 'package:film_q/screen/credits_screen.dart';
import 'package:film_q/widget/detail_Film_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/model/detail_tv.dart';

class DetailTV extends StatelessWidget {
  final int id;
  final String type;
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
      this.id,
      this.type,
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
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final dateTime = DateTime.parse(firstAirDate);
    final format = DateFormat('yyyy');
    final year = format.format(dateTime);

    final hour = episodeRunTime[0] / 60;
    final minute = episodeRunTime[0] % 60;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        CachedNetworkImage(
          imageUrl: "${api.Url.imageUrl}/original$image",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fitWidth,
          width: size.width / 0.5,
          // height: height,
        ),
        Container(
          height: size.width * 0.565,
          width: size.width,
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
          top: size.height * 0.24,
          left: size.width * 0.04,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: textTheme.headline6,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(243, 67, 105, 1),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Text(year,
                          style: textTheme.subtitle2),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       SizedBox(
                          width: 10,
                          child: Text(
                            '•',
                            style: textTheme.headline6,
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
                                style: textTheme.subtitle2
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
                          hour > 1
                              ? Text("${hour.toStringAsFixed(0)}h ${minute}m",
                                  style: textTheme.subtitle2)
                              : Text("${episodeRunTime[0]}m",
                                  style: textTheme.subtitle2)
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
                              style: textTheme.subtitle2)
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Overview',
                      style: textTheme.headline6!.copyWith(fontSize: 24)
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      overview,
                      style: textTheme.caption,
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('Images',
                        style: textTheme.headline6!.copyWith(fontSize: 24)),
                    DetailFilmImage(id, type),

                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Cast',
                          style: textTheme.headline6!.copyWith(fontSize: 24)),
                      const SizedBox(
                        height: 15,
                      ),
                      CreditsScreen(id: id, type: type),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
