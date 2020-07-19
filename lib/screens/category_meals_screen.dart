import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categorMeals[index].id,
            title: categorMeals[index].title,
            imageUrl: categorMeals[index].imageUrl,
            duration: categorMeals[index].duration,
            affordability: categorMeals[index].affordability,
            complexity: categorMeals[index].complexity,
          );
        },
        itemCount: categorMeals.length,
      ),
    );
  }
}
