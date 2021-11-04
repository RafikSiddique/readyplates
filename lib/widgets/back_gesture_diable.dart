import 'dart:io';

import 'package:flutter/material.dart';

class WillNotPopOnGesture extends StatelessWidget {
  final Widget Function() child;
  const WillNotPopOnGesture({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child(),
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (Navigator.of(context).userGestureInProgress) {
            return false;
          } else {
            return true;
          }
        } else {
          Navigator.pop(context);
          return true;
        }
      },
    );
  }
}
