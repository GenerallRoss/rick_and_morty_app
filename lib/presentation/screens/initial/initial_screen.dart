import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/routing/router_config.gr.dart';

@RoutePage()
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _routeToList(BuildContext context) {
    AutoRouter.of(context).replace(const CharacterListRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => _routeToList(context),
            child: const Text("Начать!")),
      ),
    );
  }
}
