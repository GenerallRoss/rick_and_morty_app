import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/domain/usecase/get_single_character.dart';

part 'character_single_event.dart';
part 'character_single_state.dart';

@injectable
class CharacterSingleBloc
    extends Bloc<CharacterSingleEvent, CharacterSingleState> {
  final GetSingleCharacterUseCase _useCase;
  final int _characterId;

  CharacterSingleBloc(this._useCase, @factoryParam this._characterId)
      : super(LoadingState()) {
    on<GetCharacter>(_getCharacterHandler);
  }

  FutureOr<void> _getCharacterHandler(
    GetCharacter event,
    Emitter<CharacterSingleState> emit,
  ) async {
    emit(LoadingState());
    final response = await _useCase(_characterId);
    response.fold(
      (l) => emit(ErrorState(l.message)),
      (r) => emit(SuccessState(r)),
    );
  }
}
