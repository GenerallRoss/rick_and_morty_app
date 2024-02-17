import 'package:injectable/injectable.dart';
import 'package:news_app/services/http/http_client.dart';

@injectable
class CharacterApi {
  final AppHttpClient _httpClient;

  const CharacterApi(this._httpClient);

  ApiResponse getCharacterList([int? page]) {
    return _httpClient.get(uri: "character", queryParameters: {
      if (page != null) "page": page,
    });
  }

  ApiResponse getSingleCharacter(int id) {
    return _httpClient.get(uri: "character/$id");
  }
}
