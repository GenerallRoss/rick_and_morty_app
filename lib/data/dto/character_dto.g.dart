// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) => CharacterDto(
      id: json['id'] as int,
      name: json['name'] as String,
      xStatus: CharacterDto._statusFromJson(json['status'] as String),
      xOrigin:
          CharacterDto._originFromJson(json['origin'] as Map<String, dynamic>),
      image: json['image'] as String,
    );

CharacterExpandedDto _$CharacterExpandedDtoFromJson(
        Map<String, dynamic> json) =>
    CharacterExpandedDto(
      created: DateTime.parse(json['created'] as String),
      species: json['species'] as String,
      xLocation: CharacterExpandedDto._locationFromJson(
          json['location'] as Map<String, dynamic>),
      xGender: CharacterExpandedDto._genderFromJson(json['gender'] as String),
      id: json['id'] as int,
      name: json['name'] as String,
      xStatus: CharacterDto._statusFromJson(json['status'] as String),
      xOrigin:
          CharacterDto._originFromJson(json['origin'] as Map<String, dynamic>),
      image: json['image'] as String,
    );
