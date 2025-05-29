import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';

class TagText extends StatelessWidget {
  const TagText({super.key,required this.tag,required this.text});
  
  final String tag;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // text: '${e.key}',
        text: '',
        style: context.style.titleSmall?.copyWith(
          color: context.scheme.primary,
        ),
        children: [
          WidgetSpan(
            child: Material(
              color: context.scheme.tertiaryContainer,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                child: Text(
                  tag,
                  style: context.style.labelMedium?.copyWith(
                    color: context.scheme.onTertiaryContainer,
                  ),
                ),
              ),
            ),
          ),
          TextSpan(text: ' $text', style: context.style.bodyMedium),
        ],
      ),
    );
  }
}
