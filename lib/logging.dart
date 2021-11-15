library logging_wrapper;

import 'package:flutter/foundation.dart';

import 'logger_base.dart';

typedef LoggerValueF = String Function();

class Logger {
  static final Logger _instance = Logger._internal();
  static final List<LoggerBase> _loggers = [];

  static const int levelAll = 0;
  static const int levelInfo = 1;
  static const int levelWarn = 2;
  static const int levelError = 3;
  static const int levelDebug = 4;
  static const int levelTrace = 5;
  static const int levelVerbose = 6;

  static final List<int> _levels = [];
  int _currentLevel = levelAll;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Logger() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Logger._internal() {
    // initialization logic

    if (kReleaseMode) {
      _levels.add(levelAll);
      _levels.add(levelInfo);
      _levels.add(levelWarn);
      _levels.add(levelError);
      return;
    }

    _levels.add(levelAll);
    _levels.add(levelInfo);
    _levels.add(levelWarn);
    _levels.add(levelError);
    _levels.add(levelDebug);
    _levels.add(levelTrace);
    _levels.add(levelVerbose);
  }

  get currentLevel {
    if (kReleaseMode) {
      if (_currentLevel > levelError) {
        return levelError;
      }

      return _currentLevel;
    }

    return _currentLevel;
  }

  set level(int value) {
    _currentLevel = value;
  }

  register(LoggerBase logger) {
    logger.initialize();
    _loggers.add(logger);
  }

  d(String clazz, String method, String message) {
    if (currentLevel > levelDebug) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].d(clazz, method, message);
    }
  }

  dV(String clazz, String method, String property, Object? value) {
    if (currentLevel > levelDebug) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].dV(clazz, method, property, value);
    }
  }

  dVf(String clazz, String method, String property, LoggerValueF value) {
    if (currentLevel > levelDebug) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].dV(clazz, method, property, value());
    }
  }

  dVf2(String clazz, String method, Function value) {
    if (currentLevel > levelDebug) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].dV(clazz, method, '', value());
    }
  }

  e(String clazz, String method, Object ex) {
    if (currentLevel > levelError) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].e(clazz, method, ex);
    }
  }

  eM(String clazz, String method, String message) {
    if (currentLevel > levelError) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].eM(clazz, method, message);
    }
  }

  i(String clazz, String method, String message) {
    if (currentLevel > levelInfo) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].i(clazz, method, message);
    }
  }

  i2(String message) {
    if (currentLevel > levelInfo) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].i2(message);
    }
  }

  t(String clazz, String method, String message) {
    if (currentLevel > levelTrace) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].t(clazz, method, method);
    }
  }

  tV(String clazz, String method, String property, Object? value) {
    if (currentLevel > levelTrace) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].tV(clazz, method, property, value);
    }
  }

  tVf(String clazz, String method, String property, LoggerValueF value) {
    if (currentLevel > levelTrace) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].tV(clazz, method, property, value());
    }
  }

  v(String clazz, String method, String message) {
    if (currentLevel > levelVerbose) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].v(clazz, method, method);
    }
  }

  vV(String clazz, String method, String property, Object? value) {
    if (currentLevel > levelVerbose) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].vV(clazz, method, property, value);
    }
  }

  vVf(String clazz, String method, String property, LoggerValueF value) {
    if (currentLevel > levelVerbose) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].vV(clazz, method, property, value());
    }
  }

  w(String clazz, String method, Object ex) {
    if (currentLevel > levelWarn) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].w(clazz, method, ex);
    }
  }

  wM(String clazz, String method, String message) {
    if (currentLevel > levelWarn) {
      return;
    }

    int length = _loggers.length;
    for (int i = 0; i < length; i++) {
      _loggers[i].wM(clazz, method, method);
    }
  }
}
