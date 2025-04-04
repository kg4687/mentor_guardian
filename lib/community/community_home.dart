import 'package:flutter/material.dart';
import 'chat_room_list.dart';
import 'previous_questions_screen.dart';
import 'user_profile_screen.dart';

class CommunityHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Community")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Chat Rooms"),
            subtitle: Text("Join discussions"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatRoomListScreen())),
          ),
          ListTile(
            title: Text("Past Daily Questions"),
            subtitle: Text("View previous discussions"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PreviousQuestionsScreen())),
          ),
          ListTile(
            title: Text("Your Profile"),
            subtitle: Text("View and edit profile"),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfileScreen())),
          ),
        ],
      ),
    );
  }
}
