// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hpc/core/enums/fillup.dart';
// import 'package:hpc/core/models/class.dart';
// import 'package:hpc/features/components/async_widget.dart';
// import 'package:hpc/features/components/empty_message_view.dart';
// import 'package:hpc/features/components/progress_icon.dart';
// import 'package:hpc/features/students/providers/student_info_provider.dart';
// import 'package:hpc/features/students/providers/students_provider.dart';
// import 'package:hpc/features/students/write_student_info_page.dart';

// class StudentsInfosPage extends ConsumerWidget {
//   const StudentsInfosPage({super.key, required this.class$});

//   final Class class$;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Students Information')),
//       body: AsyncWidget(
//         value: ref.watch(studentsProvider(class$.id)),
//         data: (data) {
//           if (data.isEmpty) {
//             return EmptyMessageView("You didn't added any student yet");
//           }
//           return ListView(
//                 children:
//                     data
//                         .map(
//                           (e) => ListTile(
//                             onTap: ()async {
//                               final info = await ref.read(studentInfoProvider(e.id).future);
//                               context.push(
//                                 '/write-student-info',
//                                 extra: WriteStudentInfoPageArgs(
//                                   student: e,
//                                   class$: class$,
//                                   initial: info,
//                                 ),
//                               );
//                             },
//                             title: Text(e.name),
//                             leading: CircleAvatar(child: Text('${e.rollNo}')),
//                                                     trailing: ProgressIcon(e.filled[Fillup.info]),

//                           ),
//                         )
//                         .toList(),
//               );
//         },
//       ),
//     );
//   }
// }
