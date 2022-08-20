import 'package:http/http.dart' as http;

class HomeApiRepository {
  final String api = "https://pokeapi.co/api/v2/pokemon/";

  Future<http.Response> getCharacters() async {
    Uri uri = Uri.parse(api);
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  Future<http.Response> getCharactersByName(String name) async {
    Uri uri = Uri.parse("$api$name");
    return await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
