import 'package:flutter/material.dart';
import 'notification_page.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Max, what do you want to explore?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ExploreCard(
                    imagePath: "images/community.png",
                    title: "Community",
                    description: "Spot the warning signs of burnout and take action",
                  ),
                  ExploreCard(
                    imagePath: "images/challenges.png",
                    title: "Challenges",
                    description: "Spot the warning signs of burnout and take action",
                  ),
                  ExploreCard(
                    imagePath: "images/telecoaching.png",
                    title: "Telecoaching",
                    description: "Spot the warning signs of burnout and take action",
                  ),
                  ExploreCard(
                    imagePath: "images/live_events.png",
                    title: "Live events",
                    description: "Spot the warning signs of burnout and take action",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Explore Card Widget
class ExploreCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ExploreCard({
    required this.imagePath,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFA9D9D6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
        ],
      ),
    );
  }
}
