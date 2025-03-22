import 'package:flutter/material.dart';
import 'text_questionnaire.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailEntered = false;

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
  final TextEditingController _usernameController = TextEditingController();
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
  final TextEditingController _passwordController = TextEditingController();
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Text_QuestionnairePage()),
          );
        },
      ),
    );
  }
}

// Custom form function for all screens
Widget buildCustomForm({
  String? text1,
  String? text2,
  TextEditingController? textBoxController,
  String? textboxText,
  String? buttonName,
  VoidCallback? onButtonPressed,
}) {
  bool isTextEntered =
      textBoxController != null && textBoxController.text.isNotEmpty;

  return LayoutBuilder(
    builder: (context, constraints) {
      double screenHeight = constraints.maxHeight;
      double screenWidth = constraints.maxWidth;

      return Padding(
        padding: EdgeInsets.only(
          top: screenHeight * (2 / 8),
          left: screenWidth * 0.1,
          right: screenWidth * 0.1,
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
            if (textboxText != null && textBoxController != null)
              TextField(
                controller: textBoxController,
                decoration: InputDecoration(
                  hintText: textboxText,
                  filled: true,
                  fillColor:
                      isTextEntered ? Color(0xFFAEE1E1) : Color(0xFFDEECEC),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            if (textboxText != null) SizedBox(height: 20),
            Spacer(),
            if (buttonName != null)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: isTextEntered ? onButtonPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isTextEntered ? Color(0xFFFCD1D1) : Color(0xFFECE2E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
