import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbarinfoplugin/flutterbarinfoplugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutterbarinfoplugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Flutterbarinfoplugin.platformVersion, '42');
  });
}
