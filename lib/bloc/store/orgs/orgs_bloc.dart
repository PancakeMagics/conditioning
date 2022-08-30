import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/service/store/store_provider.dart';

import '../../../service/store/entities/org.dart';

part 'orgs_event.dart';
part 'orgs_state.dart';

class OrgsBloc extends StoreBloc {
  OrgsBloc({required StoreProvider storeProvider}) : super(storeProvider: storeProvider) {
    on<OrgStoreEventOrgsFilterByLocal>((event, emit) async {
      // TODO: implement
    });
    on<OrgStoreEventTapOrg>((event, emit) async {
      //TODO: get org in firebase by orgId
      emit(OrgStoreStateTapped(org: Org(id: 'tapped ${event.orgId}', name: 'tapped orgName')));
    });
  }
}
