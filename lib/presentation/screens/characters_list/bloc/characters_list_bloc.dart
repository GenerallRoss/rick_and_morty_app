import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/domain/usecase/get_all_characters.dart';

part 'characters_list_event.dart';
part 'characters_list_state.dart';

@injectable
class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  final GetAllCharactersUseCase _useCase;

  CharactersListBloc(this._useCase) : super(LoadingState()) {
    on<GetCharacters>(_getAllCharacter);
    on<RunPagination>(_getPagination);
  }

  FutureOr<void> _getAllCharacter(
    GetCharacters event,
    Emitter<CharactersListState> emit,
  ) async {
    emit(LoadingState());
    final result = await _useCase();
    result.fold(
      (l) => emit(ErrorState(l.message)),
      (r) => emit(SuccessState(r.$1, r.$2)),
    );
  }

  void runPagination() {
    if (_isPaginationRunning) return;
    if (state is! SuccessState) return;
    if ((state as SuccessState).paginationPage == null) return;

    add(RunPagination((state as SuccessState).paginationPage!));
  }

  bool _isPaginationRunning = false;

  FutureOr<void> _getPagination(
    RunPagination event,
    Emitter<CharactersListState> emit,
  ) async {
    _isPaginationRunning = true;

    final currentState = state as SuccessState;
    final nextPage = currentState.paginationPage!;
    final result = await _useCase(nextPage);
    if (result.isRight()) {
      result.map((r) {
        final newCharacters = currentState.characters.map((e) => e).toList();
        newCharacters.addAll(r.$1);
        emit(SuccessState(newCharacters, r.$2));
      });
    }
    _isPaginationRunning = false;
  }
}
