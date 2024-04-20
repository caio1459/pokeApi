import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon.dart';

class DetalhesPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetalhesPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pokemon.nome,
              style: TextStyle(
                color: Colors.amber.shade500,
              )),
          backgroundColor: Colors.blue.shade900,
        ),
        body: ListView(
          children: [
            Image.network(
              pokemon.image(),
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
