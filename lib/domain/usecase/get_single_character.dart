import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/core/failure/failure.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/domain/repository/character_repository.dart';

/// UseCase Для получения конкретного персонажа
@injectable
class GetSingleCharacterUseCase {
  final CharacterRepository _repository;

  const GetSingleCharacterUseCase(this._repository);

  Future<Either<Failure, CharacterExpanded>> call(int id) =>
      _repository.getSingleCharacter(id);
}
