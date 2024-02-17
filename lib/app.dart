import 'package:flutter/material.dart';
import 'package:news_app/services/routing/router_config.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouterConfig();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
