import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/model/detail_film_image.dart' as model;
import 'package:film_q/service/detail_film_image_service.dart';

class DetailFilmImage extends StatefulWidget {
  final int id;
  final String type;

  const DetailFilmImage(this.id, this.type, {Key? key}) : super(key: key);
  static const routeName = '/detail-image';

  @override
  State<DetailFilmImage> createState() => _DetailFilmImageState();
}

class _DetailFilmImageState extends State<DetailFilmImage> {
  late Future<model.DetailFilmImage> _fechDetailFilmImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _fechDetailFilmImage = fechDetailFilmImage(widget.id, widget.type);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return FutureBuilder<model.DetailFilmImage>(
        future: _fechDetailFilmImage,
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
                        (context, url, downloadProgress) => Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
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
