import 'package:flutter/material.dart';
import 'EventDetailsScreen.dart' show EventDetailsScreen;
import 'PastEventDetailsScreen.dart' show PastEventDetailsScreen;

class LiveEventsScreen extends StatefulWidget {
  const LiveEventsScreen({Key? key}) : super(key: key);

  @override
  _LiveEventsScreenState createState() => _LiveEventsScreenState();
}

class _LiveEventsScreenState extends State<LiveEventsScreen> {
  bool isUpcomingSelected = true; // Track which tab is active

  // 🔹 Sample Upcoming Events Data
  final List<Map<String, String>> events = [
    {
      "title": "Focus room (drop-in anytime)",
      "host": "Callie",
      "role": "Community Lead",
      "date": "Sun 11th June",
      "time": "8:00 PM",
    },
    {
      "title": "ADHD Awareness Webinar",
      "host": "Dr. Emily",
      "role": "Psychologist",
      "date": "Mon 12th June",
      "time": "6:30 PM",
    },
    {
      "title": "Productivity Hacks for ADHD",
      "host": "Alex Johnson",
      "role": "Motivational Speaker",
      "date": "Wed 14th June",
      "time": "5:00 PM",
    }
  ];
  List<Map<String, String>> pastEvents = [
    {
      "title": "Focus room (drop-in anytime)",
      "host": "Callie",
      "role": "Community Lead",
      "date": "Sun 11th June",
      "time": "8:00 PM",
      "image": "images/avatar.png",
    },
    {
      "title": "Productivity Masterclass",
      "host": "Alex",
      "role": "Productivity Coach",
      "date": "Mon 5th June",
      "time": "7:00 PM",
      "image": "images/avatar.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Live events", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Centered Tabs for Upcoming & Past Events
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton(
                    "Upcoming", isSelected: isUpcomingSelected, onTap: () {
                  setState(() => isUpcomingSelected = true);
                }),
                const SizedBox(width: 10),
                _tabButton("Past", isSelected: !isUpcomingSelected, onTap: () {
                  setState(() => isUpcomingSelected = false);
                }),
              ],
            ),
            const SizedBox(height: 15),

            // 🔹 Search Bar (No Filter Icon)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Display Upcoming or Past Events Based on Selection
            Expanded(
              child: isUpcomingSelected
                  ? _upcomingEventsList()
                  : _pastEventsList(),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Tab Button
  Widget _tabButton(String text,
      {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade200 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // 🔹 Upcoming Events List
  Widget _upcomingEventsList() {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return _eventCard(events[index]);
      },
    );
  }

  // 🔹 Past Events List (Now shows Past UI)
  Widget _pastEventsList() {
    return ListView.builder(
      itemCount: pastEvents.length, // Use your past events list
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PastEventDetailsScreen(event: pastEvents[index]),
              ),
            );
          },
          child: _pastEventCard(pastEvents[index]),
        );
      },
    );
  }

  // 🔹 Upcoming Event Card
  Widget _eventCard(Map<String, String> event) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EventDetailsScreen(event: event)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/avatar.png"),
              radius: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event["title"]!, style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(event["host"]!, style: const TextStyle(
                      fontSize: 14, color: Colors.black54)),
                  Text(event["role"]!, style: const TextStyle(
                      fontSize: 12, color: Colors.black45)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14),
                    const SizedBox(width: 4),
                    Text(event["date"]!, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14),
                    const SizedBox(width: 4),
                    Text(event["time"]!, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Past Event Card (Updated UI)
  Widget _pastEventCard(Map<String, String> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(event["image"]!),
            radius: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event["title"]!, style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
                Text(event["host"]!, style: const TextStyle(
                    fontSize: 14, color: Colors.black54)),
                Text(event["role"]!, style: const TextStyle(
                    fontSize: 12, color: Colors.black45)),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14),
                  const SizedBox(width: 4),
                  Text(event["date"]!, style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.play_arrow, size: 14),
                  const SizedBox(width: 4),
                  const Text("Play", style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
