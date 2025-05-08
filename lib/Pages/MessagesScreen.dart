import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:athlete_360/Widgets/customNavigationBar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

/// MessagesScreen displays a list of chat conversations with navigation.
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  // Dummy chat data to simulate recent conversations
  final List<Map<String, dynamic>> chats = const [
    {
      "name": "Chatgram",
      "message": "Chatgram Web was updated.",
      "time": "19:48",
      "unread": 1,
      "avatar": null,
    },
    {
      "name": "Jessica Drew",
      "message": "Ok, see you later",
      "time": "18:30",
      "unread": 2,
      "avatar": null,
    },
    {
      "name": "David Moore",
      "message": "You: I don't remember anything 😬",
      "time": "18:16",
      "unread": 0,
      "avatar": null,
    },
    {
      "name": "Greg James",
      "message": "I got a job at SpaceX 🎉🚀",
      "time": "18:02",
      "unread": 0,
      "avatar": "https://randomuser.me/api/portraits/men/1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Tracks the current index for the bottom navigation bar
    int _currentIndex = 3;

    /// Handles navigation when a bottom nav icon is pressed
    void _onTabSelected(int index, String route) {
      context.go(route);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      // 🟢 App Bar with title, search icon, and profile picture
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.redAccent),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg",
              ),
            ),
          ),
        ],
      ),

      // 🟡 Main Body: Search bar + chat list
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search for Coach, Venue",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📱 Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  onTap: () => context.push('/chatRoom', extra: chat["name"]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        chat["avatar"] != null
                            ? NetworkImage(chat["avatar"])
                            : null,
                    backgroundColor: Colors.white24,
                    child:
                        chat["avatar"] == null
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                  ),
                  title: Text(
                    chat["name"],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  subtitle: Text(
                    chat["message"],
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat["time"],
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                      if (chat["unread"] > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                          child: Text(
                            chat["unread"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🔻 Custom Bottom Navigation Bar
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        activeIconColor: const Color.fromRGBO(255, 49, 49, 1),
        inactiveIconColor: const Color.fromRGBO(255, 255, 255, 1),
        onHomePressed: () => _onTabSelected(0, '/home'),
        onEventsPressed: () => _onTabSelected(1, '/events'),
        onVenuesPressed: () => _onTabSelected(2, '/venues'),
        onMessagesPressed: () => _onTabSelected(3, '/messages'),
        onCenterPressed: () {
          // TODO: Define center button action if needed
          print('Center button pressed');
        },
      ),
    );
  }
}
