import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab7/hello_movies/models/Movie.dart';
import 'package:lab7/hello_movies/widgets/moviesWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<MyApp> {
  List<Movie> _movies = new List.from([]);
  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  Future<void> _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchAllMovies() async {
    Uri uri = Uri.parse("https://www.omdbapi.com/?s=Batman&page=1&apikey=564727fa");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJSON(movie)).toList();
    } else {
      throw Exception("Failed to load movie");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",
      home: Scaffold(
        appBar: AppBar(title: Text("Lab07_movie_app")),
        body: MoviesWidget(movies: _movies),
      ),
    );
  }
}
