
// enum AssessmentAnswer { 
//   yes, sometimes, no, notSure, custom;


//  const AssessmentAnswer([this.answer]);

//   final String? answer;  
// }

import 'package:equatable/equatable.dart';

class LikeartAnswer extends Equatable{
  final String value;

  const LikeartAnswer(this.value);

  static const LikeartAnswer yes = LikeartAnswer("yes");
  static const LikeartAnswer sometimes = LikeartAnswer("sometimes");
  static const LikeartAnswer no = LikeartAnswer("no");
  static const LikeartAnswer notSure = LikeartAnswer("notSure");


 String get name => value;


 static List<LikeartAnswer> get values => [yes,sometimes,no,notSure];

  // Custom answer
  factory LikeartAnswer.custom(String customValue) {
    return LikeartAnswer(customValue);
  }
  
  @override
  List<Object?> get props => [value];
}