import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter for navigation

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/home'), // Navigate to HomePage
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
//