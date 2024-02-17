import 'failure.dart';

/// Неизвестная ошибка
class FailureUnknown extends Failure {
  FailureUnknown(super.message, {super.stackTrace});

  @override
  String toString() {
    return super.message;
  }
}
