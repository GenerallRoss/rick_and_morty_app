// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/data/api/character_api.dart' as _i7;
import 'package:news_app/data/repository/character_repository_impl.dart' as _i9;
import 'package:news_app/domain/repository/character_repository.dart' as _i8;
import 'package:news_app/domain/usecase/get_all_characters.dart' as _i10;
import 'package:news_app/domain/usecase/get_single_character.dart' as _i11;
import 'package:news_app/presentation/screens/character_single/bloc/character_single_bloc.dart'
    as _i12;
import 'package:news_app/presentation/screens/characters_list/bloc/characters_list_bloc.dart'
    as _i13;
import 'package:news_app/services/http/http_client.dart' as _i3;
import 'package:news_app/services/http/impl/dio_client.dart' as _i4;
import 'package:news_app/services/logger/impl/logger_impl.dart' as _i6;
import 'package:news_app/services/logger/logger.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppHttpClient>(_i4.DioImpl());
    gh.factory<_i5.AppLogger>(() => _i6.MobileAppLogger());
    gh.factory<_i7.CharacterApi>(
        () => _i7.CharacterApi(gh<_i3.AppHttpClient>()));
    gh.factory<_i8.CharacterRepository>(() => _i9.CharacterRepositoryImpl(
          gh<_i7.CharacterApi>(),
          gh<_i5.AppLogger>(),
        ));
    gh.factory<_i10.GetAllCharactersUseCase>(
        () => _i10.GetAllCharactersUseCase(gh<_i8.CharacterRepository>()));
    gh.factory<_i11.GetSingleCharacterUseCase>(
        () => _i11.GetSingleCharacterUseCase(gh<_i8.CharacterRepository>()));
    gh.factoryParam<_i12.CharacterSingleBloc, int, dynamic>((
      _characterId,
      _,
    ) =>
        _i12.CharacterSingleBloc(
          gh<_i11.GetSingleCharacterUseCase>(),
          _characterId,
        ));
    gh.factory<_i13.CharactersListBloc>(
        () => _i13.CharactersListBloc(gh<_i10.GetAllCharactersUseCase>()));
    return this;
  }
}
