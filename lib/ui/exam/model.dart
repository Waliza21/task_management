class Recipe {
  final String foodTitle;
  final String description;
  final String ingredients;

  Recipe({
    required this.foodTitle,
    required this.description,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      foodTitle: json['foodTitle'] as String,
      description: json['description'] as String,
      ingredients: json['ingredients'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodTitle': foodTitle,
      'description': description,
      'ingredients': ingredients,
    };
  }
}

class Recipes {
  late List<Recipe> recipes;

  Recipes(this.recipes);
}
