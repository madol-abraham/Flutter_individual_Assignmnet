import 'package:flutter/material.dart';
/// A StatelessWidget to display detailed nutrient information for various food items.
class NutrientInformationPage extends StatelessWidget {
  // List of food items with nutrient details and image paths
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Apple',
      'imagePath': 'assets/images/apple.jpg',
      'calories': 52,
      'carbohydrates': '14g',
      'proteins': '0.3g',
      'fats': '0.2g',
      'fiber': '2.4g',
    },
     // Additional food items go here
    {
      'name': 'Banana',
      'imagePath': 'assets/images/banana.jpg',
      'calories': 96,
      'carbohydrates': '27g',
      'proteins': '1.3g',
      'fats': '0.3g',
      'fiber': '2.6g',
    },
    {
      'name': 'Broccoli',
      'imagePath': 'assets/images/brocolli.jpg',
      'calories': 55,
      'carbohydrates': '11g',
      'proteins': '3.7g',
      'fats': '0.6g',
      'fiber': '2.6g',
    },
    {
      'name': 'Carrot',
      'imagePath': 'assets/images/carrot.jpg',
      'calories': 41,
      'carbohydrates': '10g',
      'proteins': '0.9g',
      'fats': '0.2g',
      'fiber': '2.8g',
    },
    {
      'name': 'Chicken Breast',
      'imagePath': 'assets/images/chicken_breast.jpg',
      'calories': 165,
      'carbohydrates': '0g',
      'proteins': '31g',
      'fats': '3.6g',
      'fiber': '0g',
    },
    {
      'name': 'Egg',
      'imagePath': 'assets/images/egg.jpg',
      'calories': 68,
      'carbohydrates': '0.6g',
      'proteins': '6g',
      'fats': '5g',
      'fiber': '0g',
    },
    {
      'name': 'Spinach',
      'imagePath': 'assets/images/spinach.jpg',
      'calories': 23,
      'carbohydrates': '3.6g',
      'proteins': '2.9g',
      'fats': '0.4g',
      'fiber': '2.2g',
    },
    {
      'name': 'Rice',
      'imagePath': 'assets/images/rice.jpg',
      'calories': 130,
      'carbohydrates': '28g',
      'proteins': '2.7g',
      'fats': '0.3g',
      'fiber': '0.4g',
    },
    {
      'name': 'Salmon',
      'imagePath': 'assets/images/salmon.jpg',
      'calories': 208,
      'carbohydrates': '0g',
      'proteins': '20g',
      'fats': '13g',
      'fiber': '0g',
    },
    {
      'name': 'Milk',
      'imagePath': 'assets/images/milk.jpg',
      'calories': 42,
      'carbohydrates': '5g',
      'proteins': '3.4g',
      'fats': '1g',
      'fiber': '0g',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrient Information'),
        centerTitle: true,
      ),
      // Main content area with padding
      body: Padding(
        padding: const EdgeInsets.all(12.0),  // Outer padding around the list
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final food = foodItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fixed image container with asset images
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(food['imagePath']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Nutrient details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildNutrientDetail('Calories', '${food['calories']} kcal'),
                              _buildNutrientDetail('Carbs', food['carbohydrates']),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildNutrientDetail('Proteins', food['proteins']),
                              _buildNutrientDetail('Fats', food['fats']),
                            ],
                          ),
                          SizedBox(height: 8),
                          _buildNutrientDetail('Fiber', food['fiber']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
/// Helper method to build a nutrient detail widget with a label and value.
  Widget _buildNutrientDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
