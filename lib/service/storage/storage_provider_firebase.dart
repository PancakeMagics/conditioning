import 'dart:io' show File;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditioning/service/storage/storage_provider.dart';
import 'package:conditioning/service/store/utils/store_path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProviderFirebase extends StorageProvider {
  late final FirebaseStorage _storage;

  @override
  Future<void> initialize() async {
    _storage = FirebaseStorage.instance;
  }

  Future<String> uploadImageFileAndStoreUrl({
    required File image,
    required String fileName,
  }) async {
    Reference reference = _storage.ref().child(fileName);
    TaskSnapshot snapshot = await reference.putFile(image);
    String uri = await snapshot.ref.getDownloadURL();

    FirebaseFirestore.instance
        .collection(StorePath.userCollection)
        .doc(StorePath.userIdApp)
        .update({StorePath.photoUrl: uri});
    return uri;
  }
}
