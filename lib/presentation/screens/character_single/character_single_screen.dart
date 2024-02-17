import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/character_single_bloc.dart';
import 'character_single_view.dart';

@RoutePage()
class CharacterSingleScreen extends StatelessWidget {
  final int characterId;

  const CharacterSingleScreen(@PathParam('id') this.characterId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CharacterSingleBloc>(param1: characterId)
        ..add(const GetCharacter()),
      child: const CharacterSingleView(),
    );
  }
}
