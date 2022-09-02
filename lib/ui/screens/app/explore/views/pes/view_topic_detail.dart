import 'dart:developer';

import 'package:conditioning/service/utils/intl/util.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/topic.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreTopicDetail extends StatefulWidget {
  const ExploreTopicDetail({
    Key? key,
    required this.topic,
  }) : super(key: key);
  final Topic topic;

  @override
  State<ExploreTopicDetail> createState() => _ExploreTopicDetailState();
}

class _ExploreTopicDetailState extends State<ExploreTopicDetail> {
  late final List<User> _userList;
  late final List<Org> _orgList;
  late final List<Event> _eventList;

  @override
  void initState() {
    _userList = widget.topic.userList;
    _orgList = widget.topic.orgList;
    _eventList = widget.topic.eventList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.topic?.name ?? '', style: textTheme.titleLarge),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            Image.network('https://picsum.photos/300').image),
                  ),
                  child: const SizedBox(width: 400, height: 400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      itemCount: _userList.length,
                      itemBuilder: (context, index) => Text('user: ${_userList[index].name}', style: textTheme.bodySmall),
                    ),
                    ListView.builder(
                      itemCount: _userList.length,
                      itemBuilder: (context, index) => Text('org: ${_orgList[index].name}', style: textTheme.bodySmall),
                    ),
                    ListView.builder(
                      itemCount: _userList.length,
                      itemBuilder: (context, index) => Text('event: ${_eventList[index].name}', style: textTheme.bodySmall),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
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
      ),
    );
  }
}
