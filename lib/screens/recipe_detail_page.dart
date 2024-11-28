import 'package:flutter/material.dart';
import 'package:indiviadual_project/models/recipe.dart';

/// A stateless widget that displays detailed information about a [Recipe].
class RecipeDetailPage extends StatelessWidget {
  /// The [Recipe] object containing all necessary details to display.
  final Recipe recipe;
 // Creates a [RecipeDetailPage] with the given [recipe].
  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 // App bar with the recipe's name as the title
      appBar: AppBar(
        title: Text(recipe.name),
 // Main content of the page with padding for better UI       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Total Time: ${recipe.totalTime} minutes',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Check if ingredients are not null and iterate
            // ignore: unnecessary_null_comparison
            if (recipe.ingredients != null && recipe.ingredients.isNotEmpty)
              for (var ingredient in recipe.ingredients)
                Text('• $ingredient', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Check if instructions are not null and iterate
            // ignore: unnecessary_null_comparison
            if (recipe.instructions != null && recipe.instructions.isNotEmpty)
              for (var step in recipe.instructions)
                Text('• $step', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}