// it will choose meals for specific category
import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String? categoryId;
  // final String? categoryTitle;
  // const CategoryMealsScreen({super.key, this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
    final catagoryId = routeArgs['id'];
    final catagoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      // Contains returns true if category give a return value
      return meal.categories!.contains(catagoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id as String,
              title: categoryMeals[index].title as String,
              imageUrl: categoryMeals[index].imageUrl as String,
              affordability:
                  categoryMeals[index].affordability as Affordability,
              complexity: categoryMeals[index].complexity as Complexity,
              duration: categoryMeals[index].duration as int);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
