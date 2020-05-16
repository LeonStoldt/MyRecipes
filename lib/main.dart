import 'package:flutter/material.dart';
import 'package:myrecipes/HomeView.dart';

void main() => runApp(MyRecipes());

class MyRecipes extends StatelessWidget {
  static const String _title = 'MyRecipes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeView(title: _title),
    );
  }
}