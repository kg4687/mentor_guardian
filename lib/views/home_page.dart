import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Good Afternoon, Senthil!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Image.asset('images/bell_icon.png', width: 28, height: 28),
            onPressed: () {
              GoRouter.of(context).go('/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tasks Section
            const Text("Today's Tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TaskContainer(taskName: "Generate your learning program", isComplete: true),
            TaskContainer(taskName: "Add your first check-in", isComplete: false),
            TaskContainer(taskName: "Listen to your first lesson", isComplete: false),
            TaskContainer(taskName: "Message your personal ADHD coach", isComplete: false),

            const SizedBox(height: 20),

            // Streak Progress Section
            StreakContainer(),

            const SizedBox(height: 20),

            // Blog Section
            const Text("Discover", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            BlogContainer(),
          ],
        ),
      ),
    );
  }
}

// TaskContainer Widget
class TaskContainer extends StatelessWidget {
  final String taskName;
  final bool isComplete;

  const TaskContainer({required this.taskName, required this.isComplete, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: double.infinity,
      child: Text(
        isComplete ? "✓ $taskName" : taskName,
        style: TextStyle(
          fontSize: 18,
          color: isComplete ? Colors.green : Colors.black,
          decoration: isComplete ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}

// StreakContainer Widget
class StreakContainer extends StatelessWidget {
  final List<bool> activeDays = [true, true, true, false, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFDEECEC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "WOW! Learnt for 3 days continuously.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              bool isActive = activeDays[index];

              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isActive
                      ? const Text('\u{1F525}', style: TextStyle(fontSize: 24, color: Colors.red))
                      : const Text('\u{274C}', style: TextStyle(fontSize: 24, color: Colors.red)),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// BlogContainer Widget
class BlogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlogEntry(
          imageUrl: 'images/blog1.png',
          title: "Understanding ADHD",
          summary: "Comprehensive guide to ADHD and its impact.",
          content: "This blog delves into the fundamental aspects of Attention Deficit Hyperactivity Disorder (ADHD)...",
        ),
        const SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog2.png',
          title: "Managing ADHD at Home",
          summary: "Effective strategies for supporting kids with ADHD.",
          content: "This blog focuses on practical strategies that parents can implement at home to support their children with ADHD...",
        ),
        const SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog3.jpg',
          title: "Building a Support Network",
          summary: "The importance of connecting with other parents, sharing experiences, and finding support in communities.",
          content: "This blog highlights the importance of building a support network for parents of children with ADHD...",
        ),
      ],
    );
  }
}

// BlogEntry Widget
class BlogEntry extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String summary;
  final String content;

  const BlogEntry({
    required this.imageUrl,
    required this.title,
    required this.summary,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE1F2F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, height: 150, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(summary, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/blogDetail', extra: {
                'title': title,
                'imageUrl': imageUrl,
                'content': content,
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Start Reading", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
