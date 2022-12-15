// it will choose meals for specific category
import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;
  var _loadedInitData = false;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
      final catagoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeal = widget.availableMeal.where((meal) {
        // Contains returns true if category give a return value
        return meal.categories!.contains(catagoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal?.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String? categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal?[index].id as String,
            title: displayedMeal?[index].title as String,
            imageUrl: displayedMeal?[index].imageUrl as String,
            affordability: displayedMeal?[index].affordability as Affordability,
            complexity: displayedMeal?[index].complexity as Complexity,
            duration: displayedMeal?[index].duration as int,
          );
        },
        itemCount: displayedMeal?.length,
      ),
    );
  }
}
