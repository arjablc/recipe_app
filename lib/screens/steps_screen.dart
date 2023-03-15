import 'package:flutter/material.dart';

import 'package:recepie_app/data/dummy_data.dart';
import 'package:recepie_app/models/meals.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({
    Key? key,
    required this.toggelFavorite,
    required this.favCheck,
  }) : super(key: key);
  final Function toggelFavorite;
  final Function favCheck;
  static const routeName = "/steps_screen";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    Meal selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Hero(tag: mealId, child: Image.network(selectedMeal.imageUrl)),
          ListTile(
            style: ListTileStyle.drawer,
            contentPadding: const EdgeInsets.all(5),
            visualDensity: VisualDensity.compact,
            tileColor: Colors.white.withOpacity(1),
            leading: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: Text(
              selectedMeal.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
        const Divider(
          height: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            'Ingredients',
            style: TextStyle(color: Colors.grey[300], fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          height: size.height * 0.175,
          child: ListView(children: [
            ...selectedMeal.ingredients.map((e) => Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5, top: 5),
                  child: Text(
                    e,
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ))
          ]),
        ),
        const Divider(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Steps',
            style: TextStyle(color: Colors.grey[300], fontSize: 22),
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1)),
          margin: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                child: Card(
                  color: Colors.blueGrey[900],
                  elevation: 10,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${index + 1}.  ${selectedMeal.steps[index]}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  )),
                ),
              );
            },
          ),
        )),
        const SizedBox(
          height: 5,
        )
      ])),
      floatingActionButton: FloatingActionButton(
        elevation: 100,
        onPressed: () => toggelFavorite(mealId),
        child: favCheck(mealId)
            ? const Icon(
                Icons.star_rounded,
                color: Colors.red,
              )
            : const Icon(Icons.star_outline_rounded),
      ),
    );
  }
}
