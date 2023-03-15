import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:recepie_app/models/meals.dart';
import 'package:recepie_app/screens/categories_screen.dart';
import 'package:recepie_app/screens/favorites_screen.dart';

import '../ui_modals/custom_drawer.dart';

class TabsManager extends StatefulWidget {
  const TabsManager({
    Key? key,
    required this.availableMeals,
    required this.favoriteMeals,
    // required this.favCheck,
  }) : super(key: key);

  final List<Meal> availableMeals;
  final List<Meal> favoriteMeals;
  // final bool favCheck;

  @override
  State<TabsManager> createState() => _TabsManagerState();
}

class _TabsManagerState extends State<TabsManager> {
  int _tabIndex = 0;

  late final List<Map<dynamic, Widget>> _widgetList = [
    {
      'screen': CategoriesScreen(availableMeals: widget.availableMeals),
      'title': const Text('Categories')
    },
    {
      'screen': FavoritesScreen(
        favoriteMeals: widget.favoriteMeals,
      ),
      'title': const Text('Favorites')
    }
  ];
  void _selectTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetList[_tabIndex]['title'],
        backgroundColor: Colors.grey[800],
      ),
      drawer: const CustomDrawer(),
      body: _widgetList[_tabIndex]['screen'],
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
            selectedFontSize: 13,
            iconSize: 25,
            type: BottomNavigationBarType.shifting,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            selectedItemColor: Colors.white60,
            unselectedItemColor: Colors.black,
            currentIndex: _tabIndex,
            onTap: _selectTab,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.grey[800],
                  icon: const Icon(Icons.category_rounded),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.grey[800],
                  icon: const Icon(Icons.star_border_purple500_rounded),
                  label: 'Favorites'),
            ]),
      ),
    );
  }
}
