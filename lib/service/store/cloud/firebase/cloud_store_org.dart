
import 'package:conditioning/service/store/cloud/firebase/cloud_store_user.dart';
import 'package:conditioning/service/store/entities/store.dart';

abstract class CloudStoreOrg extends CloudStoreUser {//i think inheritance make code readable
  const CloudStoreOrg({required super.store});

  @override
  Future<StoreOrg> createOrGetExistOrg({required String orgId}) {
    return Future(() => const StoreOrg(id: 'cgo id', name: 'cgo name'));
  }

  @override
  Future<Iterable<StoreOrg>> getPublicOrgs() {
    return Future(() => const [StoreOrg(id: 'gpo id', name: 'gpo name')]);
  }

  @override
  Future<Iterable<StoreOrg>> getUserOrgs({required String orgId}) {
    return Future(() => const [StoreOrg(id: 'guo id', name: 'guo name')]);
  }

  @override
  Future<void> updateOrgName({required String orgId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteOrg({required String orgId}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}