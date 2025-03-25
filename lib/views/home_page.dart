import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Good afternoon, Senthil!",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Image.asset("images/bell_icon.png", width: 28),
            onPressed: () =>
                context.go('/notifications'), // Navigate to notifications
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task List Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _taskItem(Icons.book, "Generate your learning program"),
                  _taskItem(Icons.check, "Add your first check-in"),
                  _taskItem(Icons.headphones, "Listen to your first lesson"),
                  _taskItem(Icons.chat, "Message your personal ADHD coach",
                      disabled: true),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Progress Section
            const Text("Progress",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(
                  5, (index) => _progressCircle(index == 0)),
            ),
            const SizedBox(height: 20),

            // Burnout Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset("images/home1.png", height: 100),
                  const Text("What is ADHD burnout?", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                  LinearProgressIndicator(value: 0.12),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink),
                    onPressed: () {},
                    child: const Text(
                        "Get Started", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _taskItem(IconData icon, String text, {bool disabled = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: disabled ? Colors.grey : Colors.black),
        title: Text(text,
            style: TextStyle(color: disabled ? Colors.grey : Colors.black)),
        tileColor: disabled ? Colors.grey.shade200 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _progressCircle(bool completed) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Icon(
          Icons.circle, color: completed ? Colors.pink : Colors.grey, size: 20),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _bottomNavItem(context, "Home", "home_icon.png", '/'),
        _bottomNavItem(context, "Learning", "learning_icon.png", '/learning'),
        _bottomNavItem(context, "Explore", "explore_icon.png", '/explore'),
        _bottomNavItem(context, "Profile", "profile_icon.png", '/profile'),
      ],
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _bottomNavItem(BuildContext context, String label,
      String icon, String route) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () => GoRouter.of(context).go(route),
        child: Image.asset("images/$icon", width: 28),
      ),
      label: label,
    );
  }
}