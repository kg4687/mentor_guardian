import 'package:flutter/material.dart';
import 'community_home.dart';

class AnswerSubmissionScreen extends StatefulWidget {
  @override
  _AnswerSubmissionScreenState createState() => _AnswerSubmissionScreenState();
}

class _AnswerSubmissionScreenState extends State<AnswerSubmissionScreen> {
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Answer")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _answerController,
              decoration: InputDecoration(labelText: "Type your answer here"),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommunityHome()));
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
