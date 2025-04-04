import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/notification_icon.dart';
import '../community/community_home.dart';// Import Notification Icon widget

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Explore",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          NotificationIcon(), // Bell icon in the top right
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Max, what do you want to explore?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Full-width Tiles
            Expanded(
              child: ListView(
                children: [
                  // 🔹 Fixed Community Navigation using go_router
                  const ExploreTile(imagePath: "images/community.png", title: "Community", route: "/community"), // Route defined in GoRouter),
                  const ExploreTile(imagePath: "images/challenges.png", title: "Challenges", route: "/challenges"),
                  const ExploreTile(imagePath: "images/telecoaching.png", title: "Telecoaching", route: "/telecoaching"),
                  const ExploreTile(imagePath: "images/live_events.png", title: "Live Events", route: "/live-events"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Beautiful Explore Tile Widget
class ExploreTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? route;

  const ExploreTile({required this.imagePath, required this.title, this.route, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          context.push(route!); // Use go_router for navigation
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            // Image on the Left
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),

            // Title on the Right
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Arrow Icon
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
