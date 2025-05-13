import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../Models/chats.dart';
import '../Chats/chats_page.dart';
import '../dashboard.dart';

// Dummy chat data
final List<Chats> chatList = [
  Chats(
    name: "Akhilesh Yadav",
    lastMessage: "See you at the event! 🚀",
    time: "09:45",
    avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
    unreadCount: 2,
  ),
  Chats(
    name: "Nikita Sharma",
    lastMessage: "Thank you so much!",
    time: "08:21",
    avatarUrl: "https://randomuser.me/api/portraits/women/44.jpg",
    unreadCount: 0,
  ),
  Chats(
    name: "Sahil Patel",
    lastMessage: "Let's catch up soon.",
    time: "Yesterday",
    avatarUrl: "https://randomuser.me/api/portraits/men/45.jpg",
    unreadCount: 1,
  ),
];

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  void _openChat(BuildContext context, Chats chat) {
    Get.offAll(
        ChatScreen(
            chatName: chat.name,
            avatarUrl: chat.avatarUrl
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A125A),
        elevation: 0,
        title: InkWell(
          onTap: (){
            Get.offAll(Dashboard());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CATA',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Text(
                    'LIFT',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {}, // Add settings action
            tooltip: 'Settings',
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: chatList.length,
        separatorBuilder: (_, __) => const Divider(indent: 80, endIndent: 16, height: 0),
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.avatarUrl),
              radius: 28,
            ),
            title: Text(
              chat.name,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chat.time,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                ),
                if (chat.unreadCount > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "${chat.unreadCount}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            onTap: () => _openChat(context, chat),
          );
        },
      ),
    );
  }
}
