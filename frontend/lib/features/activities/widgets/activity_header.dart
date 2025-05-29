import 'package:ai_school/core/models/activity.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityHeader extends StatelessWidget implements PreferredSizeWidget {
  const ActivityHeader({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.scheme.inverseSurface,
      child: InkWell(
        onTap: () {
          context.push('/activity-details',extra: activity);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    activity.title,
                    style: TextStyle(color: context.scheme.onInverseSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'View',
                  style: context.style.labelMedium?.copyWith(
                    color: context.scheme.inversePrimary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: context.scheme.inversePrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(32);
}
