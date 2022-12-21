import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text("You have no favorites yet - start adding some"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id as String,
            title: favoriteMeals[index].title as String,
            imageUrl: favoriteMeals[index].imageUrl as String,
            affordability: favoriteMeals[index].affordability as Affordability,
            complexity: favoriteMeals[index].complexity as Complexity,
            duration: favoriteMeals[index].duration as int,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
