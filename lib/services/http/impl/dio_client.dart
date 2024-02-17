import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/config.dart';
import 'package:news_app/domain/core/failure/failure_api.dart';
import 'package:news_app/domain/core/failure/failure_unknown.dart';
import 'package:news_app/gen/translations.g.dart';

import '../http_client.dart';

@Singleton(as: AppHttpClient)
class DioImpl implements AppHttpClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: Config.api));

  Either<FailureApi, dynamic> _responseHandler(Response response) {
    final data = response.data;
    int statusCode = response.statusCode ?? 0;

    return Either.cond(
      () => statusCode >= 200 && statusCode <= 299,
      () => data,
      () {
        try {
          return FailureApi(
            data['error'],
            statusCode: statusCode,
            bodyText: data['data']
                ?.map<String>((e) => '${e['title']}: ${e['text']}')
                .toList(),
          );
        } catch (_) {
          return FailureApi(t.errors.somethingWentWrong);
        }
      },
    );
  }

  ApiResponse _errorHandler(DioException err) async {
    if (err.type == DioExceptionType.unknown ||
        err.type == DioExceptionType.connectionError) {
      return Left(FailureApi(t.errors.noConnect));
    }
    if (err.response != null) {
      return _responseHandler(err.response!);
    }
    return Left(FailureApi(err.toString()));
  }

  @override
  ApiResponse get({
    required String uri,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );
      return _responseHandler(response);
    } on DioException catch (err) {
      return _errorHandler(err);
    } catch (err, str) {
      return Left(FailureUnknown(err.toString(), stackTrace: str));
    }
  }
}
