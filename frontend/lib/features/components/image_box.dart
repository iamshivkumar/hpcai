// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lmd_admin/utils/extensions.dart';

// class ImageBox extends ConsumerWidget {
//   const ImageBox({super.key, required this.image});

//   final String? image;
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     return AspectRatio(
//       aspectRatio: 3 / 2,
//       child: Container(
//         decoration: BoxDecoration(
//           color: context.scheme.surfaceContainerLowest,
//           borderRadius: BorderRadius.circular(8),
//           image: image != null
//               ? DecorationImage(
//                   image: CachedNetworkImageProvider(ref.imgUrl(image!)),
//                   fit: BoxFit.cover,
//                 )
//               : null,
//         ),
//         child: image == null
//             ? Icon(
//                 Icons.image_outlined,
//                 color: context.scheme.surfaceContainerHighest,
//               )
//             : null,
//       ),
//     );
//   }
// }
