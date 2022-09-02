
import 'package:conditioning/bloc/services/store/events/store_events_bloc.dart';
import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/bloc/services/store/store_bloc.dart';
import 'package:conditioning/bloc/services/store/users/store_users_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreUsersBloc extends StoreUsersBloc {
  ExploreUsersBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventUserOnTap>((event, emit) async {
      emit(ExploreStateUserDetail(user: event.userItem, isLoading: false));
    });
  }
}

class ExploreOrgsBloc extends StoreOrgsBloc {
  ExploreOrgsBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventOrgOnTap>((event, emit) async {
      emit(ExploreStateOrgDetail(org: event.orgItem, isLoading: false));
    });
  }
}

class ExploreEventsBloc extends StoreEventsBloc {
  ExploreEventsBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventEventOnTap>((event, emit) async {
      emit(ExploreStateEventDetail(event: event.eventItem, isLoading: false));
    });
  }
}
