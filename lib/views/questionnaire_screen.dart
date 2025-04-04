import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ADHDQuestionnaireScreen extends StatefulWidget {
  const ADHDQuestionnaireScreen({super.key});

  @override
  State<ADHDQuestionnaireScreen> createState() => _ADHDQuestionnaireScreenState();
}

class _ADHDQuestionnaireScreenState extends State<ADHDQuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "For Whom you are using this app?",
      "type": "mcq",
      "options": ["Your Ward", "Your Student", "Spouse", "Yourself"],
    },
    {
      "question": "Their age lies in between?",
      "type": "mcq",
      "options": ["3-7", "8-14", "15-24", "25-34", "35-44", "45+"],
    },
    {
      "question": "When were they formally diagnosed with ADHD?",
      "type": "mcq",
      "options": [
        "Less than 6 months ago",
        "6 months - 1 year ago",
        "1-2 years ago",
        "More than 2 years ago",
        "They have not been diagnosed"
      ],
    },
    {
      "question": "What type of ADHD do they have?",
      "type": "mcq",
      "options": ["Inattentive", "Hyperactive-impulsive", "Combined", "I’m not sure"],
    },
    {
      "question": "Are they currently taking steps to manage your ADHD?",
      "type": "mcq",
      "options": [
        "They have not yet taken any steps to manage my ADHD symptoms",
        "They have begun taking some small initial steps to manage my ADHD symptoms",
        "They are actively managing their ADHD symptoms",
        "They are putting in a lot of effort to manage their ADHD and have been for some time"
      ],
    },
    {
      "question": "Their relationship have been negatively impacted by their ADHD symptoms",
      "type": "mcq",
      "options": ["Strongly agree", "Agree", "Neither agree nor disagree", "Disagree", "Strongly disagree"],
    },
    {
      "question": "They find themself struggling to prioritize time effectively",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "They find themself struggling with the fear of rejection or criticism",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "They find themself consumed by negative emotions",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "They act on impulse without fully thinking through the consequences",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "Do you find that their poor time management interferes with their daily life",
      "type": "mcq",
      "options": ["Strongly agree", "Agree", "Neither agree nor disagree", "Disagree", "Strongly disagree"],
    },
    {
      "question": "They feel exhausted and unable to meet the demands of my daily life",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "They avoid starting or completing tasks",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "They find themself struggling to use time effectively in the morning",
      "type": "mcq",
      "options": ["Very often", "Often", "Sometimes", "Rarely", "Never"],
    },
    {
      "question": "Where did you discover our App?",
      "type": "mcq",
      "options": [
        "Family",
        "Friends",
        "Play Store",
        "Facebook",
        "Google",
        "Instagram",
        "YouTube",
        "Blogs",
        "Article",
        "Others"
      ],
    },
    {
      "question": "Which areas would you most like them to work on?",
      "type": "mcq",
      "options": [
        "Relationships",
        "Organization",
        "Rejection sensitive dysphoria",
        "Managing emotions",
        "Impulsivity",
        "Time management",
        "Task avoidance",
        "Burnout"
      ],
    },
  ];

  Map<int, dynamic> _answers = {};

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() => _currentIndex++);
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      context.go('/main');
    }
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), // Subtle tint
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[300],
              color: Colors.pinkAccent,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final question = _questions[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          question["question"],
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                          question["options"].length,
                              (optionIndex) {
                            String option = question["options"][optionIndex];
                            bool isSelected = _answers[index] == option;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _answers[index] = option;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDEECEC),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isSelected ? Colors.pinkAccent : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                                      color: isSelected ? Colors.pinkAccent : Colors.grey,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(child: Text(option, style: const TextStyle(fontSize: 16))),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  if (_currentIndex > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _prevQuestion,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.pink,
                          side: const BorderSide(color: Colors.pinkAccent),
                          padding: const EdgeInsets.symmetric(vertical: 16), // Match height
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        ),
                        child: const Text("Back", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  if (_currentIndex > 0) const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      child: Text(
                        _currentIndex == _questions.length - 1 ? "Finish" : "Continue",
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
