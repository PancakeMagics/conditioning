
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/service/store/entities/store_org.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreOrgDetail extends StatefulWidget {
  const ExploreOrgDetail({Key? key, required this.org}) : super(key: key);
  final StoreOrg? org;

  @override
  State<ExploreOrgDetail> createState() => _ExploreOrgDetailState();
}

class _ExploreOrgDetailState extends State<ExploreOrgDetail> {
  StoreOrg? _currentOrg;

  @override
  void didUpdateWidget(covariant ExploreOrgDetail oldWidget) {
    _currentOrg = widget.org;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Material(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_currentOrg?.name ?? '', style: textTheme.titleLarge),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image
                          .network('https://picsum.photos/300')
                          .image),
                ),
                child: const SizedBox(width: 400, height: 400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('main contact', style: textTheme.bodySmall),
                  Text(_currentOrg?.mainContact ?? '(...)',
                      style: textTheme.bodySmall),
                ],
              ),
              const SizedBox(width: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('address', style: textTheme.bodySmall),
                  Text(_currentOrg?.address ?? '(...)',
                      style: textTheme.bodySmall),
                ],
              ),
              ButtonBar(
                buttonAlignedDropdown: false,
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async =>
                      await launchUrl(
                          Uri.parse('https://google.com')),
                      child: Text(context.loc.buttonTitle_website)),
                  ElevatedButton(
                      onPressed: () =>
                          setState(() => context.read<AppExploreOrgBloc>().add(ExploreOrgEventLogin(org: _currentOrg!))),
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
