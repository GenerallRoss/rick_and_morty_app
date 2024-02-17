import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/core/failure/failure.dart';
import 'package:news_app/domain/repository/character_repository.dart';

@injectable
class LikeCharacterUseCase {
  final CharacterRepository _repository;

  const LikeCharacterUseCase(this._repository);

  Future<Either<Failure, bool>> call(int id, bool isLike) {
    return _repository.likeCharacter(id, isLike);
  }
}
