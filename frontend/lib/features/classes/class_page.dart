// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hpc/core/enums/area.dart';
// import 'package:hpc/core/models/class.dart';
// import 'package:hpc/features/sessions/sessions_page.dart';

// class ClassPage extends StatelessWidget {
//   const ClassPage({super.key, required this.class$});

//   final Class class$;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(class$.label)),
//       body: ListView(
//         padding: EdgeInsets.all(12),
//         children: [
//           Card(
//             child: ListTile(
//               title: Text('Students'),
//               onTap: () {
//                 context.push('/students', extra: class$.id);
//               },
//             ),
//           ),

//           Card(
//             child: ListTile(
//               title: Text('Activities'),
//               onTap: () {
//                 context.push('/sessions', extra: SessionsPageArgs(class$: class$, area: Domain.aesthetic));
//               },
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text('Students Information'),
//               onTap: () {
//                 context.push('/students-infos', extra: class$);
//               },
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text('About Me'),
//               onTap: () {
//                 context.push('/about-mes', extra: class$);
//               },
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text('Peer Assessment'),
//               onTap: () {
//                 context.push('/peer-assessments', extra: class$);
//               },
//             ),
//           ),
//           Card(
//             child: ListTile(
//               title: Text('Parent Assessment'),
//               onTap: () {
//                 context.push('/parent-assessments', extra: class$);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
