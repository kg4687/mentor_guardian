import 'package:flutter/material.dart';
import 'home_page.dart';
import 'learning_page.dart';
import 'explore_page.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String username;
  final String location;
  final String about;

  const ProfilePage({
    Key? key,
    this.name = "Radha",
    this.username = "Radha_420",
    this.location = "Location",
    this.about = "About me",
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String name;
  late String username;
  late String location;
  late String about;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    username = widget.username;
    location = widget.location;
    about = widget.about;
  }

  void updateProfile(String newName, String newUsername, String newLocation, String newAbout) {
    setState(() {
      name = newName;
      username = newUsername;
      location = newLocation;
      about = newAbout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // 🔥 Removes the back arrow
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile_picture.jpg'),
            ),
            const SizedBox(height: 10),

            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              username,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEditPage(
                      name: name,
                      username: username,
                      location: location,
                      about: about,
                    ),
                  ),
                );

                if (updatedProfile != null) {
                  updateProfile(
                    updatedProfile['name'],
                    updatedProfile['username'],
                    updatedProfile['location'],
                    updatedProfile['about'],
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                "Edit",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            ProfileDetail(label: "Name", value: name),
            ProfileDetail(label: "Username", value: username),
            ProfileDetail(label: "Location", value: location),
            ProfileDetail(label: "About me", value: about),

            const SizedBox(height: 20),

            SettingsOption(icon: Icons.notifications, text: "Notification preferences"),
            SettingsOption(icon: Icons.help_outline, text: "Help"),
            SettingsOption(icon: Icons.logout, text: "Logout"),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({required this.label, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA9D9D6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingsOption({required this.icon, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
        ],
      ),
    );
  }
}
