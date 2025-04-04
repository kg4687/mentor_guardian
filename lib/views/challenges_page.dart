import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.pop(); // Goes back to previous page
          },
        ),
        title: const Text(
          "Challenges",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            ChallengeTile(imagePath: "images/productivity.png", title: "Productivity",),
            ChallengeTile(imagePath: "images/organization.png", title: "Organization",),
            ChallengeTile(imagePath: "images/mindfulness.png", title: "Mindfulness",),
            ChallengeTile(imagePath: "images/managing_emotions.png", title: "Managing emotions",),
          ],
        ),
      ),
    );
  }
}

// 🔹 Challenge Tile Widget
class ChallengeTile extends StatelessWidget {
  final String imagePath;
  final String title;

  const ChallengeTile({required this.imagePath, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Image on the Left
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 60, // Reduce width if necessary
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // Wrap Text in Expanded to prevent overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Prevents text from overflowing
                ),
                const SizedBox(height: 4),
                const Text(
                  "0 of 8 challenges complete",
                  style: TextStyle(color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Arrow Icon
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}
