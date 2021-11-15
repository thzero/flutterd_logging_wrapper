abstract class LoggerBase {
  initialize();

  d(String clazz, String method, String message);
  dV(String clazz, String method, String property, Object? value);

  e(String clazz, String method, Object ex);
  eM(String clazz, String method, String message);

  i(String clazz, String method, String message);
  i2(String message);

  t(String clazz, String method, String message);
  tV(String clazz, String method, String property, Object? value);

  v(String clazz, String method, String message);
  vV(String clazz, String method, String property, Object? value);

  w(String clazz, String method, Object ex);
  wM(String clazz, String method, String message);

  format(String clazz, String method, String message) {
    return clazz + '.' + method + ': ' + message;
  }

  format2(String clazz, String method, Object ex) {
    return clazz + '.' + method + ': ' + ex.toString();
  }

  format3(String clazz, String method, String property, Object? value) {
    return clazz + '.' + method + ': ' + property + '=' + (value != null ? value.toString() : "null");
  }
}
