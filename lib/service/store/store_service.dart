import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_event.dart';
import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_field.dart';
import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_note.dart';
import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_org.dart';
import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_topic.dart';
import 'package:conditioning/service/store/entities/providers/cloud/firebase/firestore_user.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:conditioning/service/utils/constants/option_store.dart';
import 'package:conditioning/service/utils/constants/option_store_service.dart';


class StoreService implements StoreProvider {
  final StoreProvider _storeProvider;
  const StoreService(this._storeProvider);
  factory StoreService.getService({required StoreOption storeOption, required StoreServiceOption serviceOption}) {
    switch (serviceOption) {
      case StoreServiceOption.firebase:
        return StoreService.getFromFirebase(storeOption: storeOption);
    }
  }
  factory StoreService.getFromFirebase({required StoreOption storeOption}) {
    switch (storeOption) {
      case StoreOption.user:
        return StoreService(StoreUserProviderFirestore());
      case StoreOption.note:
        return StoreService(StoreNoteProviderFirestore());
      case StoreOption.org:
        return StoreService(StoreOrgProviderFirestore());
      case StoreOption.event:
        return StoreService(StoreEventProviderFirestore());
      case StoreOption.topic:
        return StoreService(StoreTopicProviderFirestore());
      case StoreOption.field:
        return StoreService(StoreNoteProviderFirestore());
    }
  }

  @override
  Future<void> initialize() => _storeProvider.initialize();

}
