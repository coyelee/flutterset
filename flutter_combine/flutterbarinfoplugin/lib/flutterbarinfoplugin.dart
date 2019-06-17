import 'dart:async';

import 'package:flutter/services.dart';

class Flutterbarinfoplugin {
  static const MethodChannel _channel =
      const MethodChannel('flutterbarinfoplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get enterForum async {
    await _channel.invokeMethod('getEnterForum');
    return "lichengwu";
  }

  static Future<List> get barPics async {
    final List barPics =  await _channel.invokeMethod('getBarPics');
    return barPics;
  }

  static Future<List> get barNames async {
    final List barPics =  await _channel.invokeMethod('getBarNames');
    return barPics;
  }

  static Future<List> get barDes async {
    final List barPics =  await _channel.invokeMethod('getBarDes');
    return barPics;
  }

  static Future<List> get barLevels async {
    final List barPics =  await _channel.invokeMethod('getBarLevels');
    return barPics;
  }
}
