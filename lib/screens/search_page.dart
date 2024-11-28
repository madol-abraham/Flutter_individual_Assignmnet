import 'package:flutter/material.dart';
import 'package:indiviadual_project/models/recipe.api.dart';
import 'package:indiviadual_project/models/recipe.dart';
import 'package:indiviadual_project/screens/recipe_detail_page.dart'; // Import the details page

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Recipe> _allRecipes = [];
  List<Recipe> _filteredRecipes = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  // Fetch recipes from API
  Future<void> _fetchRecipes() async {
    try {
      List<Recipe> recipes = await RecipeApi.getRecipe();
      setState(() {
        _allRecipes = recipes;
        _filteredRecipes = recipes;
      });
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch recipes: $e')),
      );
    }
  }

  // Filter recipes based on the search query
  void _filterRecipes(String query) {
    List<Recipe> filteredList = _allRecipes.where((recipe) {
      return recipe.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredRecipes = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for a recipe',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _filterRecipes, // Call filter function when text changes
            ),
            SizedBox(height: 20),
            // Display filtered recipes
            Expanded(
              child: _filteredRecipes.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = _filteredRecipes[index];
                        return ListTile(
                          title: Text(recipe.name),
                          subtitle: Text(recipe.totalTime),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            // Navigate to the recipe detail page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipeDetailPage(recipe: recipe),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : Center(child: Text("No recipes found")),
                  
            ),
          ],
        ),
      ),
    );
  }
}
