import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fruit.dart';
import 'fruitlist.dart';

Future<List<Fruit>> fetchFruit() async {
  final response = await http.get('https://www.fruityvice.com/api/fruit/all')
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Fruit>> products;
  MyHomePage({required Key key, required this.title, required this.products})
      : super(key: key);

  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, title: Text("Fruity Fruits")),
      body: Center(
          child: FutureBuilder<List<Fruit>>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? FruitList(items: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              })),
    );
  }
}
