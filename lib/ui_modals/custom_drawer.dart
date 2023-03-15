import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recepie_app/screens/categories_screen.dart';
import 'package:recepie_app/screens/filters_screen.dart';
import 'package:recepie_app/screens/tab_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Function? navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
            child: const SizedBox.expand(),
          ),
          Drawer(
            elevation: 10,
            surfaceTintColor: Colors.red,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20))),
            backgroundColor: Colors.grey[900],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey[800],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.food_bank_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'What\'s cookin\' YO',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[300]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildDrawerTiles(
                  context: context,
                  icon: Icons.restaurant,
                  title: "Meals",
                  // handler: navigate(context, CategoriesScreen.routeName),
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildDrawerTiles(
                  context: context,
                  icon: Icons.filter_alt,
                  title: "Filters",
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildDrawerTiles extends StatelessWidget {
  const BuildDrawerTiles({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    // required this.handler,
  });

  final BuildContext context;
  final IconData icon;
  final String title;
  // final void handler;

  void navigatePage(String tileTitle) {
    String routeName = '/';
    if (title == "Filters") {
      routeName = FiltersScreen.routeName;
    } else if (title == "Meals") {
      routeName = '/';
    }
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey[900]?.withOpacity(0.7)),
      child: Center(
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onTap: () => navigatePage(title),
          splashColor: Colors.red,
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.grey[300])),
        ),
      ),
    );
  }
}
