import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final Map<String, String> event;

  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

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
            // 🔹 Event Time and Date
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple.shade200,
                  child: const Text("+22", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 10),
                Text(event["date"]! + ", " + event["time"]!, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 15),

            // 🔹 Event Description
            Text(
              "Daily focus is a simple tool that allows you to prioritize your most important task of the day.\n\n"
                  "Your coach will try to respond within 24-48 hours except for weekends.",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // 🔹 Buttons: Add to Calendar & Join from PC
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton("Add to calendar", Colors.green.shade300),
                _actionButton("Join from PC", Colors.green.shade300),
              ],
            ),
            const SizedBox(height: 30),

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
                    backgroundColor: Colors.purple.shade200,
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
            const SizedBox(height: 40),

            // 🔹 Notify Me Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show notification message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("You will be notified when the event starts!"),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Navigate back after a short delay
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade400,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Notify me", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper function for Action Buttons (Calendar & PC)
  Widget _actionButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
    );
  }
}
