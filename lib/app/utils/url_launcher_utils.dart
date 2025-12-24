import 'package:substore_assistant/app/runtime/return_result.dart';
import 'package:substore_assistant/app/utils/log.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<ReturnResultError?> loadUrl(String url) async {
    try {
      bool ret = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(),
      );
      return ret ? null : ReturnResultError("launchUrl failed $url");
    } catch (err, _) {
      Log.w('UrlLauncherUtils.loadUrl exception: $url\n ${err.toString()}');
      return ReturnResultError(err.toString());
    }
  }
}
