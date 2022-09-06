import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditioning/service/store/utils/store_path.dart';

class ChatMessages {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  ChatMessages({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      StorePath.idFrom: idFrom,
      StorePath.idTo: idTo,
      StorePath.timestamp: timestamp,
      StorePath.content: content,
      StorePath.type: type,
    };
  }

  factory ChatMessages.fromDocument(DocumentSnapshot documentSnapshot) {
    String idFrom = documentSnapshot.get(StorePath.idFrom);
    String idTo = documentSnapshot.get(StorePath.idTo);
    String timestamp = documentSnapshot.get(StorePath.timestamp);
    String content = documentSnapshot.get(StorePath.content);
    int type = documentSnapshot.get(StorePath.type);

    return ChatMessages(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}
