import 'package:flutter/material.dart';

class PastEventDetailsScreen extends StatelessWidget {
  final Map<String, String> event;

  const PastEventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
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
            // 🔹 Video Thumbnail Placeholder
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.purple.shade100,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "images/live_event1.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Duration
            const Text("54 minutes", style: TextStyle(fontSize: 16)),

            const SizedBox(height: 15),

            // 🔹 Speaker Section
            const Text("Speaker", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/callie_avatar.png"),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Callie", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Community Lead", style: TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Event Description
            Text(
              "Daily focus is a simple tool that allows you to prioritize your most important task of the day.\n\n"
                  "Your coach will try to respond within 24-48 hours except for weekends.",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
