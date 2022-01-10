import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/model/detail_movie_image.dart' as model;
import 'package:film_q/service/detail_movie_image_service.dart';

class DetailMovieImage extends StatefulWidget {
  final int id;
  final String type;

  const DetailMovieImage(this.id, this.type, {Key? key}) : super(key: key);
  static const routeName = '/detail-image';

  @override
  State<DetailMovieImage> createState() => _DetailMovieImageState();
}

class _DetailMovieImageState extends State<DetailMovieImage> {
  late Future<model.DetailMovieImage> _fechDetailMovieImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.type == "movie") {
      _fechDetailMovieImage = fechDetailMovieImage(widget.id);
    }
    // else if (widget.id == "tv") {
    //   _fetchDetailTV = fechDetailTV(filmId);
    // }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<model.DetailMovieImage>(
        future: _fechDetailMovieImage,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: snapshot.data!.backdrops?.length,
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                ),
                itemBuilder: (context, index, id) {
                  return CachedNetworkImage(
                    imageUrl:
                        "${api.Url.imageUrl}/original${snapshot.data!.backdrops![index].filePath}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.fitWidth,
                    // height: height,
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
