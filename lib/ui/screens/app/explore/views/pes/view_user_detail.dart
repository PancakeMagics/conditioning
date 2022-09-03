import 'dart:developer';

import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreUserDetail extends StatefulWidget {
  const ExploreUserDetail({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User? user;

  @override
  State<ExploreUserDetail> createState() => _ExploreUserDetailState();
}

class _ExploreUserDetailState extends State<ExploreUserDetail> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.user?.name ?? '', style: textTheme.titleLarge),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.network('https://picsum.photos/350').image),
                ),
                child: const SizedBox(width: 400, height: 400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hobbyt', style: textTheme.bodySmall),
                  Text(widget.user?.hobby ?? '(...)',
                      style: textTheme.bodySmall),
                ],
              ),
              const SizedBox(width: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('contact', style: textTheme.bodySmall),
                  Text(widget.user?.contact ?? '(...)',
                      style: textTheme.bodySmall),
                ],
              ),
              ButtonBar(
                buttonAlignedDropdown: false,
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async =>
                          await launchUrl(Uri.parse('https://google.com')),
                      child: Text(context.loc.buttonTitle_website)),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed('/explore-org');

                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) {
                            log('\n'
                                'animation1: $animation1\n'
                                'animation2: $animation2\n'
                                '');

                            return Container();
                          },
                        ));
                      },
                      child: Text(context.loc.buttonTitle_login)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
