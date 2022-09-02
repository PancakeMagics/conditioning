import 'dart:async';

import 'package:conditioning/service/utils/intl/util.dart';
import 'package:flutter/material.dart';

class LoadingViewController {
  final void Function(String text) update;
  final void Function() close;
  const LoadingViewController({required this.close, required this.update});
}

// TODO: LoadingView with animation
// class LoadingView extends StatefulWidget {
//   const LoadingView({Key? key}) : super(key: key);
//
//   @override
//   State<LoadingView> createState() => _LoadingViewState();
// }
//
// class _LoadingViewState extends State<LoadingView> with SingleTickerProviderStateMixin {
//   late final AnimationController _animationController;
//   late final Tween<>
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class LoadingView {
  LoadingView._sharedInstance();
  factory LoadingView() => _shared;
  static final LoadingView _shared = LoadingView._sharedInstance();

  LoadingViewController? _loadingViewController;
  void showOverlay({required BuildContext context}) {
    final textStream = StreamController<String>();
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final overlay = OverlayEntry(
      builder: (context) =>
          Material(
            color: Colors.black38.withAlpha(200),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        const LinearProgressIndicator(),
                        const SizedBox(height: 20),
                        StreamBuilder(
                          stream: textStream.stream,
                          builder: (context, snapshot) =>
                          snapshot.hasData
                              ? Text(snapshot.data as String,
                              textAlign: TextAlign.center)
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
    state?.insert(overlay);

    _loadingViewController = LoadingViewController(
      update: (text) => textStream.add(text),
      close: () {
        textStream.close();
        overlay.remove();
      },
    );
    _continuingUpdateOverlay(context: context);
  }
  void _continuingUpdateOverlay({required BuildContext context}) async {
    final loc = context.loc;
    final List<String> loadingText = <String>[
      loc.loading,
      loc.loading_chat_weather, loc.loading_chat_weather_a,
      loc.loading_chat_food, loc.loading_chat_food_a,
      loc.loading_chat_rest, loc.loading_chat_phone,
      loc.loading_end,
    ];
    for (var element in loadingText) {
      await Future.delayed(const Duration(seconds: 3), () => _loadingViewController?.update(element));
    }
    //TODO: continuing recycle
    //while (true) {}
  }
  void hideOverlay() {
    _loadingViewController?.close();
    _loadingViewController = null;
  }
}

