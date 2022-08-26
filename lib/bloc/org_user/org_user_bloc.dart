import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'org_user_event.dart';
part 'org_user_state.dart';

class OrgUserBloc extends Bloc<OrgUserEvent, OrgUserState> {
  OrgUserBloc() : super(OrgUserInitial()) {
    on<OrgUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
