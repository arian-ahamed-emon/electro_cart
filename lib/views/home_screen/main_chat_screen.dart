import 'package:flutter/material.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({super.key});

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(width: 10),
            CircleAvatar(),
              SizedBox(width: 10),
              Text('Ai Assistant',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

            ],
          )
        ],
      ),
    );
  }
}
