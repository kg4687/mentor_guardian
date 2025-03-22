import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the HomePage widget

class MCQ_QuestionnairePage extends StatefulWidget {
  @override
  _MCQ_QuestionnairePageState createState() => _MCQ_QuestionnairePageState();
}

class _MCQ_QuestionnairePageState extends State<MCQ_QuestionnairePage> {
  int _currentQuestionIndex = 0;
  late List<String?>
      _selectedOptions; // List to store selected options for each question

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'For whom are you using this app?',
      'options': [
        'Your Ward',
        'Your Student',
        'Spouse',
        'Your Child',
      ]
    },
    {
      'question': 'What is the age group of the diagnosed person?',
      'options': [
        '1-5 years',
        '6-10 years',
        '11-15 years',
        '16-20 years',
        'Above 20 years',
      ]
    },
    {
      'question': 'When were they formally diagnosed with ADHD?',
      'options': [
        'Less than 6 months ago',
        '6 months - 1 year ago',
        '1-2 years ago',
        '2 years ago',
        'They have not been diagnosed',
      ]
    },
    {
      'question': 'What type of ADHD do they have?',
      'options': [
        'Inattentive',
        'Hyperactive-impulsive',
        'Combined',
        'I\'m not sure',
      ]
    },
    {
      'question': 'Are they currently taking steps to manage their ADHD?',
      'options': [
        'They have not yet taken any steps to manage ADHD symptoms',
        'They have begun taking some small initial steps',
        'They are actively managing their symptoms',
        'They are putting in a lot of effort to manage their ADHD and have been for some time',
      ]
    },
    {
      'question':
          'Their relationships have been negatively impacted by their ADHD symptoms?',
      'options': [
        'Strongly agree',
        'Agree',
        'Neither agree nor disagree',
        'Disagree',
        'Strongly disagree',
      ]
    },
    {
      'question':
          'They find themselves struggling to prioritize time effectively?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question':
          'They find themselves struggling with the fear of rejection or criticism?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question': 'They find themselves consumed by negative emotions?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question':
          'They act on impulse without fully thinking through the consequences?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question':
          'Do you find that their poor time management interferes with their daily life?',
      'options': [
        'Strongly agree',
        'Agree',
        'Neither agree nor disagree',
        'Disagree',
        'Strongly disagree',
      ]
    },
    {
      'question':
          'They feel exhausted and unable to meet the demands of daily life?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question': 'They avoid starting or completing tasks?',
      'options': [
        'Very often',
        'Often',
        'Sometimes',
        'Rarely',
        'Never',
      ]
    },
    {
      'question': 'Where did you discover our app?',
      'options': [
        'Family',
        'Health Line',
        'Friends',
        'Play Store',
        'Facebook',
        'Google',
        'YouTube',
        'LinkedIn',
        'Instagram',
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedOptions = List<String?>.filled(_questions.length,
        null); // Initialize the list to hold selected options
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_currentQuestionIndex > 0) {
              setState(() {
                _currentQuestionIndex--; // Go back to the previous question
              });
            }
          },
        ),
        title: Text('Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ..._buildOptions(currentQuestion['options']),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedOptions[_currentQuestionIndex] != null
                    ? () {
                        if (_currentQuestionIndex < _questions.length - 1) {
                          setState(() {
                            _currentQuestionIndex++; // Move to the next question
                          });
                        } else {
                          _submitQuestionnaire(); // Final submission logic
                        }
                      }
                    : null, // Disable button if no option is selected
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFFFCD1D1), // Change button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _currentQuestionIndex < _questions.length - 1
                      ? 'Continue'
                      : 'Submit', // Change button text on the last question
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions(List<String> options) {
    return options.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RadioListTile(
          title: Text(option),
          value: option,
          groupValue: _selectedOptions[
              _currentQuestionIndex], // Use the selected option for the current question
          onChanged: (value) {
            setState(() {
              _selectedOptions[_currentQuestionIndex] =
                  value.toString(); // Store the selected option
            });
          },
          activeColor: Colors.black,
        ),
      );
    }).toList();
  }

  void _submitQuestionnaire() {
    // Navigate to HomePage on submission
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomePage()), // Replace with your HomePage widget
    );

    // Print selected options to console
    print("Questionnaire submitted with answers: $_selectedOptions");
  }
}
