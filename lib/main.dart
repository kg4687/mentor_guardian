import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor_guardian/community/welcome_screen.dart';
import 'views/home_page.dart';
import 'views/notification_page.dart';
import 'views/learning_page.dart';
import 'views/explore_page.dart';
import 'views/profile_page.dart';
import 'widgets/MainScreen.dart';
import 'views/challenges_page.dart';


final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) =>  MainScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/learning', builder: (context, state) => const LearningPage()),
    GoRoute(path: '/explore', builder: (context, state) => const ExplorePage()),
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationPage()),
    GoRoute(path: '/challenges', builder: (context, state) => const ChallengesPage()),
    GoRoute(path: '/', builder: (context, state) => const ExplorePage(),),
    GoRoute(path: '/community', builder: (context, state) => WelcomeScreen(),),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.pink),

      routerConfig: _router,
    );
  }
}
