import 'package:flutter/material.dart';

class PreviousPostDetailScreen extends StatelessWidget {
  final Map<String, dynamic> post;

  const PreviousPostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example comments for different posts
    final Map<String, List<Map<String, String>>> exampleComments = {
      "How has ADHD impacted your daily routine and time management?": [
        {"username": "ADHDFighter", "comment": "I struggle with mornings the most!"},
        {"username": "RoutineMaster", "comment": "Setting alarms with music helps me a lot."},
      ],
      "What strategies help you stay organized despite ADHD challenges?": [
        {"username": "PlannerQueen", "comment": "Sticky notes everywhere!"},
        {"username": "DigitalNomad", "comment": "I use Notion to track my tasks."},
      ],
      "Have you ever experienced rejection sensitivity due to ADHD? How did you cope?": [
        {"username": "SensitiveSoul", "comment": "Yes, it's tough! Therapy has helped."},
        {"username": "ResilientMind", "comment": "I remind myself that it's not always personal."},
      ],
    };

    // Get comments based on the selected post
    final List<Map<String, String>> comments =
        exampleComments[post["content"]] ?? [{"username": "User123", "comment": "This is really interesting!"}];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous question", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the selected post's question
            Text(
              post["content"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // User Input Box for adding comments
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.png"),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Add your thoughts...",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Posts Section Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Posts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.sort, size: 22),
              ],
            ),

            const SizedBox(height: 10),

            // Display Example Comments
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return _commentCard(comment["username"] ?? "User", comment["comment"] ?? "");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper Widget: Comment Card
  Widget _commentCard(String username, String comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("images/avatar2.png"), // User avatar
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(comment, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
