import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/elements/_generics/snackbar_not_yet_complete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.screenName_home)),
      drawer: _drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<AppBloc, AuthState>(builder: (context, state) {
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
                          .add(const AppEventHomeToFriend());
                    },
                    child: Text(context.loc.screenName_friend),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //TODO: user can select exploreViewOption before HomeToExplore
                      context
                          .read<AppBloc>()
                          .add(const AppEventHomeToExplore());
                    },
                    child: Text(context.loc.screenName_explore),
                  ),
                ],
              ),
            ],
          );
        }),
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
                  Navigator.pop(context);
                  context.read<AuthAppBloc>().add(const AuthAppUserEventLogout());
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
