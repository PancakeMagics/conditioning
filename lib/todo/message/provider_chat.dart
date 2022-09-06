import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'message_chat.dart';

class ChatProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider({
    required this.prefs,
    required this.firebaseStorage,
    required this.firebaseFirestore,
  });

  // Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) => firebaseFirestore
  //       .collection(StorePath.messageCollection)
  //       .doc(groupChatId)
  //       .collection(groupChatId) //TODO: understand the architecture of collection within doc
  //       .orderBy(StorePath.timestamp, descending: true)
  //       .limit(limit)
  //       .snapshots();
  //
  // void sendChatMessage(String content, int type, String groupChatId,
  //     String userId, String peerId) {
  //   DocumentReference documentReference = firebaseFirestore
  //       .collection(StorePath.messageCollection)
  //       .doc(groupChatId)
  //       .collection(groupChatId)
  //       .doc(DateTime.now().millisecondsSinceEpoch.toString());
  //   ChatMessages chatMessages = ChatMessages(
  //       idFrom: userId,
  //       idTo: peerId,
  //       timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
  //       content: content,
  //       type: type);
  //
  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //     transaction.set(documentReference, chatMessages.toJson());
  //   });
  // }
}

class MessageType {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
