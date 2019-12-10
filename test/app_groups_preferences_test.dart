import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_groups_preferences/app_groups_preferences.dart';

void main() {
  const MethodChannel channel = MethodChannel('app_groups_preferences');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AppGroupsPreferences.platformVersion, '42');
  });
}
