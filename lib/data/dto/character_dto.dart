import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/domain/entities/character.dart';

part 'character_dto.g.dart';

@JsonSerializable(createToJson: false)
class CharacterDto extends Character {
  @JsonKey(fromJson: _statusFromJson, name: 'status')
  final Status xStatus;

  @JsonKey(fromJson: _originFromJson, name: 'origin')
  final String xOrigin;

  const CharacterDto({
    required super.id,
    required super.name,
    required this.xStatus,
    required this.xOrigin,
    required super.image,
  }) : super(status: xStatus, origin: xOrigin);

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  static List<Character> fromJsonList(List<dynamic> json) {
    return json.map((e) => CharacterDto.fromJson(e)).toList();
  }

  static Status _statusFromJson(String value) {
    return switch (value) {
      'Alive' => Status.alive,
      'Dead' => Status.dead,
      'unknown' => Status.unknown,
      String() => throw Exception(),
    };
  }

  static String _originFromJson(Map<String, dynamic> json) => json['name'];
}

@JsonSerializable(createToJson: false)
class CharacterExpandedDto extends CharacterExpanded {
  @JsonKey(fromJson: CharacterDto._statusFromJson, name: 'status')
  final Status xStatus;

  @JsonKey(fromJson: _genderFromJson, name: 'gender')
  final Gender xGender;

  @JsonKey(fromJson: CharacterDto._originFromJson, name: 'origin')
  final String xOrigin;

  @JsonKey(fromJson: _locationFromJson, name: 'location')
  final String xLocation;

  const CharacterExpandedDto({
    required super.created,
    required super.species,
    required this.xLocation,
    required this.xGender,
    required super.id,
    required super.name,
    required this.xStatus,
    required this.xOrigin,
    required super.image,
  }) : super(
          gender: xGender,
          origin: xOrigin,
          location: xLocation,
          status: xStatus,
        );

  factory CharacterExpandedDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterExpandedDtoFromJson(json);

  static String _locationFromJson(Map<String, dynamic> json) => json['name'];

  static Gender _genderFromJson(String value) {
    return switch (value) {
      'Female' => Gender.female,
      'Male' => Gender.male,
      'Genderless' => Gender.genderless,
      'unknown' => Gender.unknown,
      String() => throw Exception(),
    };
  }
}
