import 'package:flutter/material.dart';
import 'package:substore_assistant/app/runtime/return_result.dart';
import 'package:substore_assistant/app/utils/system_scheme_utils.dart';

class SchemeHandler {
  static void Function(bool, bool)? onStart;
  static void Function(bool)? onStop;

  static Future<ReturnResultError?> handle(
      BuildContext context, String url) async {
    //substoreAssistant://start?open-substore=true&background=true
    //substoreAssistant://stop?background=true
    Uri? uri = Uri.tryParse(url);
    if (uri == null) {
      return ReturnResultError("parse url failed: $url");
    }
    if (uri.isScheme(SystemSchemeUtils.getScheme())) {
      if (uri.host == "start") {
        bool background = false;
        bool opensubstore = false;
        try {
          background = uri.queryParameters["background"] == "true";
          opensubstore = uri.queryParameters["open-substore"] == "true";
        } catch (err) {}
        onStart!.call(opensubstore, background);
      } else if (uri.host == "stop") {
        if (onStop != null) {
          bool background = false;
          try {
            background = uri.queryParameters["background"] == "true";
          } catch (err) {}
          onStop!.call(background);
        }
        return null;
      }
    }

    return ReturnResultError("unsupport scheme: ${uri.scheme}");
  }
}
