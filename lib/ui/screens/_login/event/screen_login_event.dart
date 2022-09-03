import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/ui/_login/login_bloc.dart';
import 'package:conditioning/service/auth/auth_exception.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/elements/arrow/arrow_login_screens.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEventScreen extends StatefulWidget {
  const LoginEventScreen({Key? key, required this.enableLoginScreensNavigation}) : super(key: key);
  final bool enableLoginScreensNavigation;

  @override
  State<LoginEventScreen> createState() => _LoginEventScreenState();
}

class _LoginEventScreenState extends State<LoginEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  late bool _isLoginView = true;
  late String screenTitle;
  late String topButtonText;
  late String bottomButton1Text;
  late String bottomButton2Text;

  @override
  Widget build(BuildContext context) {
    switch (_isLoginView) {
      case false:
        screenTitle = context.loc.title_register;
        bottomButton1Text = context.loc.buttonTitle_registerAndLogin;
        bottomButton2Text =
            context.loc.buttonTitle_registerAndLoginWithGoogleAccount;
        topButtonText = context.loc.buttonTitle_backToLoginScreen;
        break;
      case true:
        screenTitle = context.loc.screenName_loginEvent;
        bottomButton1Text = screenTitle;
        bottomButton2Text = context.loc.buttonTitle_loginWithGoogleAccount;
        topButtonText = context.loc.buttonTitle_registerAccount;
        break;
    }
    return BlocListener<AuthEventBloc, AuthState>(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 40,
                child: Column(children: [
                  Expanded(
                      child: ArrowLoginScreens(
                        isLeft: true,
                        onTap: () => context
                            .read<LoginBloc>()
                            .add(const LoginEventEventToApp()),
                      ))
                ]),
              ),
              Expanded(child: Container()),
            ],
          ),
          Center(
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
                        children: _topButtons(),
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
                      child: Column(children: _bottomButtons()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      listener: (context, state) {
        if (state.exception != null) {
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
            snackBarText =
                "${context.loc.errorMessage_somethingBadHappenedWhileLogin}\n$e";
          }
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(snackBarText))));
        }
      },
    );
  }

  List<Widget> _topButtons() => <Widget>[
        IconTextCard(
          icon: Icons.login,
          text: context.loc.buttonTitle_loginAsVisitor,
          onTap: () => _login(context),
        ),
        IconTextCard(
          icon: Icons.app_registration,
          text: topButtonText,
          onTap: () => setState(() {
            _isLoginView = !_isLoginView;
            _formKey.currentState!.reset();
            FocusManager.instance.primaryFocus?.unfocus();
          }),
        ),
      ];

  List<Widget> _middleTextField() => <Widget>[
        _isLoginView
            ? Container()
            : Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 8.0),
                child: TextFormField(
                  controller: _userName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context
                          .loc.textFieldErrorMessage_thisFieldCannotBeEmpty;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Row(children: [
                        const Icon(Icons.account_box),
                        Text(context.loc.textFieldTitle_userName)
                      ])),
                  style: const TextStyle(fontFamily: 'Roboto'),
                ),
              ),
        TextFormField(
          controller: _email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context
                  .loc.textFieldErrorMessage_pleaseEnterCorrectEmailFormat;
            }
            return null;
          },
          decoration: InputDecoration(
            label: Row(children: [
              const Icon(Icons.email),
              Text(context.loc.textFieldTitle_email)
            ]),
          ),
          style: const TextStyle(fontFamily: 'Roboto'),
        ),
        TextFormField(
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
        )
      ];

  List<Widget> _bottomButtons() => <Widget>[
        IconTextCard(
            icon: Icons.login,
            text: bottomButton1Text,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _login(context);
              }
            }),
        IconTextCard(
            icon: Icons.g_mobiledata_rounded,
            text: bottomButton2Text,
            onTap: () {}),
      ];

  void _login(BuildContext context) {
    switch (_isLoginView) {
      case true:
        context.read<AuthEventBloc>().add(AuthEventUserEventRegisterAndLogin(
          userName: _userName.text,
          email: _email.text,
          password: _password.text,
        ));
        break;
      default:
        context.read<AuthEventBloc>().add(AuthEventUserEventLogin(
          email: _email.text,
          password: _password.text,
        ));
    }
  }
}
