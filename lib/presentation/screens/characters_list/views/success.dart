part of '../characters_list_view.dart';

class _SuccessView extends StatelessWidget {
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CharactersListBloc>();
    final state = bloc.state as SuccessState;
    final characters = state.characters;

    return AppScrollView(
      onPagination: bloc.runPagination,
      onRefresh: () async => bloc.add(GetCharacters()),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: characters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, index) => CharacterCard(
          key: ValueKey(characters[index]),
          character: characters[index],
        ),
      ),
    );
  }
}
