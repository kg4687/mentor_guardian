import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter for navigation

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop(); // Smoothly goes back to previous screen
          },
        ),
        title: const Text(
          "Notification Center",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/no_notification.png', // Update the image path
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              "No new notification",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
