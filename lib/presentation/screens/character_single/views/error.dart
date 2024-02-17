part of '../character_single_view.dart';

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CharacterSingleBloc>();
    final state = bloc.state as ErrorState;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(state.message)),
        ElevatedButton(
            onPressed: () => bloc.add(const GetCharacter()),
            child: const Text("Повторить"))
      ],
    );
  }
}
