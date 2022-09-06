import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:conditioning/service/store/utils/app_settings.dart';
import 'package:conditioning/service/store/utils/store_path.dart';

class StoreUser {
  final String id;
  final String name;
  final String createdAt;
  final String? email;
  final String? contact;
  final String? birth;
  final String? hobby;
  final AppSettings appSetting;

  const StoreUser({
    required this.id,
    required this.name,
    required this.createdAt,
    this.email,
    this.contact,
    this.birth,
    this.hobby,
    this.appSetting = const AppSettings(),
  });

  factory StoreUser.fromFirestoreDocument(String idQuery, DocumentSnapshot snapshot) =>
      StoreUser(
        id: snapshot.get(idQuery),
        name: snapshot.get(StorePath.name),
        createdAt: snapshot.get(StorePath.createdAt),
      );
}
