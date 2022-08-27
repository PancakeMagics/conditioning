import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/service/store/store_provider.dart';

part 'orgs_event.dart';
part 'orgs_state.dart';

class OrgsBloc extends StoreBloc {
  OrgsBloc({required StoreProvider storeProvider}) : super(storeProvider: storeProvider) {
    on<OrgsStoreEventInitialize>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
