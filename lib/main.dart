import 'package:flutter/material.dart';
import 'package:movies/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
