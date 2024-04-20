import 'package:pokeapi/config.dart';
import 'package:pokeapi/extensions/string_extension.dart';

class Pokemon {
  String nome;
  String url;

  Pokemon({required this.nome, required this.url});

  int id() {
    var codding = url.replaceAll(linkServer, '').replaceAll('/', '');
    return codding.toInt(valueDefault: 1);
  }

  String image() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${id()}.png';
  }
}
