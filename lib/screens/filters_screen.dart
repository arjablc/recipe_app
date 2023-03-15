import 'package:flutter/material.dart';

import 'package:recepie_app/ui_modals/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    Key? key,
    required this.filterTriggered,
    required this.filterSettings,
  }) : super(key: key);
  static const routeName = '/filters-screen';

  final Function filterTriggered;
  final Map<String, bool> filterSettings;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _gluten = widget.filterSettings['gluten']!;
  late bool _lactose = widget.filterSettings['lactose']!;
  late bool _vegeterian = widget.filterSettings['vegeterian']!;
  late bool _vegan = widget.filterSettings['vegan']!;

  Widget buildSwitchTiles(String title, String description,
      void Function(bool)? setFilters, bool currentValue) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: SwitchListTile(
        value: currentValue,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white),
        ),
        onChanged: setFilters,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Filters'),
        backgroundColor: Colors.grey[800],
      ),
      body: Column(children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'All your Filters Here!!!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwitchTiles('Lactose-Free', "Only lactose free stuff",
                (newValue) {
              setState(() {
                _lactose = newValue;
              });
            }, _lactose),
            buildSwitchTiles('Gluten-Free', "Only Gluten free stuff",
                (newValue) {
              setState(() {
                _gluten = newValue;
              });
            }, _gluten),
            buildSwitchTiles('Vegan', "Vegan food only", (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }, _vegan),
            buildSwitchTiles('Vegeterian', "Vegen Vegeterian same thing",
                (newValue) {
              setState(() {
                _vegeterian = newValue;
              });
            }, _vegeterian)
          ],
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Map<String, bool> filtersSetting = {
            "lactose": _lactose,
            "gluten": _gluten,
            "vegan": _vegan,
            "vegeterian": _vegeterian
          };
          widget.filterTriggered(filtersSetting);
        },
        child: const Icon(Icons.check_rounded),
      ),
    );
  }
}
