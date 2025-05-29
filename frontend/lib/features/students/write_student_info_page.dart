// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hpc/core/enums/fillup.dart';
// import 'package:hpc/core/models/class.dart';
// import 'package:hpc/features/components/bottom_button_wrapper.dart';
// import 'package:hpc/features/components/loading_button_text_wrapper.dart';

// import 'package:hpc/core/models/student.dart';
// import 'package:hpc/core/models/student_info.dart';
// import 'package:hpc/features/components/student_header.dart';
// import 'package:hpc/utils/extensions.dart';

// class WriteStudentInfoPageArgs {
//   final StudentInfo? initial;
//   final Student student;
//   final Class class$;
//   WriteStudentInfoPageArgs({
//     this.initial,
//     required this.student,
//     required this.class$,
//   });
// }

// class WriteStudentInfoPage extends HookConsumerWidget {
//   const WriteStudentInfoPage({super.key, required this.args});

//   final WriteStudentInfoPageArgs args;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = FirebaseAuth.instance.currentUser!;
//     final student = useRef(
//       args.initial ??
//           StudentInfo(
//             id: args.student.id,
//             classId: args.class$.id,
//             registrationNumber: '',
//             mother: GuardianInfo(name: ''),
//             father: GuardianInfo(name: ''),
//             noOfSiblings: '',
//             siblingsAge: '',
//             motherTongue: '',
//             mediaOfInstruction: '',
//             region: RegionType.rural,
//             interests: [],
//             createdAt: DateTime.now(),
//             updatedAt: null,
//             createdBy: user.uid,
//           ),
//     );

//     final edit = args.initial != null;
//     final formKey = useMemoized(() => GlobalKey<FormState>());
//     final loading = useState(false);

//     Future<void> saveStudent() async {
//       if (!formKey.currentState!.validate()) return;

//       loading.value = true;
//       try {
//         final docRef = FirebaseFirestore.instance
//             .collection('students_infos')
//             .doc(student.value.id.isEmpty ? null : student.value.id);

//         final updated = student.value.copyWith(updatedAt: DateTime.now());
//         await docRef.set(updated.toMap(), SetOptions(merge: true));
//         FirebaseFirestore.instance.collection('students').doc(args.student.id).update({
//           'filled.${Fillup.info.name}': updated.filled
//         });
//         context.pop();
//       } catch (e) {
//         context.error(e);
//       } finally {
//         loading.value = false;
//       }
//     }

//     final build = useState(0);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${edit ? 'Edit' : 'Enter'} Student Information'),
//         bottom: StudentHeader(student: args.student, class$: args.class$),
//       ),
//       bottomNavigationBar: BottomButtonWrapper(
//         child: FilledButton(
//           onPressed: loading.value ? null : saveStudent,
//           child: LoadingButtonTextWrapper(
//             loading: loading.value,
//             child: const Text('Save'),
//           ),
//         ),
//       ),
//       body: AbsorbPointer(
//         absorbing: loading.value,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: formKey,
//             child: Column(
//               spacing: 16,
//               children: [
//                 TextFormField(
//                   initialValue: student.value.registrationNumber,
//                   decoration: const InputDecoration(
//                     labelText: 'Registration No',
//                   ),
//                   onChanged:
//                       (v) =>
//                           student.value = student.value.copyWith(
//                             registrationNumber: v,
//                           ),
//                   inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                 ),
//                 TextFormField(
//                   controller: TextEditingController(
//                     text: student.value.dateOfBirth?.label,
//                   ),
//                   readOnly: true,
//                   decoration: const InputDecoration(labelText: 'Date of Birth'),
//                   onTap: () async {
//                     final date = await showDatePicker(
//                       context: context,
//                       initialDate: student.value.dateOfBirth ?? DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime.now(),
//                     );
//                     if (date != null) {
//                       student.value = student.value.copyWith(dateOfBirth: date);
//                       build.value++;
//                     }
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: student.value.address,
//                   decoration: const InputDecoration(
//                     labelText: 'Address',
//                     hintText: 'Enter full address',
//                   ),
//                   textCapitalization: TextCapitalization.words,
//                   maxLines: 2,
//                   onChanged:
//                       (v) => student.value = student.value.copyWith(address: v),
//                   inputFormatters: [LengthLimitingTextInputFormatter(255)],
//                 ),

//                 TextFormField(
//                   initialValue: student.value.phone,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   keyboardType: TextInputType.phone,
//                   onChanged:
//                       (v) => student.value = student.value.copyWith(phone: v),
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(13),
//                   ],
//                 ),

