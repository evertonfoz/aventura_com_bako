import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:eca_packages/eca_packages.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/bako_vetor.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Galeria',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/bako_vetor.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return RawMaterialButton(
                    child: InkWell(
                      child: Ink.image(
                        image: AssetImage("assets/Paineira-rosa-1.jpg"),
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onPressed: () {
                      /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryWidget(
                                        urlImages: urlImages,
                                        index: index,
                                      )));*/
                    },
                  );
                },
                itemCount: 2, //transformedImages.length,
              ))
        ],
      ),
    );
  }
}
