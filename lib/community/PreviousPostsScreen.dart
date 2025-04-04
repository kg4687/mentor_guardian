import 'package:flutter/material.dart';
import 'package:mentor_guardian/community/PreviousPostDetailScreen.dart';


class PreviousPostsScreen extends StatelessWidget {
  const PreviousPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample Data for Previous Posts
    final List<Map<String, dynamic>> previousPosts = [
      {
        "username": "Neuro_Warrior",
        "content": "How has ADHD impacted your daily routine and time management?",
        "replies": 88
      },
      {
        "username": "HyperFocus_Queen",
        "content": "What strategies help you stay organized despite ADHD challenges?",
        "replies": 54
      },
      {
        "username": "MindMaze",
        "content": "Have you ever experienced rejection sensitivity due to ADHD? How did you cope?",
        "replies": 39
      },
      {
        "username": "FocusFinder",
        "content": "What’s one ADHD myth that you wish more people understood?",
        "replies": 27
      },
      {
        "username": "Impulsive_Thinker",
        "content": "How do you handle impulsivity in social or work settings?",
        "replies": 18
      },
      {
        "username": "DivergentDreamer",
        "content": "How does ADHD affect your relationships with family and friends?",
        "replies": 65
      },
      {
        "username": "LostInThoughts",
        "content": "What are some unexpected strengths you've discovered from having ADHD?",
        "replies": 44
      },
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text("Community", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: previousPosts.length,
          itemBuilder: (context, index) {
            final post = previousPosts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreviousPostDetailScreen(post: post)),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("images/avatar.png"),
                          radius: 24,
                        ),
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "+${post["replies"]}",
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        post["content"],
                        style: const TextStyle(fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.chevron_right, size: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
