import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../data/dummy_data.dart';

class Filters with ChangeNotifier {
  final List _gluttonFree = dummyMeals.where((element) => element.isGlutenFree == true )as List;
  final List _vegan = dummyMeals.where((element) => element.isVegan == true )as List;
  final List _vegeterain = dummyMeals.where((element) => element.isVegetarian == true )as List;
  final List _lactoseFree = dummyMeals.where((element) => element.isLactoseFree == true )as List;

  //defining getters
  List get gluttonFree => _gluttonFree;
  List get vegan => _vegan;
  List get vegeterian => _vegeterain;
  List get lactoseFree => _lactoseFree;

  
}
