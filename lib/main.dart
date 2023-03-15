import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recepie_app/data/dummy_data.dart';
import 'package:recepie_app/screens/categories_screen.dart';
import 'package:recepie_app/screens/meals_screen.dart';

import 'package:recepie_app/screens/steps_screen.dart';
import 'package:recepie_app/screens/tab_screen.dart';
import 'package:recepie_app/screens/filters_screen.dart';

import 'models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filtersSetting = {
    "lactose": false,
    "gluten": false,
    "vegan": false,
    "vegeterian": false
  };
  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  void filtersTriggered(Map<String, bool> filterData) {
    setState(() {
      filtersSetting = filterData;

      availableMeals = dummyMeals.where((element) {
        if (filtersSetting['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (filtersSetting['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (filtersSetting['vegeterian']! && !element.isVegetarian) {
          return false;
        }
        if (filtersSetting['vegan']! && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final int existingMealIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingMealIndex == 0) {
      setState(() {
        favoriteMeals.removeAt(existingMealIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return favoriteMeals.any((element) => mealId == element.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.blueGrey[900],
          textTheme: const TextTheme(
              displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ))),
      home: TabsManager(
          availableMeals: availableMeals, favoriteMeals: favoriteMeals),
      routes: {
        StepsScreen.routeName: (_) => StepsScreen(
            toggelFavorite: toggleFavorite, favCheck: isMealFavorite),
        CategoriesScreen.routeName: (_) =>
            CategoriesScreen(availableMeals: availableMeals),
        FiltersScreen.routeName: (_) => FiltersScreen(
            filterTriggered: filtersTriggered, filterSettings: filtersSetting)
      },
    );
  }
}
