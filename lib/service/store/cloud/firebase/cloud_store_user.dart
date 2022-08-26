
import 'package:conditioning/service/store/cloud/cloud_store_provider.dart';
import 'package:conditioning/service/store/entities/store.dart';

abstract class CloudStoreUser extends CloudStoreProvider {//i think inheritance make code readable
  const CloudStoreUser({required super.store});

  @override
  Future<StoreUser> createOrGetExistUser({required String userId}) {
    return Future(() => const StoreUser(id: 'cgu id', name: 'cgu name'));
  }

  @override
  Future<Iterable<StoreUser>> getPublicUsers() {
    return Future(() => [const StoreUser(id: 'gpu id', name: 'gpu name')]);
  }

  @override
  Future<Iterable<StoreUser>> getUserFriends({required String userId}) {
    return Future(() => [const StoreUser(id: 'guf id', name: 'guf name')]);
  }

  @override
  Future<void> updateUserName({required String userId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteUser({required String userId}) {
  return Future.delayed(const Duration(milliseconds: 500));
}
}