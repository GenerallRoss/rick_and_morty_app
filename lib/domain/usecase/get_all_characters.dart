import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/core/failure/failure.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/domain/repository/character_repository.dart';

/// UseCase для получения списка персонажей
@injectable
class GetAllCharactersUseCase {
  final CharacterRepository _repository;

  const GetAllCharactersUseCase(this._repository);

  Future<Either<Failure, (List<Character>, int?)>> call([int? page]) =>
      _repository.getAllCharacters(page);
}
