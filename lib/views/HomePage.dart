import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter for navigation

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/login'), // Ensure '/login' route exists in main.dart
          child: const Text('Go to Login'),
        ),
      ),
    );
  }
}
