A logging wrapper for Flutter that provides a simple common interface allowing use of multiple loggers.

## Capabilities

Supports the following:

- Levels
    - All (0)
    - Info (1)
    - Error (2)
    - Warn (3)
    - Debug (4)
    - Trace (5)
    - Verbose (6)
    - Ability to set a maximum level
    - Default
        - In release build, via the kReleaseMode, only levels Warn or lower are available.
- Logging debuggers
    - Info
    - Error
    - Warn
    - Debug
    - Trace
    - Verbose

## Getting started

With Flutter:

```dart
$ flutter pub add logging_wrapper
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```dart
dependencies:
  loggerx: ^0.0.1
```

To use locally, place the library_wrapper plugin folder at the same level as your package, then directly to the pubspec.yaml add the following:

```dart
dependencies:
  logging_wrapper: 
    path: ../logging_wrapper
```
## Usage

In your main.dart, you should configure the logging_wrapper.

Import the logger package.

```dart
import 'package:logging_wrapper/logging.dart';
```

Set the override of the level as follows.

```dart
  Logger().level = Logger.levelError;
```

Initialize a logger wrapper, such as the 'print' logger (should not be used in production).

```dart
  Logger().register(LoggerPrint());
```

Use of the logging methods:

```dart
import 'package:logging_wrapper/logging.dart';
```

- Info
```dart
Logger().i(String clazz, String method, String message);
Logger().i2(String message);
```
- Error
```dart
Logger().e(String clazz, String method, Object? exception);
Logger().eM(String clazz, String method, String message);
```
- Warn
```dart
Logger().w(String clazz, String method, Object? exception);
Logger().wM(String clazz, String method, String message);
```
- Debug
```dart
Logger().d(String clazz, String method, String message);
Logger().dV(String clazz, String method, String property, Object? value);
Logger().dVf(String clazz, String method, String property, Function value);
```
- Trace
```dart
Logger().t(String clazz, String method, String message);
Logger().tV(String clazz, String method, String property, Object? value);
Logger().tVf(String clazz, String method, String property, Function value);
```
- Verbose
```dart
Logger().v(String clazz, String method, String message);
Logger().vV(String clazz, String method, String property, Object? value);
Logger().vVf(String clazz, String method, String property, Function value);
```
