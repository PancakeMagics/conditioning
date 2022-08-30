
import 'package:conditioning/service/store/cloud/cloud_store_provider.dart';
import '../../entities/user.dart';

abstract class CloudStoreUser extends CloudStoreProvider {//i think inheritance make code readable
  const CloudStoreUser({required super.userList, required super.orgList, required super.eventList,});

  @override
  Future<User> createOrGetExistUser({required String userId}) {
    return Future(() => const User(id: 'cgu id', name: 'cgu name'));
  }

  @override
  Future<Iterable<User>> getPublicUsers() {
    return Future(() => [const User(id: 'gpu id', name: 'gpu name')]);
  }

  @override
  Future<Iterable<User>> getUserFriends({required String userId}) {
    return Future(() => [const User(id: 'guf id', name: 'guf name')]);
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