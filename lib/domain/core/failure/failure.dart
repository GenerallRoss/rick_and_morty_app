/// Ошибка при получении данных
abstract class Failure {
  /// Сообщение ошибки
  final String message;

  /// Стактрейс вызова ошибки
  final StackTrace? stackTrace;

  const Failure(this.message, {this.stackTrace});

  @override
  String toString() {
    return message;
  }
}
