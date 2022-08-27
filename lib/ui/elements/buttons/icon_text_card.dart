import 'package:flutter/material.dart';

Widget getIconTextCard({
  required IconData icon,
  required String text,
  required void Function() onTap,
}) =>
    Card(
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
        ));
