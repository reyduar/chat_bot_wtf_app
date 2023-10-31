enum FromWho { mine, bot }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  const Message({required this.text, this.imageUrl, required this.fromWho});
}
