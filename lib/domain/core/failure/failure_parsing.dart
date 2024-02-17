import 'failure.dart';

/// Ошибка, связанная с парсингом данных
class FailureParsing extends Failure {
  FailureParsing(super.message, {super.stackTrace});

  @override
  String toString() {
    return super.message;
  }
}