//                 Column(
//                   spacing: 8,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // title:
//                   children: [
//                     const Text('Mother/Guardian Information'),
//                     TextFormField(
//                       initialValue: student.value.mother.name,
//                       decoration: const InputDecoration(labelText: 'Name*'),
//                       textCapitalization: TextCapitalization.words,
//                       validator: (v) => v!.isEmpty ? 'Required' : null,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 mother: student.value.mother.copyWith(name: v),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                     TextFormField(
//                       initialValue: student.value.mother.education,
//                       decoration: const InputDecoration(labelText: 'Education'),
//                       textCapitalization: TextCapitalization.words,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 mother: student.value.mother.copyWith(
//                                   education: v,
//                                 ),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                     TextFormField(
//                       initialValue: student.value.mother.occupation,
//                       decoration: const InputDecoration(
//                         labelText: 'Occupation',
//                       ),
//                       textCapitalization: TextCapitalization.words,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 mother: student.value.mother.copyWith(
//                                   occupation: v,
//                                 ),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                   ],
//                 ),

//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8,
//                   children: [
//                     const Text('Father/Guardian Information'),
//                     // Similar fields as mother's section
//                     TextFormField(
//                       initialValue: student.value.father.name,
//                       decoration: const InputDecoration(labelText: 'Name*'),
//                       textCapitalization: TextCapitalization.words,
//                       validator: (v) => v!.isEmpty ? 'Required' : null,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 father: student.value.father.copyWith(name: v),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                     TextFormField(
//                       initialValue: student.value.father.education,
//                       decoration: const InputDecoration(labelText: 'Education'),
//                       textCapitalization: TextCapitalization.words,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 mother: student.value.father.copyWith(
//                                   education: v,
//                                 ),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                     TextFormField(
//                       initialValue: student.value.father.occupation,
//                       decoration: const InputDecoration(
//                         labelText: 'Occupation',
//                       ),
//                       textCapitalization: TextCapitalization.words,
//                       onChanged:
//                           (v) =>
//                               student.value = student.value.copyWith(
//                                 mother: student.value.father.copyWith(
//                                   occupation: v,
//                                 ),
//                               ),
//                       inputFormatters: [LengthLimitingTextInputFormatter(100)],
//                     ),
//                   ],
//                 ),

//                 TextFormField(
//                   initialValue: student.value.noOfSiblings,
//                   decoration: const InputDecoration(
//                     labelText: 'Number of Siblings',
//                   ),
//                   keyboardType: TextInputType.number,
//                   onChanged:
//                       (v) =>
//                           student.value = student.value.copyWith(
//                             noOfSiblings: v,
//                           ),
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(2),
//                   ],
//                 ),

//                 TextFormField(
//                   initialValue: student.value.siblingsAge,
//                   decoration: const InputDecoration(
//                     labelText: 'Siblings Ages',
//                     hintText: 'Enter ages separated by commas',
//                   ),
//                   keyboardType: TextInputType.number,
//                   onChanged:
//                       (v) =>
//                           student.value = student.value.copyWith(
//                             siblingsAge: v,
//                           ),
//                   inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                 ),

//                 TextFormField(
//                   initialValue: student.value.motherTongue,
//                   decoration: const InputDecoration(labelText: 'Mother Tongue'),
//                   onChanged:
//                       (v) =>
//                           student.value = student.value.copyWith(
//                             motherTongue: v,
//                           ),
//                   inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                 ),

//                 TextFormField(
//                   initialValue: student.value.mediaOfInstruction,
//                   decoration: const InputDecoration(
//                     labelText: 'Media of Instruction',
//                   ),
//                   onChanged:
//                       (v) =>
//                           student.value = student.value.copyWith(
//                             mediaOfInstruction: v,
//                           ),
//                   inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('Region Type*'),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RadioListTile<RegionType>(
//                               title: const Text('Rural'),
//                               value: RegionType.rural,
//                               groupValue: student.value.region,
//                               onChanged: (v) {
//                                 student.value = student.value.copyWith(
//                                   region: v,
//                                 );
//                                 build.value++;
//                               },
//                             ),
//                           ),
//                           Expanded(
//                             child: RadioListTile<RegionType>(
//                               title: const Text('Urban'),
//                               value: RegionType.urban,
//                               groupValue: student.value.region,
//                               onChanged: (v) {
//                                 student.value = student.value.copyWith(
//                                   region: v,
//                                 );
//                                 build.value++;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 Column(
//                   spacing: 8,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text('Interests'),
//                     ...List.generate(student.value.interests.length, (index) {
//                       return Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               key: ValueKey('interest-${index}'),
//                               initialValue: student.value.interests.join(', '),
//                               onChanged: (v) {
//                                 student.value = student.value.copyWith(
//                                   interests: [...student.value.interests]
//                                     ..[index] = v.trim(),
//                                 );
//                               },
//                               validator: (v) => v!.isEmpty ? 'Required' : null,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               student.value = student.value.copyWith(
//                                 interests: [...student.value.interests]
//                                   ..removeAt(index),
//                               );
//                               build.value++;
//                             },
//                             icon: Icon(Icons.clear_rounded),
//                           ),
//                         ],
//                       );
//                     }),
//                     TextButton.icon(
//                       onPressed: () {
//                         student.value = student.value.copyWith(
//                           interests: [...student.value.interests, ''],
//                         );
//                         build.value++;
//                       },
//                       icon: Icon(Icons.add_rounded),
//                       label: Text('Add Interest'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
