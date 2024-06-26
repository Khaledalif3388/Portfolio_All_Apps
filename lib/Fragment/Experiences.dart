import 'package:flutter/material.dart';

class Experiences extends StatelessWidget {
  const Experiences({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiences"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Assets/images/BG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExperienceTile(
                  company: "Google Company",
                  icon: Icons.work,
                  role: "Software Engineer",
                  years: "2020 - Present",
                  about: "Google Company is a leading software company specializing in innovative solutions for various industries.",
                ),
                _buildExperienceTile(
                  company: "IT BD Solutions",
                  icon: Icons.work,
                  role: "Android Developer",
                  years: "2016 - 2018",
                  about: "IT BD Solutions is a software development firm known for its Android app development expertise.",
                ),
                _buildExperienceTile(
                  company: "IT Company",
                  icon: Icons.work,
                  role: "Junior Developer",
                  years: "2018-2020",
                  about: "IT Company is a software development firm known for its Android app development expertise.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceTile({
    required String company,
    required IconData icon,
    required String role,
    required String years,
    required String about,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.teal, // Change the color to teal
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role, style: TextStyle(fontSize: 18, color: Colors.white70)),
          Text(
            years,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 8), // Add spacing between role/years and about
          Text(
            about,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
