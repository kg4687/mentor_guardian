import 'package:flutter/material.dart';
import 'package:mentor_guardian/text_questionnaire.dart';
import 'login_page.dart'; // Import the UI file where the login page code exists
import 'home_page.dart'; // Import the HomePage class
import 'mcq_questionnaire.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage() // Use the QuestionnairePage widget
        );
  }
}
//hehehe_bsdk
// Login page code
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
// bdauhbfuyh
class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  bool _isEmailEntered = false;
//hgiuerhigue
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isEmailEntered = _emailController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCustomForm(
        text1: 'Email Address',
        text2: 'Please enter your email:',
        textBoxController: _emailController,
        textboxText: 'email',
        buttonName: 'Continue',
        onButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsernamePage()),
          );
        },
      ),
    );
  }
}

// Username page with different texts and layout
class UsernamePage extends StatefulWidget {
  @override
  _UsernamePageState createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  TextEditingController _usernameController = TextEditingController();
  bool _isUsernameEntered = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _isUsernameEntered = _usernameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCustomForm(
        text1: 'Create a username',
        text2: 'This username will be used when you post in the community',
        textBoxController: _usernameController,
        textboxText: 'Username',
        buttonName: 'Continue',
        onButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PasswordPage()),
          );
        },
      ),
    );
  }
}

// Password page with different texts and layout
class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordEntered = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _isPasswordEntered = _passwordController.text.length >= 8;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildCustomForm(
        text1: 'Create a password',
        text2: 'Please create a password with at least 8 characters',
        textBoxController: _passwordController,
        textboxText: 'Password',
        buttonName: 'Continue',
        onButtonPressed: () {
          // Navigate to HomePage when Continue is clicked
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // Navigate to HomePage
          );
        },
      ),
    );
  }
}

// Custom form function for all screens
Widget buildCustomForm({
  String? text1, // Optional first label text
  String? text2, // Optional second label text
  TextEditingController? textBoxController, // Optional text editing controller
  String? textboxText, // Optional placeholder text for TextBox
  String? buttonName, // Optional button label
  VoidCallback? onButtonPressed, // Optional callback for button press
}) {
  bool isTextEntered =
      textBoxController != null && textBoxController.text.isNotEmpty;

  return LayoutBuilder(
    builder: (context, constraints) {
      double screenHeight = constraints.maxHeight;
      double screenWidth = constraints.maxWidth;

      return Padding(
        padding: EdgeInsets.only(
          top: screenHeight * (2 / 8), // 2/8th from the top
          left: screenWidth * 0.1, // 10% padding from the left
          right: screenWidth * 0.1, // 10% padding from the right
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (text1 != null)
              Text(
                text1,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            if (text1 != null) SizedBox(height: 10),

            if (text2 != null)
              Text(
                text2,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            if (text2 != null) SizedBox(height: 10),

            // Conditionally render TextBox if textboxText is provided
            if (textboxText != null && textBoxController != null)
              TextField(
                controller: textBoxController,
                decoration: InputDecoration(
                  hintText: textboxText, // Placeholder text
                  filled: true,
                  fillColor: isTextEntered
                      ? Color(0xFFAEE1E1) // Color when text is entered
                      : Color(0xFFDEECEC), // Default color (DEECEC)
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(
                      color: Colors.blue, // Focused border color
                    ),
                  ),
                ),
              ),

            if (textboxText != null) SizedBox(height: 20),

            Spacer(), // Pushes the button to the bottom

            if (buttonName != null)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed:
                      isTextEntered ? onButtonPressed : null, // Button action
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTextEntered
                        ? Color(0xFFFCD1D1) // Button color when text is entered
                        : Color(0xFFECE2E1), // Default color (ECE2E1)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(26), // Rounded corners
                    ),
                  ),
                  child: Text(
                    buttonName, // Button label
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20), // Space at the bottom
          ],
        ),
      );
    },
  );
}
