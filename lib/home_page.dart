import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: Color(0xFFDFECDE), // Button color
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0), // Padding around the image
                child: Image.asset(
                  'images/alarm-bell.png', // Local asset image path
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Senthil !!!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFDFECDE),
                  borderRadius: BorderRadius.circular(24),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's task view",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TaskContainer(
                        taskName: "Complete the first Exercise",
                        isComplete: true),
                    TaskContainer(
                        taskName: "Focus for 5 minutes", isComplete: false),
                    TaskContainer(
                        taskName: "Read 1 Blog today", isComplete: true),
                    TaskContainer(
                        taskName: "Do Today's Fun activity", isComplete: false),
                  ],
                ),
              ),
              SizedBox(height: 20),
              StreakContainer(),
              SizedBox(height: 20),
              BlogContainer(), // Add BlogContainer here
            ],
          ),
        ),
      ),
    );
  }
}

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

class StreakContainer extends StatelessWidget {
  final List<bool> activeDays = [
    true,
    true,
    true,
    false,
    false,
    true,
    false
  ]; // Example active days

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFFDEECEC), // Streak container color
        borderRadius: BorderRadius.circular(24), // Rounded corners
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
              bool isMissed = !isActive; // Consider missed if not active

              return Column(
                children: [
                  Container(
                    width: 40, // Width of each day circle
                    height: 40, // Height of each day circle
                    decoration: BoxDecoration(
                      color:
                          Colors.grey[300], // Gray background for missed days
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isActive
                          ? Text(
                              '\u{1F525}', // Fire emoji for active days
                              style: TextStyle(fontSize: 24, color: Colors.red),
                            )
                          : isMissed
                              ? Text(
                                  '\u{274C}', // Red cross emoji for missed days
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.red),
                                ) // Red cross for missed days
                              : Container(), // Fallback for other cases
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BlogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlogEntry(
          imageUrl: 'images/blog1.png', // Replace with your image URL
          title: "Understanding ADHD: What Every Parent Needs to Know",
          summary:
              "This blog delves into the fundamental aspects of Attention Deficit Hyperactivity Disorder (ADHD), providing a comprehensive overview of its symptoms, causes, and how it can affect daily life. Parents will gain insights into the different types of ADHD, the importance of early diagnosis, and the role of genetics and environment in its development. The blog also emphasizes the significance of understanding ADHD beyond just academic challenges, exploring emotional, social, and behavioral aspects. With practical tips on how to recognize signs of ADHD, this post serves as a foundational resource for parents seeking to better understand their child's condition.",
          content:
              "This blog delves into the fundamental aspects of Attention Deficit Hyperactivity Disorder (ADHD), providing a comprehensive overview of its symptoms, causes, and how it can affect daily life. Parents will gain insights into the different types of ADHD, the importance of early diagnosis, and the role of genetics and environment in its development. The blog also emphasizes the significance of understanding ADHD beyond just academic challenges, exploring emotional, social, and behavioral aspects. With practical tips on how to recognize signs of ADHD, this post serves as a foundational resource for parents seeking to better understand their child's condition.",
        ),
        SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog2.png', // Replace with your image URL
          title: "Effective Strategies for Managing ADHD at Home",
          summary:
              "This blog focuses on practical strategies that parents can implement at home to support their children with ADHD. It covers topics such as creating structured routines, setting clear expectations, and using positive reinforcement techniques. The article highlights the importance of organization and consistency, offering actionable tips like using visual schedules and reminders to help children stay on task. Parents will also learn about the benefits of mindfulness practices and physical activity in managing symptoms. By providing a supportive home environment, this blog empowers parents to help their children thrive both academically and emotionally.",
          content:
              "This blog focuses on practical strategies that parents can implement at home to support their children with ADHD. It covers topics such as creating structured routines, setting clear expectations, and using positive reinforcement techniques. The article highlights the importance of organization and consistency, offering actionable tips like using visual schedules and reminders to help children stay on task. Parents will also learn about the benefits of mindfulness practices and physical activity in managing symptoms. By providing a supportive home environment, this blog empowers parents to help their children thrive both academically and emotionally.",
        ),
        SizedBox(height: 20),
        BlogEntry(
          imageUrl: 'images/blog3.jpg', // Replace with your image URL
          title:
              "Building a Support Network: Connecting with Other Parents of ADHD Kids",
          summary:
              "This blog highlights the importance of building a support network for parents of children with ADHD. It discusses the benefits of connecting with other parents who share similar experiences, providing emotional support, and exchanging practical advice. The article suggests joining local support groups, online communities, and social media platforms where parents can share their journeys and learn from one another. It also emphasizes the importance of self-care for parents and how to seek professional guidance when needed. By fostering a sense of community, this blog aims to empower parents to feel less isolated and more equipped to support their children.",
          content:
              "This blog highlights the importance of building a support network for parents of children with ADHD. It discusses the benefits of connecting with other parents who share similar experiences, providing emotional support, and exchanging practical advice. The article suggests joining local support groups, online communities, and social media platforms where parents can share their journeys and learn from one another. It also emphasizes the importance of self-care for parents and how to seek professional guidance when needed. By fostering a sense of community, this blog aims to empower parents to feel less isolated and more equipped to support their children.",
        ),
      ],
    );
  }
}

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BlogPage(title: title, imageUrl: imageUrl, content: content),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFE1F2F4), // Blog entry container color
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage(imageUrl), // Use AssetImage here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              summary,
              style: TextStyle(fontSize: 16),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogPage(
                          title: title, imageUrl: imageUrl, content: content),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFCD1D1), // Button color
                ),
                child: Text("Start Reading"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPage extends StatelessWidget {
  final String title;
  final String imageUrl; // This should already include 'assets/images/'
  final String content;

  BlogPage({
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        // Add this Container to match the BlogEntry style
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(16.0), // Add margin for spacing
        decoration: BoxDecoration(
          color: Color(0xFFE1F2F4), // Match the BlogEntry background color
          borderRadius: BorderRadius.circular(24), // Match the border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image:
                        AssetImage(imageUrl), // Use AssetImage for local images
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
                title: "Notification 1",
                message: "You have a new task assigned."),
            NotificationCard(
                title: "Notification 2",
                message: "Don't forget to submit your assignment."),
            NotificationCard(
                title: "Notification 3",
                message: "Meeting scheduled for tomorrow at 10 AM."),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;

  NotificationCard({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFDEECEC), // Notification card color
        borderRadius: BorderRadius.circular(24), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
