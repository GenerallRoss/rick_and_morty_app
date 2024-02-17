import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/scroll_view/scroll_view.dart';

import 'bloc/character_single_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'views/success.dart';
part 'views/error.dart';
part 'views/loading.dart';

class CharacterSingleView extends StatelessWidget {
  const CharacterSingleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterSingleBloc, CharacterSingleState>(
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
