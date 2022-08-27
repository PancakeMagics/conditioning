import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/service/store/store_provider.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends StoreBloc {
  UsersBloc({required StoreProvider storeProvider}) : super(storeProvider: storeProvider) {
    on<UsersStoreEventInitialize>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
