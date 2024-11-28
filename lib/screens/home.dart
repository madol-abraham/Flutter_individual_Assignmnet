import 'package:flutter/material.dart';
import 'package:indiviadual_project/models/recipe.api.dart'; // Import API service to fetch recipe data
import 'package:indiviadual_project/models/recipe.dart';    // Import the Recipe model
import 'package:indiviadual_project/screens/widgets/recipe_card.dart';  // Import a custom widget to display recipes


/// HomePage is the main screen of the app that fetches and displays a list of recipes.
/// It uses a list view to dynamically display recipe details fetched from an API.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// _HomePageState handles the state and logic for the HomePage widget.

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes; // List to store fetched recipes
  bool _isLoading = true;    // State to track whether data is loading

  @override
  void initState() {
    super.initState();
    getRecipes(); // Fetch recipes when the widget is initialized
  }
  
  /// Fetches recipes from the Recipe API asynchronously.
  /// Updates the _recipes list and stops the loading indicator.
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(); // API call to get recipes
    setState(() {
      _isLoading = false; // Update state to indicate data has been loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar provides the top section of the page with a title and an icon
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Center-align the title and icon
            children: [
              Icon(Icons.restaurant_menu), // Icon for the title
              SizedBox(width: 10),  // Space between the icon and the text
              Text('Food Recipe')   // Title text
            ],
          ),
        ),
        // Body of the Scaffold displays either a loading indicator or a list of recipes
        body: _isLoading
            ? Center(child: CircularProgressIndicator())  // Show loading indicator while fetching data
            : ListView.builder(
                itemCount: _recipes.length, // Number of items in the list
                itemBuilder: (context, index) {
                  // Generate a RecipeCard widget for each recipe
                  return RecipeCard(
                      title: _recipes[index].name, // Recipe name
                      cookTime: _recipes[index].totalTime, // Total cooking time
                      rating: _recipes[index].rating.toString(), // Recipe rating
                      thumbnailUrl: _recipes[index].images);  // Recipe image URL
                },
              ));
  }
}  