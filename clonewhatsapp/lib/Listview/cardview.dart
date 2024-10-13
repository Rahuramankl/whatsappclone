import 'dart:math';

import 'package:clonewhatsapp/Another_Listview/cloneview.dart';
import 'package:clonewhatsapp/Listview/cardview_model.dart';
import 'package:clonewhatsapp/Listview/cardview_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class CardView extends StatefulWidget {
  var viewModel;

  CardView({super.key, required this.viewModel});
  @override
  CarviewState createState() => CarviewState();
}

class CarviewState extends State<CardView> {
  // CardViewViewmodel vm = CardViewViewmodel();
  late final CardViewViewmodel vm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text('Clone Whatsapp'), // Add a title to the AppBar
      ),
      body: ListView.builder(
        itemCount:contactInFo.length,
        itemBuilder: (context,index) {
          var item =contactInFo[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedViewPage(item)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(item.profilePic.toString()),
                        radius: 30.0,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                        children: [
                          Text(item.name.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 6,
                          ),// Make the name bold
                          Text(item.lastMessage.toString()),
                        ],
                      ),
                      Spacer(), // Push the right column to the end
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end, // Align text to the end
                        children: [
                          Text(item.time.toString()),
                          SizedBox(
                            height: 6,
                          ),// Format time
                          Visibility(
                            visible: item.isRead == true,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  item.messageUnreadCount.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white, // Set text color to white for better contrast
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(
              Icons.add,
              color: Colors.green,size: 20, // Set the icon color to black
            ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WhatsAppClone(),
            ),
          );
        },
      ),
    ); // Replace with your actual UI}
  }
}

class SelectedViewPage extends StatefulWidget {

  final ContactInfo? view;

  SelectedViewPage(this.view);

  @override
  _SelectedViewPageState createState() => _SelectedViewPageState(); // Implement createState
}

class _SelectedViewPageState extends State<SelectedViewPage> {
  final TextEditingController _controller = TextEditingController();
  List<Messages> sendMessages = [];
  // List of predefined random reply messages
  List<String> replayMessages = [
    'Sure, I can help with that!',
    'Let me check on that.',
    'Sounds good!',
    'I’m not sure, can you clarify?',
    'That’s interesting!',
    'What do you think about it?',
    'Can you provide more details?',
    'Got it!',
  ];



  @override
  Widget build(BuildContext context) {
   return  StatefulBuilder(
     builder: (context,StateSetter setState) {
       return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.view!.profilePic.toString()),
                  radius: 15.0,
                ),
                SizedBox(width: 10),
                Text(widget.view!.name.toString()),
              ],
            ),
            backgroundColor: Color(0xFF075E54),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                setState(() {
                  widget.view!.isRead = false;
                  Navigator.pop(context);
                });
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body:Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: sendMessages.length,
                  itemBuilder: (context, index) {
                    bool? userMessage = sendMessages[index].isUserMessage;
                    return ListTile(
                      title: Align(
                        alignment: userMessage! ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: userMessage ? Colors.green[300] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(sendMessages[index].message.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black87),
                        ),
                        child: TextField(
                          cursorColor: Colors.green,
                          autofocus: false,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Messages',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            prefixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.black),
                            suffixIcon: Icon(Icons.attach_file_outlined, color: Colors.black),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: _sendMessage,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.send, color: Colors.white, size: 20),
                        radius: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
       );
     }
   );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        sendMessages.add(Messages(_controller.text, true)); // Add message to the list
        _controller.clear(); // Clear the text field
      });

      // Add a random reply with a delay
      Future.delayed(Duration(seconds: 2), () {
        String randomReply = _getRandomReply();
        setState(() {
          sendMessages.add(Messages(randomReply, false)); // Add the reply after the delay
        });
      });
    }
  }

  // Function to get a random reply from the list
  String _getRandomReply() {
    final random = Random();
    int randomIndex = random.nextInt(replayMessages.length);
    return replayMessages[randomIndex];
  }
}

class Messages {
  String? message;
  bool? isUserMessage;

  Messages(this.message,this.isUserMessage);
}