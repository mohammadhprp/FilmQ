import 'package:film_q/screen/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:film_q/screen/home_screen.dart';
import 'package:film_q/screen/detail_screen.dart';
import 'package:film_q/screen/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final originalTheme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Film Q',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: originalTheme.textTheme.copyWith(
          subtitle2: originalTheme.textTheme.subtitle1!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
              headline6:  originalTheme.textTheme.subtitle1!.copyWith(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          caption: originalTheme.textTheme.subtitle1!.copyWith(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
        )
      ),
      home: const HomeScreen(),
      routes: {
        DetailScreen.routeName: (context) => DetailScreen(),
        SearchScreen.routeName: (context) => SearchScreen()
      },
    );
  }
}
