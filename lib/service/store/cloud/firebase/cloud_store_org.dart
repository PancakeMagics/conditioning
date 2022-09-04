
import 'package:conditioning/service/store/cloud/firebase/cloud_store_user.dart';
import '../../entities/org.dart';

abstract class CloudStoreOrg extends CloudStoreUser {//i think inheritance make code readable
  const CloudStoreOrg({required super.userList, required super.orgList, required super.eventList, required super.topicList,});

  @override
  Future<Org> createOrGetExistOrg({required String orgId}) {
    return Future(() => const Org(id: 'cgo id', name: 'cgo name'));
  }

  @override
  Future<Iterable<Org>> getPublicOrgs() {
    return Future(() => const [Org(id: 'gpo id', name: 'gpo name')]);
  }

  @override
  Future<Iterable<Org>> getUserOrgs({required String orgId}) {
    return Future(() => const [Org(id: 'guo id', name: 'guo name')]);
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