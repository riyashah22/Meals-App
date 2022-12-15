import 'package:flutter/material.dart';
import 'package:meals_app/screens/catrgories_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages?[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages?[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
    // Another code for making tab bar
    //   return DefaultTabController(
    //     length: 2, // one for all categores one for fav item
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Meals'),
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: [
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
