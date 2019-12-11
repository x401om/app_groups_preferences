import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AppGroupsPreferences {
  static const MethodChannel _channel = const MethodChannel('app_groups_preferences');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void setDouble(String group, String key, double value) {
    if (!Platform.isIOS) return;

    final params = Map<String, dynamic>();
    params['group'] = group;
    params['key'] = key;
    if (value != null) {
      params['value'] = value;
    } else {
      params['remove'] = true;
    }

    _channel.invokeMethod('setDouble', params);
  }
}
