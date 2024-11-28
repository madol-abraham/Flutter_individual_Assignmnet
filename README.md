
# indiviadual_project

# Food Recipe App

A mobile application built with **Flutter** that allows users to explore, search, and save food recipes. The app leverages the **Yummly API** to provide users with a variety of recipes, complete with detailed instructions, ingredients, and nutritional information.  

## Table of Contents

- Features
- Purpose
  Codebase Overview
- API Integration
- Installation Guide
- Challenges and Solutions
- Technologies 
- Acknowledgments

---

 Features

- Home Screen: Displays a curated list of popular recipes fetched from the API.
- Search Functionality: Allows users to search for recipes based on ingredients, meal type, or dietary preferences.
- Recipe Details: Provides detailed information about a selected recipe, including:
  - Cooking instructions
  - List of ingredients
  - Nutritional information
- Favorites: Users can save their favorite recipes for quick access.
- Responsive UI: The app is designed to provide a seamless experience on devices of various screen sizes.

---

## Purpose

The Food Recipe App was developed to offer a convenient way for users to explore and save recipes. It is ideal for home cooks, culinary enthusiasts, and anyone looking for inspiration in the kitchen. By using the Yummly API, the app provides access to a comprehensive database of recipes that cater to a variety of preferences and dietary restrictions.  

---

## Codebase Overview

The codebase is organized as follows:

flutter_Recipe_Api/
├── lib/
│   ├── main.dart               # Entry point of the application
│   ├── screens/                # Contains screen widgets for the app
│   │   ├── home_screen.dart    # Home page displaying recipe list
│   │   ├── search_screen.dart  # Search page with filtering capabilities
│   │   ├── details_screen.dart # Detailed view of a single recipe
│   ├── widgets/                # Reusable UI components
│   ├── services/               # API and network-related code
│   │   ├── api_service.dart    # Handles API requests and responses
│   └── models/                 # Data models for parsing API responses
│       ├── recipe.dart         # Recipe model
│       ├── ingredient.dart     # Ingredient model
├── pubspec.yaml                # Dependency configurations
└── README.md                   # Documentation for the project


Critical Components
Screens: Represents the app's user interface and navigation flow.
API Service: Manages HTTP requests to fetch data from the Yummly API.
Models: Defines the structure of data received from the API.
Widgets: Contains reusable UI components for consistent design.
API Integration
This app uses the Yummly API to fetch recipe data. Key API functionalities include:

Searching recipes by keywords or filters.
Fetching recipe details, including ingredients and nutritional values.
Authentication
The Yummly API requires an API Key and Host, which are stored securely within the app's configuration.

Installation Guide
Follow these steps to run the project locally:

Clone the repository:

bash
Copy code
git clone https://github.com/madol-abraham/Flutter_individual_Assignmnet.git
Navigate to the project directory:

bash
Copy code
cd Flutter_individual_Assignmnet
Install Flutter dependencies:

bash
Copy code
flutter pub get
Configure the API Key in api_service.dart:

dart
Copy code
const String apiKey = 'YOUR_API_KEY';
const String apiHost = 'yummly2.p.rapidapi.com';
Run the app on an emulator or connected device:

bash
Copy code
flutter run
Challenges and Solutions
API Data Parsing

Challenge: Handling complex JSON responses from the Yummly API.
Solution: Developed data models using Dart’s json_serializable package for efficient parsing.
UI Responsiveness

Challenge: Ensuring the app layout works across various screen sizes.
Solution: Leveraged MediaQuery and flexible widgets like Expanded and Wrap.
Search Optimization

Challenge: Implementing real-time search without overloading the API with frequent requests.
Solution: Introduced a debounce mechanism to limit API calls during search input.
Technologies Used
Flutter: For building the cross-platform mobile app.
Dart: Programming language used in the app.
Yummly API: Recipe data source.
http: For making API requests.
Provider: State management for updating UI based on API data.

Acknowledgments
Yummly API: For providing access to an extensive recipe database.
Flutter: For enabling seamless cross-platform development.
Chatgpt: for enabling me to do debugging and fixed errors
ALU: For fostering a learning environment that encourages innovation and practical application of knowledge.

