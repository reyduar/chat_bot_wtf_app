import 'package:chat_app/presentation/widgets/chat/bot_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/2678369?v=4'),
          ),
        ),
        title: const Text('Wall-E IA'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const BotMessageBubble()
                        : const MyMessageBubble();
                  })),
          const MessageFieldBox()
        ],
      ),
    ));
  }
}
