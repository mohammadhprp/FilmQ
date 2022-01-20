import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_q/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';

import 'package:film_q/model/api.dart' as api;
import 'package:film_q/service/search_service.dart';
import 'package:film_q/model/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<Search> _fechSearch;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final query = ModalRoute.of(context)!.settings.arguments as String;
    _fechSearch = fechSearch(query);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    final query = ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder<Search>(
        future: _fechSearch,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text(query),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Container(
                color: const Color(0xFF262626),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.white10,
                        indent: 12,
                        endIndent: 12,
                      );
                    },
                    itemCount: snapshot.data!.results!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        child: SearchResult(
                          name: snapshot.data!.results![index].mediaType == "tv"
                              ? "${snapshot.data!.results![index].name}"
                              : "${snapshot.data!.results![index].title}",
                          image: "${snapshot.data!.results![index].posterPath}",
                          type: "${snapshot.data!.results![index].mediaType}",
                          date: snapshot.data!.results![index].mediaType == "tv"
                              ? "${snapshot.data!.results![index].firstAirDate}"
                              : "${snapshot.data!.results![index].releaseDate}",
                          id: snapshot.data!.results![index].id as int,
                        ),
                      );
                    }),
              ),
            );
          } else if (snapshot.hasError) {
            logger.e(snapshot.error);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class SearchResult extends StatelessWidget {
  final String name;
  final String image;
  final String type;
  final String date;
  final int id;

  const SearchResult(
      {Key? key,
      required this.name,
      required this.image,
      required this.type,
      required this.date,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dateTime = DateTime.parse(date);
    final format = DateFormat('yyyy');
    final year = format.format(dateTime);
    return Container(
      child: ListTile(
        title: Text(
          name,
          style: textTheme.headline6,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: "${api.Url.imageUrl}/w500$image",
            progressIndicatorBuilder: (context, url, downloadProgress) => Align(
              alignment: Alignment.center,
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            // height: height,
          ),
        ),
        subtitle: type == "tv"
            ? Row(
                children: [
                  Icon(
                    LineIcons.television,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 7),
                  Text('series ($year)'),
                ],
              )
            : Row(
                children: [
                  Icon(
                    LineIcons.film,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 7),
                  Text('Movie ($year)'),
                ]
              ),
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: {"id": id, "media_type": type});
        },
      ),
    );
  }
}
