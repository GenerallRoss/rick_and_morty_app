// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:news_app/presentation/screens/character_single/character_single_screen.dart'
    as _i2;
import 'package:news_app/presentation/screens/characters_list/characters_list_screen.dart'
    as _i1;
import 'package:news_app/presentation/screens/initial/initial_screen.dart'
    as _i3;

abstract class $AppRouterConfig extends _i4.RootStackRouter {
  $AppRouterConfig({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CharacterListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CharacterListScreen(),
      );
    },
    CharacterSingleRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CharacterSingleRouteArgs>(
          orElse: () =>
              CharacterSingleRouteArgs(characterId: pathParams.getInt('id')));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CharacterSingleScreen(
          args.characterId,
          key: args.key,
        ),
      );
    },
    InitialRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InitialScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterListScreen]
class CharacterListRoute extends _i4.PageRouteInfo<void> {
  const CharacterListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CharacterListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CharacterSingleScreen]
class CharacterSingleRoute extends _i4.PageRouteInfo<CharacterSingleRouteArgs> {
  CharacterSingleRoute({
    required int characterId,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CharacterSingleRoute.name,
          args: CharacterSingleRouteArgs(
            characterId: characterId,
            key: key,
          ),
          rawPathParams: {'id': characterId},
          initialChildren: children,
        );

  static const String name = 'CharacterSingleRoute';

  static const _i4.PageInfo<CharacterSingleRouteArgs> page =
      _i4.PageInfo<CharacterSingleRouteArgs>(name);
}

class CharacterSingleRouteArgs {
  const CharacterSingleRouteArgs({
    required this.characterId,
    this.key,
  });

  final int characterId;

  final _i5.Key? key;

  @override
  String toString() {
    return 'CharacterSingleRouteArgs{characterId: $characterId, key: $key}';
  }
}

/// generated route for
/// [_i3.InitialScreen]
class InitialRoute extends _i4.PageRouteInfo<void> {
  const InitialRoute({List<_i4.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
