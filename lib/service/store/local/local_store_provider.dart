import 'package:conditioning/service/store/store_provider.dart';

abstract class LocalStoreProvider extends StoreProvider {
  const LocalStoreProvider({
    required super.userList,
    required super.orgList,
    required super.eventList,
    required super.topicList,
  });
}
