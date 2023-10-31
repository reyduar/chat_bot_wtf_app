import 'package:chat_app/presentation/helpers/get_bot_answer.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetBotAnswer getBotAnswer = GetBotAnswer();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final message = Message(text: text, fromWho: FromWho.mine);

    if (text.endsWith('?')) {
      botReplay();
    }

    messagesList.add(message);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> botReplay() async {
    final botMessage = await getBotAnswer.getAnswer();
    messagesList.add(botMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
