import 'package:ai_school/core/enums/likeart_answer.dart';
import 'package:ai_school/features/assessments/widgets/likeart_answer_icon.dart';
import 'package:ai_school/utils/extensions.dart';
import 'package:flutter/material.dart';


class LikeartAnswerSelectionView extends StatelessWidget {
  const LikeartAnswerSelectionView({
    super.key,
    required this.onChanged,
    this.selected,
  });

  final LikeartAnswer? selected;
  final ValueChanged<LikeartAnswer?> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        ...LikeartAnswer.values.map((answer) {
          final selected = answer == this.selected;
          return Expanded(
            child: InkWell(
              onTap: () {
                onChanged(answer);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8,
                  children: [
                    LikeartAnswerIcon(value: answer, selected: selected),
                    Text(
                      answer.value.capLabel,
                      style: TextStyle(
                        fontWeight: selected ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
