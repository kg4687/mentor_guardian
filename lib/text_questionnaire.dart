import 'package:flutter/material.dart';
import 'package:mentor_guardian/mcq_questionnaire.dart';

class Text_QuestionnairePage extends StatefulWidget {
  @override
  _Text_QuestionnairePageState createState() => _Text_QuestionnairePageState();
}

class _Text_QuestionnairePageState extends State<Text_QuestionnairePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stressController = TextEditingController();
  final PageController _pageController = PageController();

  bool _isNameButtonEnabled = false;
  bool _isStressButtonEnabled = false;

  // Handle text changes for the first input
  void _onNameChanged(String text) {
    setState(() {
      _isNameButtonEnabled = text.isNotEmpty;
    });
  }

  // Handle text changes for the stress input
  void _onStressChanged(String text) {
    setState(() {
      _isStressButtonEnabled = text.isNotEmpty;
    });
  }

  // Navigate to the next page
  void _continueToNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Navigate back to the previous page
  void _goBack() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // First Page
          _buildFirstPage(),
          // Second Page
          _buildSecondPage(),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What would you like us to call you?",
              style: TextStyle(
                fontFamily: 'K2D',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFDEECEC),
                borderRadius: BorderRadius.circular(26),
              ),
              child: TextField(
                controller: _nameController,
                onChanged: _onNameChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your name",
                ),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _isNameButtonEnabled ? _continueToNextPage : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isNameButtonEnabled
                      ? Color(0xFFECE2E1)
                      : Color(0xFFE0E0E0),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'K2D',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _goBack,
            ),
            SizedBox(height: 20),
            Text(
              "What is your current occupation?",
              style: TextStyle(
                fontFamily: 'K2D',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Work-related stress can be a major factor in your mental health.",
              style: TextStyle(
                fontFamily: 'K2D',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Please enter your answer as a short phrase, e.g., “Marketing Analyst”",
              style: TextStyle(
                fontFamily: 'K2D',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFDEECEC),
                borderRadius: BorderRadius.circular(26),
              ),
              child: TextField(
                controller: _stressController,
                onChanged: _onStressChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your answer",
                ),
                // This ensures the keyboard opens only when tapping on this field
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _isStressButtonEnabled
                    ? () {
                        // Navigate to the MCQ_QuestionnairePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MCQ_QuestionnairePage(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isStressButtonEnabled
                      ? Color(0xFFECE2E1)
                      : Color(0xFFE0E0E0),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'K2D',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
