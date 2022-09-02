import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/utils/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/elements/not_yet_complete_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.isNavIn) {
      context.read<AppBloc>().add(const AppUserEventStoreData());
    }

    return NavigationBuilder(
      isNavIn: widget.isNavIn,
      navDirection: widget.slideDirection,
      child: Scaffold(
        appBar: AppBar(title: Text(context.loc.screenName_home)),
        drawer: _drawer(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<AppBloc, AuthState>(builder: (context, state) {
            //TODO
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AppBloc>()
                            .add(const AppUserEventHomeToFriend());
                      },
                      child: Text(context.loc.screenName_friend),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AppBloc>()
                            .add(const AppUserEventHomeToExplore());
                      },
                      child: Text(context.loc.screenName_explore),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _drawer() => SizedBox(
        height: 768.0,
        // width: ,
        child: Drawer(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(context.loc.title_profile),
                  )),
              DrawerHeader(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FadeInImage.assetNetwork(
                      placeholder: 'assets/conditioning.png',
                      //TODO: make a gif
                      image: 'https://picsum.photos/400',
                    ).image,
                  ),
                ),
                child: Container(),
              ),
              ListTile(
                title: Text(context.loc.buttonTitle_logout),
                onTap: () {
                  //TODO: logout with animation

                  Navigator.pop(context);
                  context.read<AppBloc>().add(const AuthAppUserEventLogout());
                },
              ),
              ListTile(
                title: Text(context.loc.buttonTitle_logoutAndDeleteThisAccount),
                onTap: () {
                  Navigator.pop(context);
                  context.showNotYetCompletedSnackBar();
                },
              )
            ],
          ),
        ),
      );
}
