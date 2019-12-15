#import "AppGroupsPreferencesPlugin.h"

@implementation AppGroupsPreferencesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"app_groups_preferences"
            binaryMessenger:[registrar messenger]];
  AppGroupsPreferencesPlugin* instance = [[AppGroupsPreferencesPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"setDouble" isEqualToString:call.method]) {
      NSDictionary *arguments = call.arguments;
      NSString *group = arguments[@"group"];
      NSString *key = arguments[@"key"];
      NSNumber *value = arguments[@"value"];
      
      NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:group];
      [defaults setDouble:value.doubleValue forKey:key];
      [defaults synchronize];
      result(nil);
  } if ([@"getString" isEqualToString:call.method]) {
      NSDictionary *arguments = call.arguments;
      NSString *group = arguments[@"group"];
      NSString *key = arguments[@"key"];

      NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:group];
      NSString *value = [defaults stringForKey:key];
      result(value);
  } else {
    result(FlutterMethodNotImplemented);
  }

}

@end
