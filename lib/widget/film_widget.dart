import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/screen/detail_screen.dart';

class FilmWidget extends StatelessWidget {
  final String name;
  final String image;
  final String mediaType;
  final int id;

  const FilmWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.mediaType,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: InkWell(
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${api.Url.imageUrl}/w500$image",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 76, 75, 75),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                          name,
                          style: textTheme.subtitle2
                      ),
                    ),
                  ),
                ],
              )),
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName, arguments: {"id": id, "media_type": mediaType});
          },
        ));
  }
}
