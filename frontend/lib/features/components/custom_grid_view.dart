



import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.children,
    this.count = 2,
    this.spacing,
    this.verticalSpacing,
  });

  final List<Widget> children;
  final double? spacing;
  final double? verticalSpacing;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: verticalSpacing ?? 0,
      children: List.generate(
        children.length ~/ count + (children.length % count > 0 ? 1 : 0),
        (ci) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: spacing ?? 0,
          children: List.generate(count, (ri) {
            final index = ci * count + ri;
            return children.length > index
                ? Expanded(child: children[index])
                : Spacer();
          }),
        ),
      ),
    );
  }
}
