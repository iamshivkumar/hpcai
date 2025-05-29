
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hpc/core/models/student_info.dart';

// final studentInfoProvider = FutureProvider.autoDispose.family<StudentInfo?, String>((
//   ref,
//   id,
// ) {
//   return FirebaseFirestore.instance
//       .collection('students_infos')
//       .doc(id)
//       .get()
//       .then(
//         (e) => e.exists? StudentInfo.fromMap(e): null
//       );
// });
