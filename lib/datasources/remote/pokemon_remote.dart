import 'package:pokeapi/config.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/services/client_http.dart';

class PokemonRemote {
  final _clientHttp = ClientHttp();

  Future<List<Pokemon>> get() async {
    final list = await _clientHttp.getJson(linkAPI);
    await Future.delayed(const Duration(seconds: 3));
    return list.map((e) => Pokemon(nome: e["name"], url: e["url"])).toList();
  }
}
