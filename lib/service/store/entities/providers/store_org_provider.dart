import 'package:flutter/material.dart' show immutable;
import '../store_org.dart';
import 'provider.dart';

@immutable
abstract class StoreOrgProvider extends StoreProvider {
  abstract final List<StoreOrg> orgList;
  const StoreOrgProvider();

  Future<StoreOrg> createOrGetExistOrg({required String orgId});
  Future<Iterable<StoreOrg>> getPublicOrgs();
  Future<Iterable<StoreOrg>> getUserOrgs({required String orgId});
  Future<void> updateOrgName({required String orgId, required String newName});
  Future<void> deleteOrg({required String orgId});
}