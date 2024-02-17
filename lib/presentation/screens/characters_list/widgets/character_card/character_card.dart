import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/character.dart';
import 'package:news_app/services/routing/router_config.gr.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({required this.character, super.key});

  void _toSingleNews(BuildContext context) {
    context.pushRoute(CharacterSingleRoute(characterId: character.id));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return TextButton(
        onPressed: () => _toSingleNews(context),
        child: Container(
          color: Colors.black.withOpacity(0.12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: character.image,
                width: constraints.maxWidth * 0.3,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${character.name}"),
                    const SizedBox(height: 8),
                    Text("Origin: ${character.origin}"),
                    const SizedBox(height: 8),
                    Text("Status: ${character.status.name}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
