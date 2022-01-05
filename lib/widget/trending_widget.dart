import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:film_q/model/api.dart' as api;

class TrendingWidget extends StatelessWidget {
  final String name;
  final String voteAverage;
  final String image;
  final String poster;
  TrendingWidget(this.name, this.voteAverage, this.image, this.poster,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(children: [
              Image(
                image: CachedNetworkImageProvider(
                    "${api.Url.imageUrl}/original$image"),
                // TODO: fix image fix
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                      ])),
                ),
              ),
              Positioned(
                  bottom: 0,
                  // left: 0,
                  right: 40,
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Container(
                    alignment: Alignment.center,
                      width: 400,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 380,
                              margin: const EdgeInsets.only(top: 30),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image(
                                  image: CachedNetworkImageProvider(
                                      "${api.Url.imageUrl}/original$poster"), fit: BoxFit.cover,),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            // rating
                            const SizedBox(height: 20),
                            Container(
                              child: Text(
                                'description',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey.shade600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          voteAverage,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.grey.shade600,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2h',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.grey.shade600,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Watch',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )))
            ])));
  }
}
