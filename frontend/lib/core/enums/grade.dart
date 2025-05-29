enum Grade {
  nursery('nursery', 'Nursery'),
  lkg('lkg', 'LKG'),
  ukg('ukg', 'UKG'),
  grade1('1', 'Class 1'),
  grade2('2', 'Class 2'),
  grade3('3', 'Class 3'),
  grade4('4', 'Class 4'),
  grade5('5', 'Class 5');


  
  const Grade(this.value, this.label);

  final String value;

  final String label;
}


extension GradeX on Grade {
  String get area {
    if([Grade.nursery,Grade.lkg,Grade.ukg,Grade.grade1,Grade.grade2].contains(this)){
      return "Domains";
    } else {
      return "Subjects";
    }
  }


  bool get isFoundation => [Grade.nursery,Grade.lkg,Grade.ukg,Grade.grade1,Grade.grade2].contains(this);
  bool get isPreparatory => [Grade.grade3, Grade.grade4, Grade.grade5].contains(this);


}


