import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/learning');
        break;
      case 2:
        GoRouter.of(context).go('/explore');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
    }
  }

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
            Text("Today's Tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TaskContainer(taskName: "Generate your learning program", isComplete: true),
            TaskContainer(taskName: "Add your first check-in", isComplete: false),
            TaskContainer(taskName: "Listen to your first lesson", isComplete: false),
            TaskContainer(taskName: "Message your personal ADHD coach", isComplete: false),

            SizedBox(height: 20),

            // Streak Progress Section
            StreakContainer(),

            SizedBox(height: 20),

            // Blog Section
            Text("Discover", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            BlogContainer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/home_icon.png', width: 28, height: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/learning_icon.png', width: 28, height: 28),
            label: 'Learning',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/explore_icon.png', width: 28, height: 28),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/profile_icon.png', width: 28, height: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// TaskContainer Widget
class TaskContainer extends StatelessWidget {
  final String taskName;
  final bool isComplete;

  TaskContainer({required this.taskName, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 3),
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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFDEECEC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WOW! Learnt for 3 days continuously.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
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
                      ? Text('\u{1F525}', style: TextStyle(fontSize: 24, color: Colors.red))
                      : Text('\u{274C}', style: TextStyle(fontSize: 24, color: Colors.red)),
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
          content: "This blog delves into the fundamental aspects of Attention Deficit Hyperactivity Disorder (ADHD), providing a comprehensive overview of its symptoms, causes, and how it can affect daily life. Parents will gain insights into the different types of ADHD, the importance of early diagnosis, and the role of genetics and environment in its development. The blog also emphasizes the significance of understanding ADHD beyond just academic challenges, exploring emotional, social, and behavioral aspects. With practical tips on how to recognize signs of ADHD, this post serves as a foundational resource for parents seeking to better understand their child's condition.",
        ),
        SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog2.png',
          title: "Managing ADHD at Home",
          summary: "Effective strategies for supporting kids with ADHD.",
          content: "This blog focuses on practical strategies that parents can implement at home to support their children with ADHD. It covers topics such as creating structured routines, setting clear expectations, and using positive reinforcement techniques. The article highlights the importance of organization and consistency, offering actionable tips like using visual schedules and reminders to help children stay on task. Parents will also learn about the benefits of mindfulness practices and physical activity in managing symptoms. By providing a supportive home environment, this blog empowers parents to help their children thrive both academically and emotionally.",
        ),
        SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog3.jpg',
          title: "Building a Support Network: Connecting with Other Parents of ADHD Kids",
          summary: "The importance of connecting with other parents, sharing experiences, and finding support in communities.",
          content: "This blog highlights the importance of building a support network for parents of children with ADHD. It discusses the benefits of connecting with other parents who share similar experiences, providing emotional support, and exchanging practical advice. The article suggests joining local support groups, online communities, and social media platforms where parents can share their journeys and learn from one another. It also emphasizes the importance of self-care for parents and how to seek professional guidance when needed. By fostering a sense of community, this blog aims to empower parents to feel less isolated and more equipped to support their children.",
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

  BlogEntry({
    required this.imageUrl,
    required this.title,
    required this.summary,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFE1F2F4),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, height: 150, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(summary, style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
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
            child: Text("Start Reading", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// BlogDetailPage Widget
class BlogDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;

  BlogDetailPage({
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(content, style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
