import 'package:flutter/material.dart';
import 'package:portfolio/Fragment/RankingPage.dart';
import 'QuizScreen.dart';
import 'AddQuestionScreen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserAuthenticationPage()),
                );
              },
              child: Text('User'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminAuthenticationPage()),
                );
              },
              child: Text('Admin'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RankingPage(scores: [
                    // Add example scores here
                    {'name': 'attempt 1', 'score': 2},
                    {'name': 'attempt 2', 'score': 1},
                    {'name': 'attempt 3', 'score': 4},
                  ])),
                );
              },
              child: Text('Ranking'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAuthenticationPage extends StatefulWidget {
  @override
  _UserAuthenticationPageState createState() => _UserAuthenticationPageState();
}

class _UserAuthenticationPageState extends State<UserAuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  final _passcodeController = TextEditingController();

  @override
  void dispose() {
    _passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _passcodeController,
                decoration: InputDecoration(labelText: 'Enter User Passcode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a passcode';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_passcodeController.text == 'abcd') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen(mode: null,)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid user passcode')),
                    );
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminAuthenticationPage extends StatefulWidget {
  @override
  _AdminAuthenticationPageState createState() => _AdminAuthenticationPageState();
}

class _AdminAuthenticationPageState extends State<AdminAuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  final _passcodeController = TextEditingController();

  @override
  void dispose() {
    _passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _passcodeController,
                decoration: InputDecoration(labelText: 'Enter Admin Passcode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a passcode';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_passcodeController.text == '1234') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AddQuestionScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid admin passcode')),
                    );
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}