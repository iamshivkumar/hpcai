import 'package:ai_school/core/enums/likeart_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeartAnswerIcon extends StatelessWidget {
  const LikeartAnswerIcon({
    super.key,
    required this.value,
    this.selected = false,
  });

  final LikeartAnswer value;

  final bool selected;
  @override
  Widget build(BuildContext context) {
    final answerToIcon = {
      LikeartAnswer.yes: 'assets/images/yes.svg',
      LikeartAnswer.no: 'assets/images/no.svg',
      LikeartAnswer.notSure: 'assets/images/not-sure.svg',
      LikeartAnswer.sometimes: 'assets/images/sometimes.svg',
    };

    final answerToSelectedIcon = {
      LikeartAnswer.yes: 'assets/images/yes-selected.svg',
      LikeartAnswer.no: 'assets/images/no-selected.svg',
      LikeartAnswer.notSure: 'assets/images/not-sure-selected.svg',
      LikeartAnswer.sometimes: 'assets/images/sometimes-selected.svg',
    };

    return SvgPicture.asset(
      (selected
          ? answerToSelectedIcon[value] ?? ''
          : answerToIcon[value] ?? ''),
      height: 56,
      width: 56,
    );
  }
}
