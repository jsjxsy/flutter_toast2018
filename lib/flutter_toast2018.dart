import 'dart:async';

import 'package:flutter/services.dart';


class FlutterToast2018 {
  static const MethodChannel _channel =
      const MethodChannel('flutter_toast2018');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}




enum ToastDuration {
  short, long
}

class FlutterToast {
  // 这里的名字要跟 Java 端的对应
  static const MethodChannel _channel = const MethodChannel('flutter_toast2018');

  static Future<bool> toast(String msg, ToastDuration duration) async {
    var argument = {
      'content': msg,
      'duration': duration.toString()
    };
    // 本地方法是一个异步调用。'toast' 对应我们在前面 Java 代码的 onMethodCall
    // 方法里面处理的方法名
    var success = await _channel.invokeMethod('toast', argument);
    return success;
  }
}
