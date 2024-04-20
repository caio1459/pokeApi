import 'package:flutter/material.dart';
import 'package:pokeapi/datasources/remote/pokemon_remote.dart';
import 'package:pokeapi/models/pokemon.dart';
import 'package:pokeapi/ui/pages/detalhes_page.dart';
import 'package:pokeapi/ui/widgets/circulo_espera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pokedex',
              style: TextStyle(
                color: Colors.amber.shade500,
              )),
          backgroundColor: Colors.blue.shade900,
        ),
        body: FutureBuilder(
          future: PokemonRemote().get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEspera();
              default:
                return _criarLista(context, snapshot.data ?? []);
            }
          },
        ),
      ),
    );
  }

  Widget _criarLista(BuildContext context, List<Pokemon> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: GestureDetector(
            child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Image.network(
                      lista[index].image(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Text(
                        lista[index].nome,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetalhesPage(pokemon: lista[index])));
            },
          ),
        );
      },
    );
  }
}
