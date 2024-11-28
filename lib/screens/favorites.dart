import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favorites = []; // List to hold favorite food names

  // Sample list of favorite food items (you can replace with real data)
  final List<String> availableFoods = [
    'Apple', 'Banana', 'Carrot', 'Chicken Breast', 'Spinach', 'milk', 'salmon', 'egg' , 'Rice'
  ];

  // Toggle favorite status
  void _toggleFavorite(String food) {
    setState(() {
      if (favorites.contains(food)) {
        favorites.remove(food);
      } else {
        favorites.add(food);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: availableFoods.length,
        itemBuilder: (context, index) {
          String food = availableFoods[index];
          bool isFavorite = favorites.contains(food);

          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              leading: Icon(
                Icons.fastfood,
                color: Colors.teal,
                size: 40,
              ),
              title: Text(
                food,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () => _toggleFavorite(food),
              ),
            ),
          );
        },
      ),
    );
  }
}
