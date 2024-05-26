// Portfolio.dart

import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.grey[900]!],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project list",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            PortfolioItem(
              projectName: "My Quiz+Weather App",
              projectLink: "https://github.com/Khaledalif3388/Quiz-weather-app",
              projectDescription: "In this project i'm done here 2 apps together.",
            ),
            SizedBox(height: 16),
            PortfolioItem(
              projectName: "Food Ordering",
              projectLink: "https://github.com/Khaledalif3388/foodmate.github.io",
              projectDescription: "This is a description of Project 2.",
            ),
            SizedBox(height: 16),
            PortfolioItem(
              projectName: "Password Based Door Lock System(IOT)",
              projectLink: "https://drive.google.com/drive/u/1/folders/1oWO8aqqzY12TyNrUmH57eZjheuKN98-t",
              projectDescription: "This is a description of Project 3.",
            ),
            SizedBox(height: 16),
            PortfolioItem(
              projectName: "Phone Book",
              projectLink: "https://drive.google.com/drive/u/1/search?q=phone book",
              projectDescription: "This is a description of Project 2.",
            ),
            // Add more PortfolioItem widgets as needed
          ],
        ),
      ),
    );
  }
}

class PortfolioItem extends StatelessWidget {
  final String projectName;
  final String projectLink;
  final String projectDescription;

  const PortfolioItem({
    required this.projectName,
    required this.projectLink,
    required this.projectDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.grey[800],
      child: ListTile(
        title: Text(
          projectName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              projectDescription,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              projectLink,
              style: TextStyle(
                color: Colors.teal,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        onTap: () {
          // Add actions for when the portfolio item is tapped
        },
      ),
    );
  }
}
