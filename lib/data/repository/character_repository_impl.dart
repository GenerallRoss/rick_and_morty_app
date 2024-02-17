import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/character_api.dart';
import 'package:news_app/data/dto/character_dto.dart';
import 'package:news_app/domain/core/failure/failure.dart';
import 'package:news_app/domain/core/failure/failure_parsing.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/domain/repository/character_repository.dart';
import 'package:news_app/services/logger/logger.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApi _api;
  final AppLogger _logger;

  const CharacterRepositoryImpl(this._api, this._logger);

  @override
  Future<Either<Failure, (List<Character>, int?)>> getAllCharacters(
      [int? page]) async {
    final response = await _api.getCharacterList(page);
    return response.fold(
      (l) {
        _logger.api(message: l.message);
        return Left(l);
      },
      (r) {
        try {
          final result = CharacterDto.fromJsonList(r['results']);
          final nextPageData = r["info"]?["next"];
          int? nextPage;
          if (nextPageData != null) {
            nextPage =
                int.parse(Uri.parse(nextPageData!).queryParameters['page']!);
          }

          return Right((result, nextPage));
        } catch (err, trc) {
          _logger.parsing(error: err, trc: trc);
          return Left(FailureParsing(err.toString()));
        }
      },
    );
  }

  @override
  Future<Either<Failure, CharacterExpanded>> getSingleCharacter(int id) async {
    final response = await _api.getSingleCharacter(id);
    return response.fold(
      (l) {
        _logger.api(message: l.message);
        return Left(l);
      },
      (r) {
        try {
          final result = CharacterExpandedDto.fromJson(r);
          return Right(result);
        } catch (err, trc) {
          _logger.parsing(error: err, trc: trc);
          return Left(FailureParsing(err.toString()));
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> likeCharacter(int id, bool isLike) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }
}
