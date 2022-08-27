import 'package:conditioning/service/auth/auth_exception.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/app/app_bloc.dart';
import '../../../bloc/auth/auth_state.dart';
import '../../../bloc/utils/screens/base_bloc.dart';

class AppLoginScreen extends StatefulWidget {
  const AppLoginScreen(
      {Key? key,
        required this.isSlideIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

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

  late bool _isRegisterView = false;
  late String screenTitle;
  late String topButtonText;
  late String bottomButton1Text;
  late String bottomButton2Text;

  List<Widget> _middleTextField() {
    final List<Widget> textFields = <Widget>[];
    if (_isRegisterView) {
      textFields.add(Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 8.0),
        child: TextFormField(
          controller: _userName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.loc.textFieldErrorMessage_thisFieldCannotBeEmpty;
            }
            return null;
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Row(children: [
                const Icon(Icons.account_box),
                Text(context.loc.textFieldTitle_userName)
              ])),
          style: const TextStyle(fontFamily: 'Roboto'),//TODO: custom font
        ),
      ));
    }

    textFields.add(TextFormField(
      controller: _email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.loc.textFieldErrorMessage_pleaseEnterCorrectEmailFormat;
        }
        return null;
      },
      decoration: InputDecoration(
        label:
        Row(children: [const Icon(Icons.email), Text(context.loc.textFieldTitle_email)]),
      ),
      style: const TextStyle(fontFamily: 'Roboto'),
    ));
    textFields.add(TextFormField(
      controller: _password,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.loc.textFieldErrorMessage_thisFieldCannotBeEmpty;
        }
        return null;
      },
      decoration: InputDecoration(
          label: Row(children: [
            const Icon(Icons.password),
            Text(context.loc.textFieldTitle_password)
          ])),
      style: const TextStyle(fontFamily: 'Roboto'),
    ));
    return textFields;
  }

  @override
  Widget build(BuildContext context) {
    switch (_isRegisterView) {
      case true:
        screenTitle = context.loc.title_register;
        bottomButton1Text = context.loc.buttonTitle_registerAndLogin;
        bottomButton2Text = context.loc.buttonTitle_registerAndLoginWithGoogleAccount;
        topButtonText = context.loc.buttonTitle_backToLoginScreen;
        break;
      default:
        screenTitle = context.loc.screenName_login;
        bottomButton1Text = screenTitle;
        bottomButton2Text = context.loc.buttonTitle_loginWithGoogleAccount;
        topButtonText = context.loc.buttonTitle_registerAccount;
        break;
    }
    return BlocListener<BaseBloc, AuthState>(
      listener: (context, state) {
        if (state is AppUserStateLoginYet && state.exception != null) {
          final e = state.exception;
          late final String snackBarText;

          if (e is RegisterException) {
            if (e is WeakPasswordAuthException) {
              snackBarText = context.loc.errorMessage_weakPasswordLessThan6;
            } else if (e is EmailAlreadyInUseAuthException) {
              snackBarText = context.loc.errorMessage_emailAlreadyInUse;
            } else if (e is InvalidEmailAuthException) {
              snackBarText = context.loc.errorMessage_invalidEmail;
            }
          } else if (e is LoginException) {
            if (e is UserNotFoundAuthException) {
              snackBarText = context.loc.errorMessage_userNotFound;
            } else if (e is WrongPasswordAuthException) {
              snackBarText = context.loc.errorMessage_wrongPassword;
            }
          } else {
            snackBarText = "${context.loc.errorMessage_somethingBadHappenedWhileLogin}\n$e";
          }
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(snackBarText))));
        }
      },
      child: SlideWidgetBuilder(
        isSlideIn: widget.isSlideIn,
        slideDirection: widget.slideDirection,
        curve: widget.curve,
        child: Scaffold(
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
                                _isRegisterView = !_isRegisterView;
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
    switch (_isRegisterView) {
      case true:
        context.read<BaseBloc>().add(AppUserEventRegisterAndLogin(
          userName: _userName.text,
          email: _email.text,
          password: _password.text,
        ));
        break;
      default:
        context.read<BaseBloc>().add(AppUserEventLogin(
          email: _email.text,
          password: _password.text,
        ));
    }
  }
}
