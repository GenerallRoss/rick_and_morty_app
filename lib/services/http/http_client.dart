import 'package:dartz/dartz.dart';
import 'package:news_app/domain/core/failure/failure.dart';

/// Ответ с АПИ запроса
typedef ApiResponse = Future<Either<Failure, dynamic>>;

/// Интерфес клиента HTTP запросов
abstract interface class AppHttpClient {
  /// GET-запрос
  ApiResponse get({
    required String uri,
    Map<String, dynamic>? queryParameters,
  });
}
