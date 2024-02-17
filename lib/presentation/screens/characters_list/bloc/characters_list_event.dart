part of 'characters_list_bloc.dart';

abstract class CharactersListEvent extends Equatable {
  const CharactersListEvent();
}

class GetCharacters extends CharactersListEvent {
  @override
  List<Object?> get props => [];
}

class RunPagination extends CharactersListEvent {
  final int page;

  const RunPagination(this.page);

  @override
  List<Object?> get props => [page];
}
