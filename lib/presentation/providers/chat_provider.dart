import 'package:flutter/material.dart';
import 'package:chat_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    const Message(text: 'Quieres hablar?', fromWho: FromWho.bot),
    const Message(text: 'Quieres un caramelo?', fromWho: FromWho.bot)
  ];

  Future<void> sendMessage(String text) async {}
}
