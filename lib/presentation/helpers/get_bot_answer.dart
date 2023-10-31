import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/infrastructure/models/bot_answer_model.dart';
import 'package:dio/dio.dart';

class GetBotAnswer {
  Future<Message> getAnswer() async {
    final dioClient = Dio();
    final response = await dioClient.get('https://yesno.wtf/api');

    final botAnswerMessage = BotAnswerModel.fromJsonMap(response.data);

    return botAnswerMessage.toMessageEntity();
  }
}
