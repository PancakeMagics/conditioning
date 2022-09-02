import 'dart:developer';

import 'package:conditioning/service/utils/intl/util.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreOrgDetail extends StatefulWidget {
  const ExploreOrgDetail({
    Key? key,
    required this.org,
  }) : super(key: key);
  final Org org;

  @override
  State<ExploreOrgDetail> createState() => _ExploreOrgDetailState();
}

class _ExploreOrgDetailState extends State<ExploreOrgDetail> {
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
              Text(widget.org.name ?? '', style: textTheme.titleLarge),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.network('https://picsum.photos/300').image),
                ),
                child: const SizedBox(width: 400, height: 400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('main contact', style: textTheme.bodySmall),
                  Text(widget.org.mainContact ?? '(...)',
                      style: textTheme.bodySmall),
                ],
              ),
              const SizedBox(width: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('address', style: textTheme.bodySmall),
                  Text(widget.org.address ?? '(...)',
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
