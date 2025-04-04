import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  final String name;
  final String username;
  final String location;
  final String about;

  const ProfileEditPage({
    Key? key,
    required this.name,
    required this.username,
    required this.location,
    required this.about,
  }) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController locationController;
  late TextEditingController aboutController;

  bool isProfileHidden = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    usernameController = TextEditingController(text: widget.username);
    locationController = TextEditingController(text: widget.location);
    aboutController = TextEditingController(text: widget.about);
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    locationController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile_picture.jpg'),
            ),
            const SizedBox(height: 10),

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
              "If you hide your profile, other members of the community won’t be able to see it.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),

            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'username': usernameController.text,
                  'location': locationController.text,
                  'about': aboutController.text,
                });
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
