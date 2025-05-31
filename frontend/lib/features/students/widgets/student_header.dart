import 'package:ai_school/core/models/class.dart';
import 'package:ai_school/core/models/student.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';


class StudentHeader extends StatelessWidget implements PreferredSizeWidget {
  const StudentHeader({
    super.key,
    required this.student,
    this.class$,
  });

  final Student student;
  final Class? class$;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.scheme.surfaceContainerLow,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            spacing: 8,
            children: [
              Material(
                shape: const StadiumBorder(),
                color: context.scheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: Text(
                    '${student.rollNo}',
                    maxLines: 1,
                    style: context.style.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(child: Text(student.name)),
              if (class$ != null)
                Text(
                  class$!.label,
                  style: context.style.bodySmall?.copyWith(
                    color: context.scheme.outline,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(32);
}