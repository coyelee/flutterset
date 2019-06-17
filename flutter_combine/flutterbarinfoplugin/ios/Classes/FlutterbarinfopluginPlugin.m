#import "FlutterbarinfopluginPlugin.h"
#import <flutterbarinfoplugin/flutterbarinfoplugin-Swift.h>

@implementation FlutterbarinfopluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterbarinfopluginPlugin registerWithRegistrar:registrar];
}
@end
