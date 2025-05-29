// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:lmd_admin/features/media_files/media_files_dialog.dart';
// import 'package:lmd_admin/utils/extensions.dart';

// class ImagePickerView extends ConsumerWidget {
//   const ImagePickerView({
//     super.key,
//     this.image,
//     this.onChanged,
//     this.onRemove,
//     this.height = 160,
//     this.aspectRatio = 1,
//     this.fit = BoxFit.contain,
//     this.res,
//   });

//   final String? image;
//   final ValueChanged<String>? onChanged;

//   final VoidCallback? onRemove;

//   final double height;
//   final double aspectRatio;
//   final BoxFit fit;
//   final String? res;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final aspectRatio =
//         res
//             ?.split('*')
//             .map((e) => double.parse(e))
//             .reduce((value, element) => value / element) ??
//         this.aspectRatio;
//     return SizedBox(
//       height: height,
//       child: AspectRatio(
//         aspectRatio: aspectRatio,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: context.scheme.outline),
//             image:
//                 image?.crim != null
//                     ? DecorationImage(
//                       image: CachedNetworkImageProvider(ref.imgUrl(image!)),
//                       fit: fit,
//                     )
//                     : null,
//           ),
//           child: Stack(
//             children: [
//               InkWell(
//                 onTap: () async {
//                   final picked = await MediaFilesDialog.show(context);
//                   if (picked is String) {
//                     onChanged!.call(picked);
//                   }
//                 },
//                 child:
//                     image?.crim == null
//                         ? Center(
//                           child: Text(
//                             [
//                               'Clik to add image',
//                               if (res != null)
//                                 '${res!.split('*').join(' x ')} px',
//                             ].join('\n'),
//                             style: context.style.bodySmall?.copyWith(
//                               color: context.scheme.outline,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         )
//                         : null,
//               ),
//               if (image != null && onRemove != null)
//                 Positioned(
//                   top: 4,
//                   right: 4,
//                   child: IconButton.filledTonal(
//                     onPressed: onRemove!,
//                     iconSize: 20,
//                     icon: Icon(Icons.remove_rounded),
//                     visualDensity: VisualDensity.comfortable,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImagePickerFormField extends FormField<String> {
//   ImagePickerFormField({
//     super.key,
//     required BuildContext context,
//     FormFieldValidator<String>? validator,
//     String? image,
//     ValueChanged<String>? onChanged,
//     VoidCallback? onRemove,
//     double height = 160,
//     double aspectRatio = 1,
//     BoxFit fit = BoxFit.contain,
//   }) : super(
//          initialValue: image,
//          validator: validator,
//          builder: (FormFieldState<String> field) {
//            return Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                ImagePickerView(
//                  fit: fit,
//                  image: field.value,
//                  aspectRatio: aspectRatio,
//                  height: height,
//                  onChanged:
//                      onChanged != null
//                          ? (value) {
//                            field.didChange(value);
//                            onChanged.call(value);
//                          }
//                          : null,
//                  onRemove:
//                      field.value == null
//                          ? null
//                          : onRemove != null
//                          ? () {
//                            field.didChange(null);
//                            onRemove();
//                          }
//                          : null,
//                ),
//                if (field.errorText != null)
//                  Padding(
//                    padding: const EdgeInsets.only(top: 8.0),
//                    child: Text(
//                      field.errorText!,
//                      style: TextStyle(
//                        color: Theme.of(context).colorScheme.error,
//                        fontSize: 12,
//                      ),
//                    ),
//                  ),
//              ],
//            );
//          },
//        );
// }
