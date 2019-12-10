import 'dart:async';

import 'package:flutter/services.dart';

class AppGroupsPreferences {
  static const MethodChannel _channel =
      const MethodChannel('app_groups_preferences');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
