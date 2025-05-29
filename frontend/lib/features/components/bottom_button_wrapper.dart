import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomButtonWrapper extends StatelessWidget {
  const BottomButtonWrapper({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(
          bottom: (defaultTargetPlatform == TargetPlatform.iOS? context.viewInsets.bottom: 0) + 16,
        ),
        child: child,
      ),
    );
  }
}
