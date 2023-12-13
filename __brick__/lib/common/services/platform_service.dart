import 'package:{{ projectName }}/common_libs.dart';
import 'package:flutter/foundation.dart';

class PlatformService {
  static double get pixelRatio => WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
}
