class Recipes {
  final String foodTitle;
  final String description;
  final String ingredients;

  Recipes({required this.foodTitle, required this.description, required this.ingredients});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
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