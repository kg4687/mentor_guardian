import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String username;

  ProfilePage({required this.name, required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    usernameController.text = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20.0),

              // Profile picture with black border
              Center(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2.0),
                    image: DecorationImage(
                      image: AssetImage('images/alarm-bell.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Name or Editable Name
              isEditing
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                    )
                  : Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(height: 8.0),

              // Username or Editable Username
              isEditing
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    )
                  : Text(
                      widget.username,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
              SizedBox(height: 20.0),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                    if (!isEditing) {
                      print('Name: ${nameController.text}');
                      print('Username: ${usernameController.text}');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFCD1D1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Text(
                  isEditing ? 'Save' : 'Edit Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // My Account Section (Horizontal Scroll)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFC4E4E4),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildAccountStat(
                        icon: Icons.article,
                        label: 'Blogs Read',
                        value: '12',
                      ),
                      buildAccountStat(
                        icon: Icons.extension,
                        label: 'Puzzles Solved',
                        value: '8',
                      ),
                      buildAccountStat(
                        icon: Icons.directions_run,
                        label: 'Activity Done',
                        value: '15',
                      ),
                      buildAccountStat(
                        icon: Icons.self_improvement,
                        label: 'Time Meditated',
                        value: '3h',
                      ),
                      buildAccountStat(
                        icon: Icons.star,
                        label: 'Community Points',
                        value: '120',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Settings container
              Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE7F0F0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.black),
                    buildSettingsOption(
                        'Notification Preferences', Icons.notifications),
                    buildSettingsOption('Help', Icons.help_outline),
                    buildSettingsOption('Logout', Icons.logout),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build each stat in the "My Account" section
  Widget buildAccountStat(
      {required IconData icon, required String label, required String value}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0),
          SizedBox(height: 8.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper function to build each settings option
  Widget buildSettingsOption(String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      tileColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(icon),
      onTap: () {
        // Add action for each option
      },
    );
  }
}
