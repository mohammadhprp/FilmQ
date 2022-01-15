import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'package:film_q/model/credits.dart' as credits_model;
import 'package:film_q/service/credits_service.dart';
import 'package:film_q/widget/credits_widget.dart';

class CreditsScreen extends StatefulWidget {
  final int id;
  final String type;
  static const routeName = '/credits';

  const CreditsScreen({Key? key, required this.id, required this.type})
      : super(key: key);

  @override
  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  late Future<credits_model.Credits> _fechCredits;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _fechCredits = fechCredits(widget.id, widget.type
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return FutureBuilder<credits_model.Credits>(
        future: _fechCredits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                itemCount: snapshot.data!.cast!.length,
                options: CarouselOptions(
                  height: 320,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                ),
                itemBuilder: (context, index, id) {
                  return Credits(
                    name: "${snapshot.data!.cast![index].name}",
                    originalName: "${snapshot.data!.cast![index].originalName}",
                    character: "${snapshot.data!.cast![index].character}",
                    profile: "${snapshot.data!.cast![index].profilePath}",
                  );
                });
          } else if (snapshot.hasError) {
            logger.e(snapshot.error);
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
