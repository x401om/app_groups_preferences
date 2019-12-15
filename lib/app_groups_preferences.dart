import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AppGroupsPreferences {
  static const MethodChannel _channel = const MethodChannel('app_groups_preferences');

  static void setDouble(String group, String key, double value) {
    if (!Platform.isIOS || value == null) return;

    final params = Map<String, dynamic>();
    params['group'] = group;
    params['key'] = key;
    params['value'] = value;

    _channel.invokeMethod('setDouble', params);
  }

  static Future<String> getString(String group, String key) async {
    if (!Platform.isIOS) return null;

    final params = Map<String, dynamic>();
    params['group'] = group;
    params['key'] = key;
    final String value = await _channel.invokeMethod('getString', params);
    return value;
  }
}
