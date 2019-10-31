import 'package:flutter/material.dart';
import 'my_movies.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movies',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MoviePage(),
  ));
}
