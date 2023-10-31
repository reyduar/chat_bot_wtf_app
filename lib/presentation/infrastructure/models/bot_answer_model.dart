import 'package:chat_app/domain/entities/message.dart';

class BotAnswerModel {
  String answer;
  bool forced;
  String? image;

  BotAnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory BotAnswerModel.fromJsonMap(Map<String, dynamic> json) =>
      BotAnswerModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.bot,
      imageUrl: image);
}
