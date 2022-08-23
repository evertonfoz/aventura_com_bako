import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 60,
                        // color: kBrandColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
