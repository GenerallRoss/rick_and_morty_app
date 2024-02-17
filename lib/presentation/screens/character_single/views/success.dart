part of '../character_single_view.dart';

class _SuccessView extends StatelessWidget {
  const _SuccessView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CharacterSingleBloc>();
    final state = bloc.state as SuccessState;
    final character = state.character;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SafeArea(
            child: AppScrollView(
              onRefresh: () async => bloc.add(const GetCharacter()),
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: character.image),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _rowItem("Name", character.name),
                        const SizedBox(height: 8),
                        _rowItem("Gender", character.gender.name),
                        const SizedBox(height: 8),
                        _rowItem("Status", character.status.name),
                        const SizedBox(height: 8),
                        _rowItem("Origin", character.origin),
                        const SizedBox(height: 8),
                        _rowItem("Species", character.species),
                        const SizedBox(height: 8),
                        _rowItem("Created", character.created.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
