import 'package:flutter/material.dart';

class PreviousQuestionsScreen extends StatelessWidget {
  final List<String> pastQuestions = [
    "What’s a skill you recently improved?",
    "What’s a challenge you overcame this week?",
    "If you could time travel, where would you go?",
    "What’s the best advice you've ever received?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Previous Questions")),
      body: ListView.builder(
        itemCount: pastQuestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pastQuestions[index]),
            leading: Icon(Icons.question_answer),
          );
        },
      ),
    );
  }
}
