import 'dart:developer';
import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/settings/animation_durations.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/utils/extensions/globalkey.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/animations/searchingbar/searching_bar.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:conditioning/ui/screens/_login/_setup/login_screens_provider.dart';
import 'package:conditioning/ui/screens/app/explore/views/details//view_org_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, ReadContext;

class ExploreOrgView extends StatefulWidget {
  const ExploreOrgView({Key? key, required this.orgList}) : super(key: key);
  final List<Org> orgList;

  @override
  State<ExploreOrgView> createState() => _ExploreOrgViewState();
}

class _ExploreOrgViewState extends State<ExploreOrgView> {
  late final List<Org> _orgList;
  late PesItem<Org>? _pesItem;
  late bool _userWantLoginOrg;
  Offset _exploreScreenOffset = Offset.zero;
  Offset _loginOrgScreenOffset = const Offset(0.0, -1.0);

  @override
  void initState() {
    _orgList = widget.orgList;
    _pesItem = null;
    _userWantLoginOrg = false;
    super.initState();
  }

  void _itemOnTap(BuildContext context, Org org, GlobalKey key) {
    final renderBox = key.renderBox;
    _pesItem = PesItem<Org>(
      itemZeroOffset: renderBox.localToGlobal(Offset.zero),
      itemSize: renderBox.size,
      item: org,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<AppExploreOrgsBloc>().add(const ExploreOrgEventStoreOrgsData());

    return BlocListener<AppExploreOrgsBloc, AuthState>(
      listener: (context, state) {
        setState(() {
          if (state is ExploreOrgStateLogin) {
            _exploreScreenOffset = const Offset(0.0, 1.0);
            _loginOrgScreenOffset = Offset.zero;
            _userWantLoginOrg = true;

          } else if (state is ExploreOrgStateLoginCancel) {
            _exploreScreenOffset = Offset.zero;
            _loginOrgScreenOffset = const Offset(0.0, -1.0);
            _userWantLoginOrg = false;
          }
        });
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _exploreScreenOffset,
            duration: shortDuration,
            child: Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        IconButton(
                            icon: const Icon(Icons.home_outlined),
                            onPressed: () =>
                                context.read<AppBloc>().add(const AppEventExploreToHome()))
                      ])),
                ),
                PesPen(
                  pesItem: _pesItem,
                  pesView: ExploreOrgDetail(org: _pesItem?.item),
                  child: SearchingBar(
                    backgroundColor: Colors.grey,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: AppBar().preferredSize.height),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ListView.builder(
                            itemCount: _orgList.length,
                            itemBuilder: (context, index) {
                              final org = _orgList[index];
                              final key = GlobalKey();
                              return getIconTextCard(
                                key: key,
                                icon: Icons.school,
                                text: org.name,
                                onTap: () =>
                                    setState(() => _itemOnTap(context, org, key)),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          AnimatedSlide(
            offset: _loginOrgScreenOffset,
            duration: shortDuration,
            child: AnimatedOpacity(
              opacity: _userWantLoginOrg ? 1.0 : 0.0,
              duration: shortDuration,
              child: const LoginScreensProvider(
                loginOption: LoginOption.org,
                enableLoginScreensNavigation: false,
                navigationSetUpFinished: false,
                enableBackButton: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
