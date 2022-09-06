import '../../../store_org.dart';
import '../../store_org_provider.dart';

class StoreOrgProviderFirestore extends StoreOrgProvider {
  const StoreOrgProviderFirestore._sharedInstance();
  factory StoreOrgProviderFirestore() => _shared;
  static const StoreOrgProviderFirestore _shared = StoreOrgProviderFirestore._sharedInstance();

  //TODO: implement firebase
  @override
  Future<void> initialize() => Future(() => null);

  @override
  List<StoreOrg> get orgList => List<StoreOrg>.generate(
      50, (index) => StoreOrg(id: '$index', name: 'orgName of $index'));

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