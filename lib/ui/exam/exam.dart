import 'package:flutter/material.dart';
import 'package:task_management/ui/exam/model.dart';

class FoodRecipes extends StatefulWidget {
  const FoodRecipes({super.key});

  @override
  State<FoodRecipes> createState() => _FoodRecipesState();
}

class _FoodRecipesState extends State<FoodRecipes> {
  late Recipes recipes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Recipes'), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.food_bank),
            // title: Text(recipes["foodTi"]),
            // subtitle: Text(recipes.description),
          );
        },
      ),
    );
  }
}
