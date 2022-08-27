import 'package:conditioning/service/store/store_provider.dart';

abstract class CloudStoreProvider extends StoreProvider {
  const CloudStoreProvider({required super.userList, required super.orgList, required super.eventList});
}