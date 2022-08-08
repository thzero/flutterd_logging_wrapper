import 'package:flutter_library_logging_wrapper/logger_base.dart';

class LoggerPrint extends LoggerBase {
  @override
  initialize() {}

  @override
  d(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }

  @override
  dV(String clazz, String method, String property, Object? value) {
    print(format3(clazz, method, property, value));
  }

  @override
  e(String clazz, String method, Object ex) {
    print(format2(clazz, method, ex));
  }

  @override
  eM(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }

  @override
  i(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }

  @override
  i2(String message) {
    print(message);
  }

  @override
  t(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }

  @override
  tV(String clazz, String method, String property, Object? value) {
    print(format3(clazz, method, property, value));
  }

  @override
  v(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }

  @override
  vV(String clazz, String method, String property, Object? value) {
    print(format3(clazz, method, property, value));
  }

  @override
  w(String clazz, String method, Object ex) {
    print(format2(clazz, method, ex));
  }

  @override
  wM(String clazz, String method, String message) {
    print(format(clazz, method, message));
  }
}
