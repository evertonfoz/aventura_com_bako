import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/configuracoes/presentarion/configuracoesPage.dart';
import 'package:aventura_com_bako/features/galeria/presentation/pages/galeria_screen.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/presentation/pages/home_game_page.dart';
import 'package:aventura_com_bako/features/gamificacao/quizz/presentation/pages/home_page.dart';
import 'package:aventura_com_bako/features/loja/presentation/loja_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.user, required this.audioController, Key? key})
      : super(key: key);

  GamificationUser user;
  AudioController audioController;
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  refresh() {
    setState(() {});
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
              'assets/images/Inicial2_1080x1920.png',
              fit: BoxFit.fill,
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
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Bako_1281x1423.png',
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.45,
                  )
                ],
              ),
            ),
          ),
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
        backgroundColor: Colors.lightGreen,
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
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.user.userName.toString()),
                    ),
                  ),
                  _placar(widget.user.pontuacao),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(10),
              child: Wrap(
                runSpacing: 5,
                children: [
                  ListTile(
                    leading: const Icon(Icons.map),
                    title: const Text(
                      'Passeio no bosque',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(
                            audioController: widget.audioController,
                            user: widget.user,
                          ),
                        ),
                      );
                    },
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.videogame_asset),
                    title: const Text(
                      'Jogos',
                      style: TextStyle(fontSize: 20),
                    ),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.abc),
                        title: const Text(
                          'Caça-Palavras',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeCacaPalavras(
                                  user: widget.user, notifyParent: refresh),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.question_mark),
                        title: const Text(
                          'Quizz',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageQuizz(
                                user: widget.user,
                                notifyParent: refresh,
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.remember_me),
                        title: const Text(
                          'Jogo da memória',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          alertDificulty();
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo),
                    title: const Text(
                      'Galeria',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryScreen(
                                    audioController: widget.audioController,
                                    user: widget.user,
                                  )));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text(
                      'Loja',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LojaScreen(
                                    user: widget.user,
                                    notifyParent: refresh,
                                  )));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text(
                      'Opções',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfiguracoesScreen(
                                    audioController: widget.audioController,
                                  )));
                    },
                  ),
                ],
              ),
            ),
            // Opacity(
            //   opacity: 0.5,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image:
            //             ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
            //         fit: BoxFit.fitHeight,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<bool?> alertDificulty() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          elevation: 8,
          title: Text(
            'Qual Dificuldade deseja Jogar?',
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageMemoryGame(
                          audioController: widget.audioController,
                          isEasy: false,
                          user: widget.user,
                          notifyParent: refresh,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.amber),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Difícil',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageMemoryGame(
                          audioController: widget.audioController,
                          isEasy: true,
                          user: widget.user,
                          notifyParent: refresh,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.amber),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Fácil',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.amber),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _placar(valor) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(5),
    width: 100,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white60,
    ),
    child: Column(
      children: [
        const Text('Sementes:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/saco-de-sementes.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              valor.toString(),
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
