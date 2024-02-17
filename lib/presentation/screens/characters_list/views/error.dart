part of '../characters_list_view.dart';

class _ErrorView extends StatelessWidget {
  const _ErrorView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CharactersListBloc>();
    final state = bloc.state as ErrorState;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(state.message)),
        ElevatedButton(
            onPressed: () => bloc.add(GetCharacters()),
            child: const Text("Повторить"))
      ],
    );
  }
}
