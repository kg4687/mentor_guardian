import 'package:flutter/material.dart';
import 'answer_submission_screen.dart';

class DailyQuestionScreen extends StatelessWidget {
  final String question = "What’s something new you learned today?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Question")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnswerSubmissionScreen()));
              },
              child: Text("Answer Now"),
            ),
          ],
        ),
      ),
    );
  }
}
