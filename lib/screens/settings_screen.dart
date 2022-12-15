import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  SettingsScreen(this.currentFilters, this.saveFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget listTile(
      String title, bool val, String subtitle, Function(bool) updateValue) {
    return SwitchListTile(
      value: val,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              listTile(
                  'Gluten-Free', _glutenFree, 'Only include Gluten-free meal',
                  (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              listTile('Vegan', _vegan, 'Only include vegan meal', (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
              listTile('Lactose-Free', _lactoseFree,
                  'Only include Lactose-Free meal', (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              listTile(
                  'Vegeterian', _vegetarian, 'Only include Vegeterian meal',
                  (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
