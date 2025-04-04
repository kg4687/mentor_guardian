import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatRoomListScreen extends StatelessWidget {
  final List<String> chatRooms = [
    "General Discussion",
    "Tech Talk",
    "Daily Motivation",
    "Random Chats"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Rooms")),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatRooms[index]),
            trailing: Icon(Icons.chat_bubble_outline),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen(chatRoomName: chatRooms[index])));
            },
          );
        },
      ),
    );
  }
}
