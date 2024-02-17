import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../logger.dart';

@Injectable(as: AppLogger)
class MobileAppLogger implements AppLogger {
  /// Логирование ошибок парсинга
  @override
  parsing({required StackTrace trc, String? message, Object? error}) {
    if (kDebugMode) {
      Logger().e(
        message ?? 'Ошибка парсинга',
        stackTrace: trc,
        error: error,
        time: DateTime.now(),
      );
    }
  }

  /// Логирование ошибок с бэка
  @override
  api({StackTrace? trc, String? message, Object? error}) {
    if (kDebugMode) {
      Logger().f(
        message ?? 'Ошибка с бэка',
        stackTrace: trc,
        error: error,
        time: DateTime.now(),
      );
    }
  }

  /// Логирование прочих ошибок
  @override
  unknown({required String message, required StackTrace trc, Object? error}) {
    if (kDebugMode) {
      Logger().w(message, stackTrace: trc, error: error);
    }
  }

  @override
  void info({required String message, StackTrace? trc, Object? error}) {
    if (kDebugMode) {
      Logger().i(message, stackTrace: trc, error: error);
    }
  }
}
