import 'package:ai_school/core/enums/grade.dart';

enum Area {
  physical, // Physical Development
  socioEmotional, // Socio-Emotional and Ethical Development
  cognitive, // Cognitive Development
  language, // Language and Literacy Development
  aesthetic,
  positive, // Aesthetic and Cultural Development

  // preparatory
  languageR1,
  languageR2,
  maths,
  worldAround,
  artEd,
  physicalEd;

  static List<Area> list(Grade grade) {
    if ([
      Grade.nursery,
      Grade.lkg,
      Grade.ukg,
      Grade.grade1,
      Grade.grade2,
    ].contains(grade)) {
      return [
        Area.physical,
        Area.socioEmotional,
        Area.cognitive,
        Area.language,
        Area.aesthetic,
        Area.positive,
      ];
    } else {
      return [
        Area.languageR1,
        Area.languageR2,
        Area.maths,
        Area.worldAround,
        Area.artEd,
        Area.physicalEd,
      ];
    }
  }
}

extension AreaExtension on Area {
  String get label {
    switch (this) {
      case Area.physical:
        return "Physical Development";
      case Area.socioEmotional:
        return "Socio-Emotional and Ethical Development";
      case Area.cognitive:
        return "Cognitive Development";
      case Area.language:
        return "Language and Literacy Development";
      case Area.aesthetic:
        return "Aesthetic and Cultural Development";
      case Area.positive:
        return "Positive Learning Habits";
      case Area.languageR1:
        return "Language Education (R1)";
      case Area.languageR2:
        return "Language Education (R2)";
      case Area.maths:
        return "Mathematics";
      case Area.worldAround:
        return "The World Around Us";
      case Area.artEd:
        return "Art Education (AE)";
      case Area.physicalEd:
        return "Physical Education (PE)";
    }
  }
}
