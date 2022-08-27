import 'package:conditioning/bloc/auth/app/app_bloc.dart';

import '../../../bloc/utils/screens/base_bloc.dart';
import '../../../bloc/auth/app/others/event_screen_to_screen.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key,
      required this.isSlideIn,
      required this.slideDirection,
      this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SlideWidgetBuilder(
      isSlideIn: widget.isSlideIn,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.screenName_home),
        ),
        drawer: SizedBox(
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
                      image: Image.network('https://picsum.photos/400').image,
                    ), //Profile
                  ),
                  child: Container(),
                ),
                ListTile(
                  title: Text(context.loc.buttonTitle_logout),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<BaseBloc>().add(const AppUserEventLogout());
                  },
                ),
                ListTile(
                  title:
                      Text(context.loc.buttonTitle_logoutAndDeleteThisAccount),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(context.loc.notYetComplete),
                            )),
                        duration: const Duration(milliseconds: 800),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<BaseBloc>()
                          .add(const ScreensEventHomeToFriend());
                    },
                    child: Text(context.loc.screenName_friend),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<BaseBloc>()
                          .add(const ScreensEventHomeToExplore());
                    },
                    child: Text(context.loc.screenName_explore),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
