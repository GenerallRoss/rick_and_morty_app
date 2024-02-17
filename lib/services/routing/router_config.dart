import 'package:auto_route/auto_route.dart';
import 'router_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouterConfig extends $AppRouterConfig {
  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(page: InitialRoute.page, path: "/", initial: true),
        CupertinoRoute(page: CharacterListRoute.page, path: "/character_list"),
        CupertinoRoute(page: CharacterSingleRoute.page, path: "/character:id")
      ];
}
