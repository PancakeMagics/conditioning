import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter/material.dart' show immutable;
import '../store_user.dart';
import 'provider.dart';

@immutable
abstract class StoreUserProvider extends StoreProvider {
  abstract final List<StoreUser> appUserList;
  abstract final List<StoreUser> orgUserList;
  abstract final List<StoreUser> eventUserList;
  const StoreUserProvider();

  Future<Iterable<StoreUser>> getPublicAppUsers();
  Future<StoreUser> createOrGetExistUser({required AuthUserType type, required String userId, required String name});
  Future<Iterable<StoreUser>> getUserFriends({required AuthUserType type, required String userId});
  Future<void> updateUserData({required AuthUserType type, required String userId, required Map<String, dynamic> data});
  Future<void> deleteUser({required AuthUserType type, required String userId});
}
