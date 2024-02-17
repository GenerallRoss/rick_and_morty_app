abstract interface class AppLogger {
  /// Логирование ошибок парсинга
  void parsing({String? message, required StackTrace trc, Object? error});

  /// Логирование ошибок с бэка
  void api({String? message, StackTrace? trc, Object? error});

  /// Логирование прочих ошибок
  void unknown(
      {required String message, required StackTrace trc, Object? error});

  /// Логирование информации
  void info({required String message, StackTrace? trc, Object? error});
}
