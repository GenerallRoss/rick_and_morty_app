part of 'character_single_bloc.dart';

sealed class CharacterSingleState extends Equatable {
  const CharacterSingleState();
}

class LoadingState extends CharacterSingleState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CharacterSingleState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessState extends CharacterSingleState {
  final CharacterExpanded character;

  const SuccessState(this.character);

  @override
  List<Object> get props => [character];
}
