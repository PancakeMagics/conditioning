import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';

@immutable
class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: context.theme.primaryColor,
      elevation: 20.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}
