import 'package:equatable/equatable.dart';

/// Статус персонажа
enum Status {
  /// Жив
  alive,

  /// Мёртв
  dead,

  /// Неизвестно
  unknown
}

/// Пол персонажа
enum Gender {
  /// Мужчина
  male,

  /// Женщина
  female,

  /// Без пола
  genderless,

  /// Неизвестно
  unknown
}

/// Персонаж
class Character extends Equatable {
  /// ID
  final int id;

  /// Имя
  final String name;

  /// Статус
  final Status status;

  /// Происхождение
  final String origin;

  /// Изображение персонажа
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.origin,
    required this.image,
  });

  @override
  List<Object?> get props => [id];
}

/// Расширенная сущность персонажа
class CharacterExpanded extends Character {
  /// Разновидность (человек, гуманоид и т.д.)
  final String species;

  /// Дата создания персонажа
  final DateTime created;

  /// Локация персонажа
  final String location;

  /// Пол персонажа
  final Gender gender;

  const CharacterExpanded({
    required this.species,
    required this.created,
    required this.location,
    required this.gender,
    required super.id,
    required super.name,
    required super.status,
    required super.origin,
    required super.image,
  });
}
