import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../service/store/utils/store_path.dart';

// TODO: replace with 'json_serializable' ; see: https://docs.flutter.dev/development/data-and-backend/json
// @JsonSerializable()
class ChatUser extends Equatable {
  final String id;
  final String photoUrl;
  final String displayName;
  final String phoneNumber;
  final String aboutMe;

  const ChatUser(
      {required this.id,
      required this.photoUrl,
      required this.displayName,
      required this.phoneNumber,
      required this.aboutMe});

  ChatUser copyWith() => ChatUser(
        id: id,
        photoUrl: photoUrl,
        displayName: displayName,
        phoneNumber: phoneNumber,
        aboutMe: aboutMe,
      );

  //TODO: Map<String, dynamic> toJson() => _$ChatUserToJson();
  Map<String, dynamic> toJson() => {
        StorePath.name: displayName,
        StorePath.photoUrl: photoUrl,
        StorePath.phoneNumber: phoneNumber,
        StorePath.aboutMe: aboutMe,
      };

  //TODO: factory ChatUser.fromJson(Map<String, dynamic> json) => _$ChatUserFromJson(json);
  factory ChatUser.fromDocument(DocumentSnapshot snapshot) {
    String photoUrl = "";
    String nickname = "";
    String phoneNumber = "";
    String aboutMe = "";

    try {
      photoUrl = snapshot.get(StorePath.photoUrl);
      nickname = snapshot.get(StorePath.name);
      phoneNumber = snapshot.get(StorePath.phoneNumber);
      aboutMe = snapshot.get(StorePath.aboutMe);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return ChatUser(
        id: snapshot.id,
        photoUrl: photoUrl,
        displayName: nickname,
        phoneNumber: phoneNumber,
        aboutMe: aboutMe);
  }

  @override
  List<Object?> get props => [id];
}
