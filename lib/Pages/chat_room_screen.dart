import 'package:flutter/material.dart';

/// ChatRoomScreen displays a conversation UI between the user and a friend.
class ChatRoomScreen extends StatefulWidget {
  final String userName;

  const ChatRoomScreen({super.key, required this.userName});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _messageController =
      TextEditingController(); // Controls message input
  final FocusNode _focusNode = FocusNode(); // Handles keyboard focus

  // Sample initial chat messages
  List<Map<String, dynamic>> messages = [
    {"text": "Hey, how's it going?", "isMe": false, "time": "19:30"},
    {"text": "All good! Working on the app.", "isMe": true, "time": "19:32"},
  ];

  /// Adds a new message to the list if the input is not empty
  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        "text": text,
        "isMe": true,
        "time": TimeOfDay.now().format(context), // Current time
      });
      _messageController.clear(); // Clear input
    });

    FocusScope.of(context).requestFocus(_focusNode); // Keep focus on input
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1), // Dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.userName,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 1,
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message["isMe"];

                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isMe
                              ? const Color.fromRGBO(
                                255,
                                49,
                                49,
                                1,
                              ) // Sender (you) color
                              : Colors.grey.shade800, // Receiver color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Message text
                        Text(
                          message["text"],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        // Timestamp
                        Text(
                          message["time"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Divider between messages and input
          Divider(color: Colors.grey.shade800),

          // Message input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.black,
            child: Row(
              children: [
                // Text input
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    focusNode: _focusNode,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _sendMessage(), // Send on enter
                  ),
                ),

                // Send button
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color.fromRGBO(255, 49, 49, 1),
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
