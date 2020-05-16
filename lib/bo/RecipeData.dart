import 'package:flutter/material.dart';
import 'package:myrecipes/bo/Ingredients.dart';

class RecipeData {
  String title = '';
  Image image = Image.network('https://picsum.photos/250?image=9');
  String description = '';
  int time = 0;
  int amountPersons = 0;
  List<Ingredients> ingredients = List(0);
  List<String> workingSteps = List(0);
}