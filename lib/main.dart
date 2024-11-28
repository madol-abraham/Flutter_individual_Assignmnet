// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:indiviadual_project/screens/favorites.dart';
import 'package:indiviadual_project/screens/home.dart';
import 'package:indiviadual_project/screens/nutrients.dart';
import 'package:indiviadual_project/screens/search_page.dart';
// ignore: unused_import
import 'package:indiviadual_project/screens/recipe_detail_page.dart'; 

void main() {
  runApp(MyApp());// the app is initialize here
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipe',// This is the title of my app
      debugShowCheckedModeBanner: false,  // Disable debug banner for cleaner UI
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Define primary theme color
        primaryColor: Colors.white,  // Define primary color for widgets
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: MainPage(), // MainPage with bottom navigation
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState(); // Create state for MainPage
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; // Track selected tab

  // Pages for bottom navigation
  final List<Widget> _pages = [
    HomePage(),      // Home Page
    NutrientInformationPage(), // Nutrients Page 
    FavoritesPage(), // Favorites Page
    SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Switch tabs or Update current index on tab tap
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon for the Home tab
            label: 'Home', // Label for the Home tab
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,  // Set the background color to blue
            icon: Icon(Icons.info), // Icon for the Nutrients tab
            label: 'Nutrients', // Label for the Nutrients tab
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon for the Favorites tab
            label: 'Favorites',  // Label for the Favorites tab
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Icon for the Favorites tab
            label: 'Search',  // Label for the Favorites tab
          ),
        ],
      ),
    );
  }
}
