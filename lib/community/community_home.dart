import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentor_guardian/community/PreviousPostsScreen.dart' show PreviousPostsScreen;

class CommunityHomeScreen extends StatefulWidget {
  const CommunityHomeScreen({Key? key}) : super(key: key);

  @override
  _CommunityHomeScreenState createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  bool isTodaySelected = true; // Track selected tab
  List<Map<String, dynamic>> posts = [ // Store posts & replies
    {
      "username": "Meadow_420",
      "time": "2 hours ago",
      "content": "The funeral of my nana, papa, and great grandma",
      "replies": [] // Replies list
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Today & Previous Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton(context, "Today", isSelected: isTodaySelected, onTap: () {
                  isTodaySelected = true;
                }),
                const SizedBox(width: 10),
                _tabButton(context, "Previous", isSelected: !isTodaySelected, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PreviousPostsScreen()),
                  );
                }),
              ],
            ),


            const SizedBox(height: 20),

            // 🔹 Daily Question
            const Text("Daily question", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Describe a moment when you felt a deep sense of compassion towards others",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // 🔹 User Input Box (Opens Bottom Sheet)
            GestureDetector(
              onTap: () => _showPostInputModal(context), // Open modal when tapped
              child: _userInputBox(),
            ),

            const SizedBox(height: 20),

            // 🔹 Posts Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Posts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.sort, size: 22),
              ],
            ),

            const SizedBox(height: 10),

            // 🔹 Display Posts & Replies
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Column(
                    children: [
                      _postCard(index, post["username"], post["time"], post["content"]),
                      ...post["replies"].map<Widget>((reply) => _replyCard(reply["username"], reply["content"])).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Bottom Sheet for Writing a Post
  void _showPostInputModal(BuildContext context) {
    TextEditingController postController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _postInputModal(postController, onSubmit: () {
          if (postController.text.isNotEmpty) {
            setState(() {
              posts.insert(0, { // Add new post at top
                "username": "Max", // Change this to the current user
                "time": "Just now",
                "content": postController.text,
                "replies": []
              });
            });
            Navigator.pop(context); // Close bottom sheet
          }
        });
      },
    );
  }

  // 🔹 Bottom Sheet for Writing a Reply
  void _showReplyInputModal(BuildContext context, int postIndex) {
    TextEditingController replyController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _postInputModal(replyController, onSubmit: () {
          if (replyController.text.isNotEmpty) {
            setState(() {
              posts[postIndex]["replies"].add({
                "username": "Max", // Change this to the current user
                "content": replyController.text
              });
            });
            Navigator.pop(context); // Close bottom sheet
          }
        });
      },
    );
  }

  // 🔹 Reusable Post Input Modal
  Widget _postInputModal(TextEditingController controller, {required VoidCallback onSubmit}) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.5,
      builder: (_, controllerScroll) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close & Send Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: onSubmit, // Call onSubmit when clicked
                  ),
                ],
              ),

              // Input Field
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Write a post",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Tab Button Widget
  Widget _tabButton(BuildContext context, String title, {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade100 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }


  // 🔹 User Input Box
  Widget _userInputBox() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 20,
            ),
            SizedBox(width: 10),
            Expanded(child: Text("Add your thoughts...", style: TextStyle(fontSize: 16, color: Colors.black54))),
          ],
        ),
      ),
    );
  }

  // 🔹 Post Card with Reply Button
  Widget _postCard(int index, String username, String timeAgo, String content) {
    return ListTile(
      title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(content),
      trailing: IconButton(
        icon: const Icon(Icons.reply, color: Colors.blue),
        onPressed: () => _showReplyInputModal(context, index), // Open reply modal
      ),
    );
  }

  // 🔹 Reply Card
  Widget _replyCard(String username, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 5),
      child: ListTile(
        title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }
}
