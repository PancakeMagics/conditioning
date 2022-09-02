import 'package:flutter/material.dart';

//TODO: inherit exist widget like Card
class IconTextCard extends StatelessWidget {
  const IconTextCard({Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) =>
      Card(
          key: key,
          elevation: 5,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(text),
                  )
                ],
              ),
            ),
          ),
      );
}

//TODO: explore_org cannot use 'IconTextCard' because --- Multiple widgets used the same GlobalKey?
Widget getIconTextCard({
  required Key key,
  required IconData icon,
  required String text,
  required void Function() onTap,
}) => Card(
  key: key,
  elevation: 5,
  child: InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
    ),
  ),
);
