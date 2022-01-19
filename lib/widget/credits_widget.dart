import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:film_q/model/api.dart' as api;

class Credits extends StatelessWidget {
  final String name;
  final String originalName;
  final String character;
  final String profile;

  const Credits(
      {Key? key,
      required this.name,
      required this.originalName,
      required this.character,
      required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Card(
        elevation: 3.0,
        child: Column(children: [
          Flexible(
            child: SizedBox(
              width: size.width / 0.4,
              child: CachedNetworkImage(
                imageUrl: "${api.Url.imageUrl}/original$profile",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                // height: height,
              ),
            ),
          ),
          ListTile(
            title: Text(name),
            subtitle: Text(
              character,
              style: textTheme.subtitle2!.copyWith(color: Colors.black54),
            ),
          ),
        ]));
  }
}
