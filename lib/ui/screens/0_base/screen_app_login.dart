
import 'package:conditioning/bloc/app_user/app_user_bloc.dart';
import 'package:conditioning/service/auth/auth_exception.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen({Key? key, required this.isSlideIn, required this.slideDirection,}) : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;

  @override
  State<AppLoginScreen> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends State<AppLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _userName = TextEditingController();
  late final _email = TextEditingController();
  late final _password = TextEditingController();

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  late bool _isRegisterScreen = false;
  late String screenTitle;
  late String topButtonText;
  late String bottomButton1Text;
  late String bottomButton2Text;

  List<Widget> _middleTextField() {
    final List<Widget> textFields = <Widget>[];
    if (_isRegisterScreen) {
      textFields.add(Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 8.0),
        child: TextFormField(
          controller: _userName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.loc.thisFieldCannotBeEmpty;
            }
            return null;
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Row(children: [
                const Icon(Icons.account_box),
                Text(context.loc.userName)
              ])),
          style: const TextStyle(fontFamily: 'Roboto'),
        ),
      ));
    }

    textFields.add(TextFormField(
      controller: _email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.loc.pleaseEnterCorrectEmailFormat;
        }
        return null;
      },
      decoration: InputDecoration(
        label:
        Row(children: [const Icon(Icons.email), Text(context.loc.email)]),
      ),
      style: const TextStyle(fontFamily: 'Roboto'),
    ));
    textFields.add(TextFormField(
      controller: _password,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.loc.thisFieldCannotBeEmpty;
        }
        return null;
      },
      decoration: InputDecoration(
          label: Row(children: [
            const Icon(Icons.password),
            Text(context.loc.password)
          ])),
      style: const TextStyle(fontFamily: 'Roboto'),
    ));
    return textFields;
  }

  @override
  Widget build(BuildContext context) {
    switch (_isRegisterScreen) {
      case true:
        screenTitle = context.loc.register;
        bottomButton1Text = context.loc.registerAndLogin;
        bottomButton2Text = context.loc.registerAndLoginWithGoogleAccount;
        topButtonText = context.loc.backToLoginScreen;
        break;
      default:
        screenTitle = context.loc.login;
        bottomButton1Text = screenTitle;
        bottomButton2Text = context.loc.loginWithGoogleAccount;
        topButtonText = context.loc.registerNewAccount;
        break;
    }
    return BlocListener<AppUserBloc, AppUserState>(
      listener: (context, state) {
        if (state is AppUserStateInitial && state.exception != null) {
          final e = state.exception;
          late final String snackBarText;

          if (state is AppUserStateLoginYet) {
            if (e is UserNotFoundAuthException) {
              snackBarText = context.loc.userNotFound;
            } else if (e is WrongPasswordAuthException) {
              snackBarText = context.loc.wrongPassword;
            } else {
              snackBarText = context.loc.somethingBadHappenedWhileLogin;
            }
          } else if (state is AppUserStateRegisterYet) {
            if (e is WeakPasswordAuthException) {
              snackBarText = context.loc.weakPasswordLessThan6;
            } else if (e is EmailAlreadyInUseAuthException) {
              snackBarText = context.loc.emailAlreadyInUse;
            } else if (e is InvalidEmailAuthException) {
              snackBarText = context.loc.invalidEmail;
            } else {
              snackBarText = context.loc.somethingBadHappenedWhileLogin;
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(snackBarText))));
        }
      },
      child: SlideWidgetBuilder(
        isSlideIn: widget.isSlideIn,
        slideDirection: widget.slideDirection,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(
              height: 520,
              width: 320,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          getIconTextCard(
                              icon: Icons.app_registration,
                              text: topButtonText,
                              onTap: () => setState(() {
                                _isRegisterScreen = !_isRegisterScreen;
                                _formKey.currentState!.reset();
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                              })),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(children: [
                        Text(screenTitle,
                            style: Theme.of(context).textTheme.titleLarge),
                        ..._middleTextField(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(children: <Widget>[
                        getIconTextCard(
                            icon: Icons.login,
                            text: bottomButton1Text,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _loginWithContext(context);
                              }
                            }),
                        getIconTextCard(
                            icon: Icons.g_mobiledata_rounded,
                            text: bottomButton2Text,
                            onTap: () {
                              _loginWithContext(context);
                            }),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginWithContext(BuildContext context) {
    switch (_isRegisterScreen) {
      case true:
        context.read<AppUserBloc>().add(AppUserEventRegisterAndLogin(
          userName: _userName.text,
          email: _email.text,
          password: _password.text,
        ));
        break;
      default:
        context.read<AppUserBloc>().add(AppUserEventLogin(
          email: _email.text,
          password: _password.text,
        ));
    }
  }
}
