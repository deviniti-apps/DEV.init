import 'dart:async';
import 'dart:developer' as developer_log;

import 'package:logging/logging.dart';

/// Log message at level [Level.FINEST].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logFinest(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.finest(message, error, stackTrace);

/// Log message at level [Level.FINER].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logFiner(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.finer(message, error, stackTrace);

/// Log message at level [Level.FINE].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logFine(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.fine(message, error, stackTrace);

/// Log message at level [Level.CONFIG].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logConfig(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.config(message, error, stackTrace);

/// Log message at level [Level.INFO].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logInfo(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.info(message, error, stackTrace);

/// Log message at level [Level.WARNING].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logWarning(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.warning(message, error, stackTrace);

/// Log message at level [Level.SEVERE].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logSevere(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.severe(message, error, stackTrace);

/// Log message at level [Level.SHOUT].
///
/// See [log] for information on how non-String [message] arguments are
/// handled.
void logShout(Object? message, [Object? error, StackTrace? stackTrace]) =>
    AppLogger.instance().logger.shout(message, error, stackTrace);

class AppLogger {
  static const int levelAll = 0;
  static const int levelSevere = 8;

  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger.instance() {
    return _instance;
  }

  AppLogger._internal();

  final Logger logger = Logger('AppLogger');

  void configure({required int level}) {
    Logger.root.level = Level.LEVELS[level];
  }

  void output(Function(LogEntry entry) onEntry) {
    Logger.root.onRecord.listen(
      (record) {
        onEntry(record.toLogEntry());
      },
    );
  }

  void enableConsoleOutput() {
    output(
      (entry) {
        developer_log.log(
          '${entry.levelName}: ${entry.time}: ${entry.message}',
          error: entry.error,
          stackTrace: entry.stackTrace,
        );
      },
    );
  }
}

class LogEntry {
  const LogEntry({
    required this.levelValue,
    required this.levelName,
    required this.message,
    required this.object,
    required this.loggerName,
    required this.time,
    required this.sequenceNumber,
    required this.error,
    required this.stackTrace,
    required this.zone,
  });

  final int levelValue;

  final String levelName;

  final String message;

  /// Non-string message passed to Logger.
  final Object? object;

  /// Logger where this record is stored.
  final String loggerName;

  /// Time when this record was created.
  final DateTime time;

  /// Unique sequence number greater than all log records created before it.
  final int sequenceNumber;

  /// Associated error (if any) when recording errors messages.
  final Object? error;

  /// Associated stackTrace (if any) when recording errors messages.
  final StackTrace? stackTrace;

  /// Zone of the calling code which resulted in this LogRecord.
  final Zone? zone;
}

extension _LogRecord on LogRecord {
  LogEntry toLogEntry() {
    return LogEntry(
      levelValue: level.value,
      levelName: level.name,
      message: message,
      object: object,
      loggerName: loggerName,
      time: time,
      sequenceNumber: sequenceNumber,
      error: error,
      stackTrace: stackTrace,
      zone: zone,
    );
  }
}
