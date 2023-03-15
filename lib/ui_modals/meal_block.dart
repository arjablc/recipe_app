import 'package:flutter/material.dart';

import 'package:recepie_app/models/meals.dart';
import 'package:recepie_app/screens/steps_screen.dart';

class MealBlock extends StatelessWidget {
  const MealBlock(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.removeItem})
      : super(key: key);

  final Function removeItem;

  final String id;
  final String imageUrl;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";

      case Complexity.Challenging:
        return "Challenging";

      case Complexity.Hard:
        return "Hard";

      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Luxurious:
        return "Luxurious";

      case Affordability.Pricey:
        return "Pricey";
      default:
        return "unknown";
    }
  }

  //the navigation
  //

  void navigateNext(context) {
    Navigator.of(context)
        .pushNamed(StepsScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return InkWell(
        onTap: () => navigateNext(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Stack(
            children: [
              Container(
                height: mediaQuery.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Hero(
                    tag: id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${duration.toString()}min",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.work,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          complexityText,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const Divider(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        const Icon(
                                          Icons.attach_money_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          affordabilityText,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ))
                            ])
                      ]),
                    ),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
