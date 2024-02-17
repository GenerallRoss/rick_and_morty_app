import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/screens/characters_list/widgets/character_card/character_card.dart';
import 'package:news_app/presentation/widgets/scroll_view/scroll_view.dart';

import 'bloc/characters_list_bloc.dart';

part 'views/success.dart';
part 'views/loading.dart';
part 'views/error.dart';

class CharactersListView extends StatelessWidget {
  const CharactersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharactersListBloc, CharactersListState>(
        builder: (_, state) {
          return switch (state) {
            LoadingState() => const _LoadingView(),
            ErrorState() => const _ErrorView(),
            SuccessState() => const _SuccessView(),
          };
        },
      ),
    );
  }
}
