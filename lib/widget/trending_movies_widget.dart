import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/screen/detail_screen.dart';

class TrendingMovies extends StatelessWidget {
  final String poster;
  final int id;

  TrendingMovies(this.poster, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //gets the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        //ClipRRect for image border radius
        child: InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: "${api.Url.imageUrl}/original$poster",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: width * 0.72,
              // height: height,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName, arguments: id);
          },
        ),
      ),
    );
  }
}
