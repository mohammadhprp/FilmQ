import 'package:flutter/material.dart';

import 'package:film_q/screen/home_screen.dart';
import 'package:film_q/screen/detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        DetailScreen.routeName: (context) => DetailScreen()
      },
    );
  }
}
