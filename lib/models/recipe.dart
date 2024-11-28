class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final List<String> ingredients; // Added ingredients
  final List<String> instructions; // Added instructions

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
    required this.ingredients, // Initialize ingredients
    required this.instructions, // Initialize instructions
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      ingredients: List<String>.from(json['ingredients'] ?? []), // Parse or default to empty list
      instructions: List<String>.from(json['instructions'] ?? []), // Parse or default to empty list
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
