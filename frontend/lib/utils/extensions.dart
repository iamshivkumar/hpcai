
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
  TextTheme get style => theme.textTheme;
  ColorScheme get scheme => theme.colorScheme;
  // CustomColors get colors => theme.extension<CustomColors>()!;

  Size get size_ => MediaQuery.sizeOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  EdgeInsets get padding => MediaQuery.viewPaddingOf(this);


  bool get large => size_.width >= 1240;
  bool get medium => size_.width > 900 && size_.width < 1240;
  bool get small => size_.width <= 900;
  bool get extraSmall => size_.width < 600;

  // AppLocalizations get l10n => AppLocalizations.of(this)!;

  void error(Object e) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$e', style: TextStyle(color: scheme.errorContainer)),
          backgroundColor: scheme.onErrorContainer,
        ),
      );
    // Fluttertoast.showToast(
    //   msg: e is SocketException ? "No internet connection!" : "$e",
    //   backgroundColor: scheme.onErrorContainer,
    //   textColor: scheme.errorContainer,
    //   fontSize: 16,
    // );
  }

  void message(Object e) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$e', style: TextStyle(color: scheme.onInverseSurface)),
          backgroundColor: scheme.inverseSurface,
        ),
      );
    // Fluttertoast.showToast(
    //   msg: "$e",
    //   fontSize: 16,
    // );
  }
}

extension WidgetRefX on WidgetRef {
  // String get sellerId => read(sellerIdProvider);
  // String get iidw => watch(iidProvider);

  String imgUrl(String path) => path.startsWith('https://')
      ? path
      : ''
          // '${read(settingsProvider).value!.storageUrl}/$path'
          ''
          ;
}

extension StringX on String {
  String? get crim => trim().isEmpty ? null : trim();
  String get capitalize => this[0].toUpperCase() + substring(1);

  String get capLabel {
    final camelCaseSplit = replaceAllMapped(
      RegExp(r'(?<=[a-z])(?=[A-Z])'),
      (match) => ' ${match.group(0)}',
    );

    final capitalized = camelCaseSplit
        .split(' ')
        .map((word) {
          if (word.isEmpty) {
            return '';
          }
          if (word.length == 1) {
            return word[0].toUpperCase();
          }
          return word[0].toUpperCase() + word.substring(1);
        })
        .join(' ');

    return capitalized;
  }
}

extension IntNull on int {
  int? get crim => this == 0 ? null : this;
}

extension DoubleNull on double {
  double? get crim => this == 0 ? null : this;
}



extension XFileX on XFile {
  static const _mimeTypes = {
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.png': 'image/png',
    '.gif': 'image/gif',
    '.webp': 'image/webp',
    '.bmp': 'image/bmp',
    '.svg': 'image/svg+xml',
    '.pdf': 'application/pdf',
    '.doc': 'application/msword',
    '.docx':
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    '.xls': 'application/vnd.ms-excel',
    '.xlsx':
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    '.ppt': 'application/vnd.ms-powerpoint',
    '.pptx':
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    '.txt': 'text/plain',
    '.csv': 'text/csv',
    '.html': 'text/html',
    '.css': 'text/css',
    '.js': 'application/javascript',
    '.json': 'application/json',
    '.xml': 'application/xml',
    '.zip': 'application/zip',
    '.rar': 'application/vnd.rar',
    '.7z': 'application/x-7z-compressed',
    '.mp3': 'audio/mpeg',
    '.wav': 'audio/wav',
    '.mp4': 'video/mp4',
    '.mov': 'video/quicktime',
    '.avi': 'video/x-msvideo',
  };

  String get mimeType$ =>
      _mimeTypes[name.split('.').last] ?? 'application/octet-stream';
}


