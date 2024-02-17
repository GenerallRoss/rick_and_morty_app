part of 'characters_list_bloc.dart';

sealed class CharactersListState extends Equatable {
  const CharactersListState();
}

class LoadingState extends CharactersListState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CharactersListState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessState extends CharactersListState {
  final List<Character> characters;
  final int? paginationPage;

  const SuccessState(this.characters, this.paginationPage);

  @override
  List<Object?> get props => [characters, paginationPage];
}
