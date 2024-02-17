import 'package:news_app/domain/core/failure/failure.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:dartz/dartz.dart';

/// Репозиторий для запроса персонажей
abstract interface class CharacterRepository {
  /// Получить список персонажей
  Future<Either<Failure, (List<Character>, int?)>> getAllCharacters(
      [int? page]);

  /// Получить конкретного персонажа
  Future<Either<Failure, CharacterExpanded>> getSingleCharacter(int id);

  /// Лайкнуть персонажа
  Future<Either<Failure, bool>> likeCharacter(int id, bool isLike);
}
