import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/home_page.dart';
import 'views/notification_page.dart';
import 'views/learning_page.dart';
import 'views/explore_page.dart';
import 'views/profile_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/learning', builder: (context, state) => const LearningPage()),
    GoRoute(path: '/explore', builder: (context, state) => const ExplorePage()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationPage()),
  ],
);
