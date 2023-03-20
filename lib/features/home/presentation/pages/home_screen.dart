import 'package:aventura_com_bako/features/galeria/presentation/pages/galeria_screen.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MemoryGameModel _gameModel = MemoryGameModel();
  final GamificationUser gamificationUser = GamificationUser();
  @override
  void initState() {
    super.initState();
    _gameModel.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.menu),
      //       );
      //     },
      //   ),
      //   title: Image.asset(
      //     'assets/idv.png',
      //     fit: BoxFit.contain,
      //     height: 45,
      //   ),
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/background_forest.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Center(
          //   child: Column(
          //     children: [
          //       Card(
          //         child: Container(
          //           color: Colors.green,
          //           child: TextButton(
          //             child: const Text(
          //               'Mapa',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             onPressed: () {
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => const WelcomePage(),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/idv.png',
                    fit: BoxFit.contain,
                    height: 70,
                  ),
                  const SizedBox(width: 8),
                  Builder(
                    builder: (context) => SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                          /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        );*/
                        },
                        child: const Icon(
                          Icons.menu,
                          size: 60,
                          // color: kBrandColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/idv.png',
                      fit: BoxFit.contain,
                      height: 70,
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Wrap(
                runSpacing: 5,
                children: [
                  ListTile(
                    leading: Icon(Icons.forest),
                    title: const Text('Passeio no bosque'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      );
                    },
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.videogame_asset),
                    title: const Text('Jogos'),
                    children: [
                      ListTile(
                        leading: Icon(Icons.abc),
                        title: const Text('Caça-Palavras'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeCacaPalavras(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.question_mark),
                        title: const Text('Quizz'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageQuizz(
                                gamification: gamificationUser,
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.remember_me),
                        title: const Text('Jogo da memória'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageMemoryGame(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Icon(Icons.photo),
                    title: const Text('Galeria'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.label),
                    title: const Text('Item 4'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
