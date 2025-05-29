import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';

class LoadingButtonTextWrapper extends StatelessWidget {
  const LoadingButtonTextWrapper(
      {super.key, required this.child,  this.loading = false});

  final Widget child;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(loading)...[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: context.scheme.outline,
              strokeWidth: 3,
              backgroundColor: context.scheme.outlineVariant,
            ),
          ),
          const SizedBox(width: 12),
        ],
        child,
      ],
    );
  }
}
