import 'dart:convert';
import 'package:flutter_desktop_demo/home/models/character.dart';
import 'package:flutter_desktop_demo/home/repository/home_api_repository.dart';
import 'package:http/http.dart';

class HomeController {
  final homeApiRepository = HomeApiRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    Response response = await homeApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      for (var element in charactersResults) {
        response = await homeApiRepository.getCharactersByName(element["name"]);
        dataFromAPI = jsonDecode(response.body);
        characters.add(CharacterDTO.fromJson(dataFromAPI));
      }

      characters = charactersResults.map((character) {
        return CharacterDTO.fromJson(character);
      }).toList();
    }
    return characters;
  }
}

final homecontroller = HomeController();
