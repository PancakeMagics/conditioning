import 'dart:async';

import 'package:flutter/material.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingViewController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingViewController({
    required this.close,
    required this.update,
  });
}

class LoadingView {
  LoadingView._sharedInstance();

  factory LoadingView() => _shared;
  static final LoadingView _shared = LoadingView._sharedInstance();

  LoadingViewController? controller;

  void show({required BuildContext context, required String text}) =>
      controller ??= showOverlay(context: context, text: text);

  void update({required String text}) => controller?.update(text);

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingViewController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final textStreamController = StreamController<String>();
    textStreamController.add(text);
    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final overlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black12.withAlpha(150),
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
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    StreamBuilder(
                        stream: textStreamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data as String,
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    state?.insert(overlay);

    return LoadingViewController(
      close: () {
        textStreamController.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        textStreamController.add(text);
        return true;
      },
    );
  }
}
