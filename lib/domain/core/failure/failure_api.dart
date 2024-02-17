import 'failure.dart';

/// Ошибка связанная с бэком
class FailureApi extends Failure {
  /// Код ошибки
  final int? statusCode;

  /// Текст ошибки
  final List<String>? bodyText;

  FailureApi(
    super.message, {
    super.stackTrace,
    this.statusCode,
    this.bodyText,
  });

  @override
  String toString() {
    return super.message;
  }
}
