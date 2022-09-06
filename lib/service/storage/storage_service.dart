

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditioning/service/storage/storage_provider.dart';
import 'package:conditioning/service/storage/storage_provider_firebase.dart';

class StorageService extends StorageProvider {
  final StorageProvider _provider;
  StorageService(this._provider);
  factory StorageService.fromFirebase() => StorageService(StorageProviderFirebase());

  @override
  Future<void> initialize() => _provider.initialize();

  Future<void> updateFirestoreData(String collectionPath, String docPath,
      Map<String, dynamic> dataUpdateNeeded) =>
      FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(docPath)
          .update(dataUpdateNeeded);
}