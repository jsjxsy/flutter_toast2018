import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toast2018/flutter_toast2018.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_toast2018');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterToast2018.platformVersion, '42');
  });
}
