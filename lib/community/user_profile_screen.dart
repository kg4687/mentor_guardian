import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String username = "JohnDoe";
  final String bio = "Tech enthusiast. Lifelong learner.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            SizedBox(height: 10),
            Text(username, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(bio, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Follow"),
            ),
          ],
        ),
      ),
    );
  }
}
