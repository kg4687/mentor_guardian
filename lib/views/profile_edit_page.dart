import 'package:flutter/material.dart';
import 'profile_page.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key, required String name, required String username, required String location, required String about}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // Controllers to handle text input
  TextEditingController nameController = TextEditingController(text: "Radha");
  TextEditingController usernameController = TextEditingController(text: "Radha_420");
  TextEditingController locationController = TextEditingController(text: "Location");
  TextEditingController aboutController = TextEditingController(text: "About me");

  bool isProfileHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to Profile Page
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.black),
            onPressed: () {
              // Profile picture change functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile_picture.jpg'),
            ),
            const SizedBox(height: 10),

            // Name & Username
            const Text(
              "Radha",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Radha_420",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Editable Fields
            buildEditableField("Name", nameController),
            buildEditableField("Username", usernameController),
            buildEditableField("Location", locationController),
            buildEditableField("About me", aboutController),

            const SizedBox(height: 20),

            // Hide Profile Toggle
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFA9D9D6),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hide profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isProfileHidden,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        isProfileHidden = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Description
            const Text(
              "If you hide profile, other members of the community won’t be able to see it",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),

            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      name: nameController.text,
                      username: usernameController.text,
                      location: locationController.text,
                      about: aboutController.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Editable Fields
  Widget buildEditableField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA9D9D6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
