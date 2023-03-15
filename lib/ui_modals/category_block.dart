import 'package:flutter/material.dart';

import 'package:recepie_app/models/meals.dart';
import 'package:recepie_app/screens/meals_screen.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
    required this.availableMeals,
  }) : super(key: key);
  final String id;
  final String title;
  final Color color;
  final List<Meal> availableMeals;

  void navigateNext(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                  availableMeals: availableMeals,
                  catId: id,
                  title: title,
                  color: color,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => navigateNext(context),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color.withOpacity(0.4)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}
