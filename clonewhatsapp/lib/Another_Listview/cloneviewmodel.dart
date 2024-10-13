// ChatModel to represent each chat item
class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isRead;
  final bool isGroup;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.isRead,
    this.isGroup = false,
  });
}

// Dummy chat data
List<ChatModel> dummyData = [
  ChatModel(
    name: "Rahuram",
    message: "Video call",
    time: "12:35 pm",
    avatarUrl: "assets/images/image1.jpg", // Add your image asset here
    isRead: true,
  ),
  ChatModel(
    name: "Alice",
    message: "Meeting invite",
    time: "8:40 pm",
    avatarUrl: "assets/images/image4.jpg", // Default image
    isRead: true,
  ),
  ChatModel(
    name: "Bob",
    message: "Message",
    time: "8:40 pm",
    avatarUrl: "assets/images/image8.jpg",
    isRead: false,
  ),
  ChatModel(
    name: "Charlie",
    message: "How's it going?",
    time: "8:40 pm",
    avatarUrl: "assets/images/image5.jpg",
    isRead: true,
  ),
  // Add more dummy chat data as per your need...
];