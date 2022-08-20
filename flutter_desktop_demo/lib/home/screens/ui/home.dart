import 'package:flutter/material.dart';
import 'package:flutter_desktop_demo/home/controllers/home_controller.dart';
import 'package:flutter_desktop_demo/home/models/character.dart';
import 'package:flutter_desktop_demo/home/screens/widgets/characters_card.dart';
import 'package:flutter_desktop_demo/utils/widgets/drawer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex APP"),
      ),
      drawer: const DrawerApp(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: getCharacters(),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: homecontroller.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<CharacterDTO> characters = snapshot.data ?? [];
            final bool characterCounter = characters.isNotEmpty;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacters(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: characters[index]);
        });
  }
}
