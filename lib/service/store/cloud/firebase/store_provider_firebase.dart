
import 'package:conditioning/service/store/cloud/firebase/cloud_store_event.dart';

class StoreProviderFirebase extends CloudStoreEvent {
  StoreProviderFirebase._sharedInstance({required super.store});
  factory StoreProviderFirebase() => _shared;
  static final StoreProviderFirebase _shared = StoreProviderFirebase._sharedInstance(
    store: 'todo'
  );
}
