// ignore_for_file: unused_catch_stack

import 'dart:io' as io;

import 'package:archive/archive_io.dart';
import 'package:substore_assistant/app/runtime/return_result.dart';

class ZipUtils {
  static Future<ReturnResultError?> unzip(String zipPath, String dir) async {
    try {
      final bytes = await io.File(zipPath).readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        final filePath = "$dir/${file.name}";
        if (file.isFile) {
          final data = file.content as List<int>;
          await io.File(filePath).writeAsBytes(data, flush: true);
        } else {
          await io.Directory(filePath).create(recursive: true);
        }
      }
    } catch (err, stacktrace) {
      return ReturnResultError(err.toString());
    }

    return null;
  }
}
