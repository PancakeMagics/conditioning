import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:conditioning/service/settings/settings.dart';

class User {
  final String id;
  final String email;
  final bool registerNotVerified;
  final String name;
  final String? contact;
  final String? hobby;
  final AppSettings appSetting;

  const User({
    required this.id,
    required this.email,
    required this.registerNotVerified,
    required this.name,
    this.appSetting = const AppSettings(),
    this.contact,
    this.hobby,
  });
}
