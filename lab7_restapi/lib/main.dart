import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab7_restapi/product/models/Product.dart';
import 'package:lab7_restapi/product/widgets/productWidget.dart';
import 'package:http/http.dart' as http;

final URL = "http://172.20.2.235:8080";
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<MyApp> {
  List<Product> _products = new List.from([]);
  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  Future<void> _populateAllMovies() async {
    final products = await _fetchAllProducts();
    setState(() {
      _products = products;
    });
  }

  Future<List<Product>> _fetchAllProducts() async {
    String request = URL + "/api/products";

    Uri uri = Uri.parse("http://172.20.2.235:8080/api/products");

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["data"];
      return list.map((product) => Product.fromJSON(product)).toList();
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
        body: productWidget(products: _products),
      ),
    );
  }
}
