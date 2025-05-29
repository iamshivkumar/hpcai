import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';



class EmptyMessageView extends StatelessWidget {
  const EmptyMessageView( this.message, {
    super.key,
  });


  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: context.style.titleMedium?.copyWith(
            color: context.scheme.outline,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
