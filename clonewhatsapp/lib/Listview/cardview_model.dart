class AppModel {
  List<ContactInfo>? contactInFo;

  // Constructor to create an instance from a JSON object
  AppModel.fromJson(Map<String, dynamic> json)
      : contactInFo = (json['contactInFo'] as List<dynamic>?)
      ?.map((e) => ContactInfo.fromJson(e as Map<String, dynamic>))
      .toList();

  // Method to convert the instance back into a JSON object
  Map<String, dynamic> toJson() => {
    'contactInFo': contactInFo?.map((e) => e.toJson()).toList(),
  };
}


class ContactInfo {
  final int? id;
  final String? name;
  final String? profilePic;
  final String? time;
  final int? messageUnreadCount;
  final String? lastMessage;
   bool? isRead;
   bool? isGroup;

  ContactInfo({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.time,
    required this.messageUnreadCount,
    required this.lastMessage,
    required this.isRead,
    required this.isGroup,
  });

  // Constructor for creating an instance from a JSON object
  ContactInfo.fromJson(Map<String, dynamic> json)
      : id = SafeManager.parseInt(json, 'id'),
        name = SafeManager.parseString(json, 'name'),
        profilePic = SafeManager.parseString(json, 'profilePic'),
        time = SafeManager.parseString(json, 'time'),
        messageUnreadCount = SafeManager.parseInt(json, 'messageUnreadCount'),
        lastMessage = SafeManager.parseString(json, 'lastMessage'),
        isRead = SafeManager.parseBool(json, 'isRead'),
        isGroup = SafeManager.parseBool(json, 'isGroup');

  // Method to convert the instance back into a JSON object
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profilePic': profilePic,
    'time': time,
    'messageUnreadCount': messageUnreadCount,
    'lastMessage': lastMessage,
    'isRead': isRead,
    'isGroup': isGroup,
  };
}

List<ContactInfo> contactInFo = [
  ContactInfo(
    id: 1,
    name: "Rahuram",
    profilePic: 'assets/images/image1.jpg',
    time: '12:00pm',
    messageUnreadCount: 4,
    lastMessage: 'Hey, how are you?',
    isRead: true,
    isGroup: false,
  ),
  ContactInfo(
    id: 2,
    name: "Anjali",
    profilePic: 'assets/images/image2.jpg',
    time: '1:30pm',
    messageUnreadCount: 2,
    lastMessage: 'See you soon!',
    isRead: false,
    isGroup: true,
  ),
  ContactInfo(
    id: 3,
    name: "Suraj",
    profilePic: 'assets/images/image3.jpg',
    time: '10:45am',
    messageUnreadCount: 3,
    lastMessage: 'Let’s meet tomorrow.',
    isRead: true,
    isGroup: false,
  ),
  ContactInfo(
    id: 4,
    name: "Maya",
    profilePic: 'assets/images/image4.jpg',
    time: '11:15am',
    messageUnreadCount: 1,
    lastMessage: 'Got your message!',
    isRead: false,
    isGroup: false,
  ),
  ContactInfo(
    id: 5,
    name: "Vikram",
    profilePic: 'assets/images/image5.jpg',
    time: '2:30pm',
    messageUnreadCount: 6,
    lastMessage: 'Call me when you’re free.',
    isRead: true,
    isGroup: true,
  ),
  ContactInfo(
    id: 6,
    name: "Priya",
    profilePic: 'assets/images/image6.jpg',
    time: '9:00am',
    messageUnreadCount: 5,
    lastMessage: 'I’ll send it later.',
    isRead: false,
    isGroup: false,
  ),
  ContactInfo(
    id: 7,
    name: "Karan",
    profilePic: 'assets/images/image7.jpg',
    time: '6:20pm',
    messageUnreadCount: 0,
    lastMessage: 'Thanks!',
    isRead: true,
    isGroup: true,
  ),
  ContactInfo(
    id: 8,
    name: "Neha",
    profilePic: 'assets/images/image8.jpg',
    time: '8:00am',
    messageUnreadCount: 8,
    lastMessage: 'Good morning!',
    isRead: false,
    isGroup: false,
  ),
  ContactInfo(
    id: 9,
    name: "Ajay",
    profilePic: 'assets/images/image9.jpg',
    time: '5:15pm',
    messageUnreadCount: 9,
    lastMessage: 'Let me know if you need anything.',
    isRead: false,
    isGroup: true,
  ),
  ContactInfo(
    id: 10,
    name: "Simran",
    profilePic: 'assets/images/image10.jpg',
    time: '3:45pm',
    messageUnreadCount: 1,
    lastMessage: 'Where are you?',
    isRead: true,
    isGroup: false,
  ),
  ContactInfo(
    id: 11,
    name: "Nikhil",
    profilePic: 'assets/images/image11.jpg',
    time: '7:00pm',
    messageUnreadCount: 0,
    lastMessage: 'Just got home.',
    isRead: true,
    isGroup: false,
  ),
  ContactInfo(
    id: 12,
    name: "Sanjana",
    profilePic: 'assets/images/image12.jpg',
    time: '9:45pm',
    messageUnreadCount: 3,
    lastMessage: 'Okay, cool!',
    isRead: false,
    isGroup: true,
  ),
  ContactInfo(
    id: 13,
    name: "Arjun",
    profilePic: 'assets/images/image13.jpg',
    time: '4:30pm',
    messageUnreadCount: 7,
    lastMessage: 'I’ll be there in 10 minutes.',
    isRead: true,
    isGroup: false,
  ),
  ContactInfo(
    id: 14,
    name: "Pooja",
    profilePic: 'assets/images/image14.jpg',
    time: '11:50am',
    messageUnreadCount: 2,
    lastMessage: 'Let’s chat tomorrow.',
    isRead: false,
    isGroup: true,
  ),
  ContactInfo(
    id: 15,
    name: "Rohan",
    profilePic: 'assets/images/image15.jpg',
    time: '5:00pm',
    messageUnreadCount: 5,
    lastMessage: 'Can we reschedule?',
    isRead: true,
    isGroup: false,
  ),
];




class SafeManager {
  // Safely parse an integer from JSON
  static int? parseInt(Map<String, dynamic> json, String key) {
    return json[key] is int ? json[key] as int : int.tryParse(json[key]?.toString() ?? '');
  }

  // Safely parse a string from JSON
  static String? parseString(Map<String, dynamic> json, String key) {
    return json[key]?.toString();
  }

  // Safely parse a boolean from JSON
  static bool? parseBool(Map<String, dynamic> json, String key) {
    var value = json[key];
    if (value is bool) {
      return value;
    }
    if (value is String) {
      return value.toLowerCase() == 'true';
    }
    if (value is int) {
      return value == 1;
    }
    return null;
  }
}