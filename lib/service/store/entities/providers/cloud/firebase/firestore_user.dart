import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';

import '../../../../utils/store_path.dart';
import '../../../store_user.dart';
import '../../store_user_provider.dart';

class StoreUserProviderFirestore extends StoreUserProvider {
  late final FirebaseFirestore _store;
  @override
  Future<void> initialize() async => _store = FirebaseFirestore.instance;


  // TODO:
  @override
  List<StoreUser> get appUserList => <StoreUser>[];
  @override
  List<StoreUser> get eventUserList => <StoreUser>[];
  @override
  List<StoreUser> get orgUserList => <StoreUser>[];

  @override
  Future<StoreUser> createOrGetExistUser({required AuthUserType type, required String userId, required String name}) async {
    final String queryField;
    switch (type) {
      case AuthUserType.appUser:
        queryField = StorePath.userIdApp;
        break;
      case AuthUserType.orgUser:
        queryField = StorePath.userIdOrg;
        break;
      case AuthUserType.eventUser:
        queryField = StorePath.userIdEvent;
        break;
    }
    final QuerySnapshot snapshot = await _store
        .collection(StorePath.userCollection)
        .where(queryField, isEqualTo: userId)
        .get();
    final List<DocumentSnapshot> document = snapshot.docs;

    final birth = DateTime.now().millisecondsSinceEpoch.toString();
    if (document.isEmpty) {

      // TODO: replace with json to map
      _store
          .collection(StorePath.userCollection)
          .doc(queryField)
          .set({
        queryField : userId,
        StorePath.name : name,
        StorePath.createdAt : birth,
          });
      return StoreUser(id: userId, name: name, createdAt: birth);
    } else {
      DocumentSnapshot snapshot = document[0];
      return StoreUser.fromFirestoreDocument(queryField, snapshot);
    }
  }

  @override
  Future<void> deleteUser({required AuthUserType type, required String userId}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Iterable<StoreUser>> getPublicAppUsers() {
    throw UnimplementedError();
  }

  // TODO:
  Stream<QuerySnapshot> searchingUser(int limit, String textSearch) {
    if (textSearch.isNotEmpty) {
      return _store
          .collection(StorePath.userCollection)
          .limit(limit)
          .where(StorePath.name, isEqualTo: textSearch)
          .snapshots();
    } else {
      return _store
          .collection(StorePath.userCollection)
          .limit(limit)
          .snapshots();
    }
  }

  @override
  Future<Iterable<StoreUser>> getUserFriends({required AuthUserType type, required String userId}) {
    // TODO: implement getUserFriends
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserData({required AuthUserType type, required String userId, required Map<String, dynamic> data}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }

}