import 'package:flutter/material.dart';

class TelecoachingScreen extends StatelessWidget {
  const TelecoachingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Center(
              child: Image.asset("images/telecoach.png", height: 250), // Update with your image path
            ),
            const SizedBox(height: 20),
            const Text(
              "Upgrade your ADHD journey with an Inflow Video Coach",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Get one-on-one, structured guidance and accountability for even faster and better results",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade200,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text("Choose my video coach"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
