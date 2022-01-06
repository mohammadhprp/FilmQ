import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:film_q/model/api.dart' as api;

class TrendingMovies extends StatelessWidget {

  final String poster;

  TrendingMovies(this.poster,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //gets the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        //ClipRRect for image border radius
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: CachedNetworkImageProvider(
                "${api.Url.imageUrl}/original$poster"),
            fit: BoxFit.cover,
            // height: height,
            width: width * 0.72,
          ),
        ),
      ),
    );
  }
}
