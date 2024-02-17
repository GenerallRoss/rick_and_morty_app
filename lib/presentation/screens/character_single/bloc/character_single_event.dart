part of 'character_single_bloc.dart';

abstract class CharacterSingleEvent extends Equatable {
  const CharacterSingleEvent();
}

class GetCharacter extends CharacterSingleEvent {
  const GetCharacter();

  @override
  List<Object?> get props => [];
}
