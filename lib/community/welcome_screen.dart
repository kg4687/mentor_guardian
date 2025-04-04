import 'package:flutter/material.dart';
import 'username_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/community.png", height: 150), // Add an image
              SizedBox(height: 20),
              Text("Welcome to the Community!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Connect, engage, and share with like-minded people."),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UsernameScreen()));
                },
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
